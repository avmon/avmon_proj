#!/usr/bin/python

import rospy
import time
import RPi.GPIO as GPIO
import math

from geometry_msgs.msg import Twist
from sensor_msgs.msg import Range
from raspicam_node.msg import Perception_var, Parking
from low_level_control.msg import low_level_msg, low_level_msg_ref_mon

GPIO.cleanup()
GPIO.setmode(GPIO.BOARD) # GPIO Mode

# GPIO Pins
pwm_pin_L = 32
forward_pin_L = 16
backward_pin_L = 18

pwm_pin_R = 33
forward_pin_R = 11
backward_pin_R = 13

feedback_pin_L = 7
feedback_pin_R = 12

# Vehicle Parameters
width = 0.135 # meter
radius = 0.035 # meter

# control frequency
rate_HZ = 20

# keyboard flag
key_up_flag = 0
key_down_flag = 0
key_left_flag = 0
key_right_flag = 0

# Parking sequence count/flag
parking_state = 0 # 0: not parking, 1: left turn, 2: go straight, 3: right turn, 4: go straight
parking_adjust = False # pid adjust around when true and state = 1/3
parking_adjust_count = 0
parking_direct_right_turn_count = 13
parking_direct_left_turn_count = 13
parking_wait_count_1 = 0
parking_wait_count_2 = 0

start_speed = 1.0 # regular speed
tram_speed = 0.36 # slow at tram
parking_speed = 0.68 # parking lap speed

time_start = time.time()
parking_time = 10 # start parking time (180s)

# two wheels
class wheel():
    def __init__(self, L_R, direction=1, offset=0): # L=0, R=1; Forward=1, Backward=-1
        self.PWM_Duty = 0 # 0~100
        self.K = 0
        self.direct_K = 0
        self.desire = 0
        self.offset = offset # motor speed offset
        self.L_R = L_R
        self.feedback_speed = 0
        self.last_error = 0
        
        self.lowest = 0.3
        self.hightest = 1.7

        self.direct_control_flag = False
        
        # set pin id
        if self.L_R == 0:
            self.pwm_pin = pwm_pin_L
            self.forward_pin = forward_pin_L
            self.backward_pin = backward_pin_L
            self.feedback_pin = feedback_pin_L
        elif self.L_R == 1:
            self.pwm_pin = pwm_pin_R
            self.forward_pin = forward_pin_R
            self.backward_pin = backward_pin_R
            self.feedback_pin = feedback_pin_R

        # set init direction
        self.direction = direction # move direction

        # Initialize speed control pwm (60Hz, 0 speed)
        GPIO.setup(self.pwm_pin, GPIO.OUT)
        self.pwm_handle = GPIO.PWM(self.pwm_pin, 60) # frequency
        self.pwm_handle.start(self.PWM_Duty)

        # Initialized direction control pins (forward)
        GPIO.setup(self.forward_pin, GPIO.OUT)
        GPIO.setup(self.backward_pin, GPIO.OUT)
        GPIO.output(self.forward_pin, GPIO.HIGH)
        GPIO.output(self.backward_pin, GPIO.LOW)
        
        # Feedback set up
        GPIO.setup(self.feedback_pin, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
        GPIO.add_event_detect(self.feedback_pin, GPIO.RISING, bouncetime=2)  # add rising edge detection on a channel
        GPIO.add_event_callback(self.feedback_pin, self.feedback)
    
    # Two-wheel Drive Model @ Low Speed
    def value_mapping_low(self, vehicle_speed, vehicle_omega):
        if self.L_R == 0:
            self.desire = vehicle_speed - width*vehicle_omega/2 # 0.135*25/2=1.6785
            
        elif self.L_R == 1:
            self.desire = vehicle_speed + width*vehicle_omega/2
                
        if self.desire >= 0:
            self.direction = 1
        else:
            self.direction = -1
    
    # Two-wheel Drive Model @ Nomal
    def value_mapping(self, vehicle_speed, vehicle_omega, another_state):

        if self.L_R == 0:
            self.desire = vehicle_speed - width*vehicle_omega/2 # 0.135*25/2=1.6785
            #print '    L: Mapping Desire speed: ', self.desire
            #print '    L: Another_state: ', another_state
        elif self.L_R == 1:
            self.desire = vehicle_speed + width*vehicle_omega/2
            #print '    R: Mapping Desire speed: ', self.desire
            #print '    R: Another_state: ', another_state
        if self.desire >= 0:
            self.direction = 1
        else:
            self.direction = -1
        
        # low_pos, low_neg, high_pos, high_neg, pass_pos, pass_neg, zero, pass_anyway
        if abs(self.desire) < self.lowest and self.desire != 0:
            
            if self.desire > 0:
                if another_state == "high_neg":
                    self.desire = self.lowest
                    state = "low_pos"
                elif another_state == "high_pos":
                    self.desire = 0
                    state = "zero"
                elif another_state == "low_neg": # cannot maintain the same rotation speed
                    self.desire = self.lowest
                    state = "pass_anyway"
                elif another_state == "low_pos": # cannot maintain the same rotation speed
                    self.desire = 0
                    state = "pass_anyway"
                elif another_state == "zero": # cannot maintain the same rotation speed
                    self.desire = self.lowest
                    state = "pass_anyway"
                elif another_state == "pass_pos":
                    self.desire = self.lowest
                    state = "low_pos"
                elif another_state == "pass_neg":
                    self.desire = 0
                    state = "zero"
                else:
                    self.desire = 0
                    state = "zero"
            elif self.desire < 0:
                if another_state == "high_neg":
                    self.desire = 0
                    state = "zero"
                elif another_state == "high_pos":
                    self.desire = -self.lowest
                    state = "low_neg"
                elif another_state == "low_neg": # cannot maintain the same rotation speed
                    self.desire = 0
                    state = "pass_anyway"
                elif another_state == "low_pos": # cannot maintain the same rotation speed
                    self.desire = -self.lowest
                    state = "pass_anyway"
                elif another_state == "zero": # cannot maintain the same rotation speed
                    self.desire = -self.lowest
                    state = "pass_anyway"
                elif another_state == "pass_pos":
                    self.desire = 0
                    state = "zero"
                elif another_state == "pass_neg":
                    self.desire = -self.lowest
                    state = "low_neg"
                else:
                    self.desire = 0
                    state = "zero"

        elif abs(self.desire) > self.hightest:
            if self.desire > 0:
                self.desire = self.hightest
                state = "high_pos"
                if another_state == "high_neg": # rotation speed is out of controllable range
                    self.desire = self.hightest
                    state = "pass_anyway"
                elif another_state == "high_pos": # linear speed is out of controllable range
                    self.desire = self.hightest
                    state = "pass_anyway"
                elif another_state == "low_neg":
                    self.desire = self.hightest
                    state = "high_pos"
                elif another_state == "low_pos":
                    self.desire = self.hightest
                    state = "high_pos"
                elif another_state == "zero":
                    self.desire = self.hightest
                    state = "high_pos"
                elif another_state == "pass_pos":
                    self.desire = self.hightest
                    state = "high_pos"
                elif another_state == "pass_neg":
                    self.desire = self.hightest
                    state = "high_pos"
            else:
                self.desire = -self.hightest
                state = "high_neg"
                if another_state == "high_neg": # rotation speed is out of controllable range
                    self.desire = -self.hightest
                    state = "pass_anyway"
                elif another_state == "high_pos": # linear speed is out of controllable range
                    self.desire = -self.hightest
                    state = "pass_anyway"
                elif another_state == "low_neg":
                    self.desire = -self.hightest
                    state = "high_neg"
                elif another_state == "low_pos":
                    self.desire = -self.hightest
                    state = "high_neg"
                elif another_state == "zero":
                    self.desire = -self.hightest
                    state = "high_neg"
                elif another_state == "pass_pos":
                    self.desire = -self.hightest
                    state = "high_neg"
                elif another_state == "pass_neg":
                    self.desire = -self.hightest
                    state = "high_neg"

        elif self.desire > 0:
            state = "pass_pos"
        else:
            state = "pass_neg"
        #print '    Self state: ', state
        return state
    
    # Two-wheel Drive Model @ Remap
    def value_remapping(self, vehicle_omega):
        if self.L_R == 0:
            vehicle_speed = self.desire + width*vehicle_omega/2 # 0.135*25/2=1.6785
            #print '    L: Re Mapping Desire speed: ', self.desire
        elif self.L_R == 1:
            vehicle_speed = self.desire - width*vehicle_omega/2
            #print '    R: Re Mapping Desire speed: ', self.desire
        return vehicle_speed
    
    # Speed Encoder Callback
    def feedback(self, feedback_pin):
        if self.L_R == 0:
            self.K += 1  # should be computed by the length of perimeter of the wheel divided by the number of counter in a circle
            if self.direct_control_flag == True:
                self.direct_K += 1
        elif self.L_R == 1:
            self.K += 1  # should be computed by the length of perimeter of the wheel divided by the number of counter in a circle
            if self.direct_control_flag == True:
                self. direct_K += 1
        self.feedback_speed = self.K * 0.00973893706 * rate_HZ # r*2*pi/20

    # Wheel Speed Control via PD (speed error to pwm duty)
    def feedback_PID(self):
        if self.L_R == 0:
            Kp = 10 # parameter for PD controller
            Kd = 20 # parameter for PD controller
        elif self.L_R == 1:
            Kp = 10  # parameter for PD controller
            Kd = 20  # parameter for PD controller

        if self.desire >= 0:
            desire_speed = self.desire
        else:
            desire_speed = -self.desire

        error = desire_speed - self.feedback_speed

        self.PWM_Duty = self.PWM_Duty + ( Kp * error + (error - self.last_error) * Kd )

        self.last_error = error

          # limit
        if self.PWM_Duty < 0:
              self.PWM_Duty = 0
        if self.PWM_Duty > 100:
            self.PWM_Duty = 100    

# Low level control
class LLC():
    def __init__(self):
        rospy.loginfo('Setting Up the Node...')
        rospy.init_node('c_llc')

        self.wheels = {}
        self.wheels['left'] = wheel(0)
        self.wheels['right'] = wheel(1)
        rospy.loginfo('Wheels Initialized...')

        # Mode Enable
        self.parking_flag = False 
        self.emergency_stop = 0 # Use lidar to emergency stop only
        self.parking_cmd = False

        # Vehicle State
        self.longitudinal_speed = 0 # Vehicle speed 0~100
        self.rotation_speed = 0 # Vehicle omega 0~25, +: clockwise

        # Vehicle Parameters
        self.l_start = start_speed # linear: keyboard control speed
        self.r_start = 2*math.pi/1.0  # rotational: 2*math.pi/1.2 rad/s ~ 2*math.pi*3 rad/s
        self.r_max = 2*math.pi * 4

        # Angle Error Parameters
        self._angle_error = 0
        self._last_time_angle_error = 0

        self._high_kp_camera = 0.058 # 0.05
        self._high_kd_camera = 0.52 # 0.25

        self._low_kp_camera = 0.035 # 0.05
        self._low_kd_camera = 0.23 # 0.25

        self._parking_kp_camera = 0.06
        self._parking_kd_camera = 0
        
        # J-shape Stage (in camera fraq)
        self.jshape_stage = 6 # init stage (where you put vehicle on)
        self.jshape_stage_last = 0 # init duration
        self.jshape_threshold_last = 0
        self.parking_stage_update = False

        
        # Moving Average Calculation (in camera fraq)
        self._pre_angle_error_1 = 0.0 
        self._pre_angle_error_2 = 0.0
        self._pre_angle_error_3 = 0.0
        self._pre_angle_error_4 = 0.0
        
        # Car-following Parameters
        self.cf_flag = False
        self.min_headway = 0.2 # emergency stop thr
        self.desire_headway = 0.5 # car-following distance
        self._last_time_headway_error = 0
        self._kp_cf = 0.8
        self._kd_cf = 0 #0.2

        # Communication Parameters
        self.leader_linear_speed = 0
        self.leader_rotation_speed = 0
        self.leader_J_stage = 0
        self.leader_parking_stage = 5

        self.tram_timer = 0
        self.tram_timer_flag = False

        # Create low level publisher
        self.pub = rospy.Publisher('c_low_level', low_level_msg, queue_size=1)
        rospy.loginfo('Low Level Publisher Initialized')
		
		self.pub_rm = rospy.Publisher('c_low_level_ref_mon', low_level_msg_ref_mon, queue_size=1)	
        rospy.loginfo('Reference Monitor Publisher Initialized')	

        # Create key subscriber
        self.ros_sua_twist = rospy.Subscriber('/turtle1/cmd_vel', Twist, self.key_act)
        rospy.loginfo('Keyboard Subscriber Initialized')

        # Create radar subscriber
        self.ros_sub_radar = rospy.Subscriber('/c_vl53l1x/arange', Range, self.lidar_act)
        rospy.loginfo('Radar Subscriber Initialized')

        # Create camera subscriber
        self.ros_sub_camera = rospy.Subscriber('/c_lane_tracking', Perception_var, self.camera_act)
        rospy.loginfo('Camera Subscriber Initialized')

        # Creare parking subscriber
        self.ros_sub_parking = rospy.Subscriber('c_parking', Parking, self.parking_act)
        rospy.loginfo('Parking Subscriber Initialized')

        # Creare leading vehicle subscriber
        self.ros_sub_leader = rospy.Subscriber('/b_low_level', low_level_msg, self.leader_act)
        rospy.loginfo('Leader Subscriber Initialized')

    # Remapping from longitudinal/rotation speed to desired motor speed
    def mapping2wheel(self):
        state_left = "start"
        state_right = "start"
        if self.longitudinal_speed <= 5:
            self.wheels['left'].value_mapping_low(self.longitudinal_speed, self.rotation_speed)
            self.wheels['right'].value_mapping_low(self.longitudinal_speed, self.rotation_speed)
        else:
            while not ("pass" in state_left and "pass" in state_right or state_left == "pass_anyway" or state_right == "pass_anyway"):
                state_left = self.wheels['left'].value_mapping(self.longitudinal_speed, self.rotation_speed, state_right)
                if not "pass" in state_left:
                    self.longitudinal_speed = self.wheels['left'].value_remapping(self.rotation_speed)
                state_right = self.wheels['right'].value_mapping(self.longitudinal_speed, self.rotation_speed, state_left)
                if not "pass" in state_right:
                    self.longitudinal_speed = self.wheels['right'].value_remapping(self.rotation_speed)
    
    # Keyboard Callback
    def key_act(self, message):
        print 'Keyboard Command...'
        global key_up_flag
        global key_down_flag
        global key_left_flag
        global key_right_flag

        if key_up_flag == 0:
            if message.linear.x > 0:
                self.longitudinal_speed = self.l_start
                key_up_flag = 1
                key_down_flag = 0
        else:
            if message.linear.x > 0:
                self.longitudinal_speed = 0
                key_up_flag = 0

        if key_down_flag == 0:
            if message.linear.x < 0:
                self.longitudinal_speed = -self.l_start
                key_down_flag = 1
                key_up_flag = 0
        else:
            if message.linear.x < 0:
                self.longitudinal_speed = 0
                key_down_flag = 0

        if key_left_flag == 0:
            if message.angular.z > 0:
                self.rotation_speed = -self.r_start
                key_left_flag = 1
                key_right_flag = 0
        else:
            if message.angular.z > 0:
                self.rotation_speed = 0
                key_left_flag = 0

        if key_right_flag == 0:
            if message.angular.z < 0:
                self.rotation_speed = self.r_start
                key_right_flag = 1
                key_left_flag = 0
        else:
            if message.angular.z < 0:
                self.rotation_speed = 0
                key_right_flag = 0
        
        self.mapping2wheel() # set values for motors    
    
    # Lidar Callback
    def lidar_act(self, message):
        print 'Lidar Command...'
        #print 'Lidar message: ', message.range #.header.stamp.nsecs
        self.emergency_stop = False # initial value
        headway_error = 0 # initial value
        
        headway = message.range # read from LiDAR
        
        # Car-following Mode (>0.2m, keep 0.5m) 
        if key_up_flag == 1:
            if headway > self.min_headway:
                if self.jshape_stage == self.leader_J_stage and (self.jshape_stage == 1 or self.jshape_stage == 3 or self.jshape_stage == 6) and not self.parking_flag and not self.stop_at_intersection and self.urban_turning_flag == 0:
                    self.cf_flag = True
                    headway_error = headway - self.desire_headway
                    pid = headway_error * self._kp_cf + (headway_error - self._last_time_headway_error) * self._kd_cf
                    if pid > 0.2:
                        pid = 0.2
                    if pid < -0.2:
                        pid = -0.2
                    self.longitudinal_speed = self.longitudinal_speed + pid
                    
                    if self.longitudinal_speed > 1.1:
                        self.longitudinal_speed = 1.1
                    if self.longitudinal_speed < 0.6:
                        self.longitudinal_speed = 0.6
                else:
                    self.cf_flag = False
                
            # Emergency Stop Mode
            else:
                self.emergency_stop = True
                self.longitudinal_speed = 0
                self.rotation_speed = 0
            
        self._last_time_headway_error = headway_error
        
        # Satuator
        self.mapping2wheel() # set values for motors
   
    # Camera Callback
    def camera_act(self, message):
        print 'Camera Command...: ', time.time() - time_start, 's'

        global key_left_flag
        global key_right_flag

        left_thr = -18 # stage calculation thereshold
        right_thr = 22 # stage calculation thereshold
        straight_thr = 15 # stage calculation threshold 
        stage_last_duration = 8 # minimum stage last time
        threshold_duration = 4

        # change run speed at tram
        if message.at_tram == True and self.tram_timer_flag == False:
            self.tram_timer = time.time()
            self.tram_timer_flag = True

        current_tram_time = time.time() - self.tram_timer

        # Slow 2.5 seconds
        if self.tram_timer_flag == True and current_tram_time > 2.5:
            self.tram_timer = 0
            self.tram_timer_flag = False

        # Set l_start
        if self.tram_timer_flag == True:
            self.l_start = tram_speed
        elif self.parking_cmd == True:
            self.l_start = parking_speed
        elif self.parking_cmd == False:
            self.l_start = start_speed

        # when no keyboard control, no emergency stop, parking_flag = Falsem, set to l_start
        if key_left_flag == 0 and key_right_flag == 0 and self.emergency_stop == False and self.parking_flag == False:
            if key_up_flag == 1:
                self.longitudinal_speed = self.l_start
            if key_down_flag == 1:
                self.longitudinal_speed = -self.l_start

            # lane tracking error
            angle_error = message.steering_error
            self._angle_error = angle_error

            # J-shape stage estimation
            if self.jshape_stage == 1:
                self.jshape_stage_last += 1
                if self.jshape_stage_last > stage_last_duration and angle_error < left_thr:
                    self.jshape_threshold_last += 1

                    if self.jshape_threshold_last > threshold_duration:
                        self.jshape_stage += 1
                        self.jshape_threshold_last = 0
                        self.jshape_stage_last = 0
                else:
                    self.jshape_threshold_last = 0
            elif self.jshape_stage == 2:
                self.jshape_stage_last += 1
                if self.jshape_stage_last > stage_last_duration and abs(angle_error) <= straight_thr: # straight
                    self.jshape_threshold_last += 1

                    if self.jshape_threshold_last > threshold_duration:
                        self.jshape_stage += 1
                        self.jshape_threshold_last = 0
                        self.jshape_stage_last = 0
                else:
                    self.jshape_threshold_last = 0
            elif self.jshape_stage == 3:
                self.jshape_stage_last += 1
                if self.jshape_stage_last > stage_last_duration and angle_error > right_thr:
                    self.jshape_threshold_last += 1

                    if self.jshape_threshold_last > threshold_duration:
                        self.jshape_stage += 1
                        self.jshape_threshold_last = 0
                        self.jshape_stage_last = 0
                else:
                    self.jshape_threshold_last = 0
            elif self.jshape_stage == 4:
                self.jshape_stage_last += 1
                if self.jshape_stage_last > stage_last_duration and angle_error < left_thr:
                    self.jshape_threshold_last += 1

                    if self.jshape_threshold_last > threshold_duration:
                        self.parking_stage_update = False
                        self.jshape_stage += 1
                        self.jshape_threshold_last = 0
                        self.jshape_stage_last = 0
                else:
                    self.jshape_threshold_last = 0
            elif self.jshape_stage == 5:
                self.jshape_stage_last += 1
                if self.jshape_stage_last > stage_last_duration and abs(angle_error) <= straight_thr: # straight
                    self.jshape_threshold_last += 1

                    if self.jshape_threshold_last > threshold_duration:
                        self.jshape_stage += 1
                        self.jshape_threshold_last = 0
                        self.jshape_stage_last = 0
                else:
                    self.jshape_threshold_last = 0
            elif self.jshape_stage == 6:
                self.jshape_stage_last += 1
                if self.jshape_stage_last > stage_last_duration and angle_error < left_thr:
                    self.jshape_threshold_last += 1

                    if self.jshape_threshold_last > threshold_duration:
                        self.jshape_stage += 1
                        self.jshape_threshold_last = 0
                        self.jshape_stage_last = 0
                else:
                    self.jshape_threshold_last = 0
            elif self.jshape_stage == 7:
                self.jshape_stage_last += 1
                if self.jshape_stage_last > stage_last_duration and abs(angle_error) <= straight_thr: # straight
                    self.jshape_threshold_last += 1

                    if self.jshape_threshold_last > threshold_duration:
                        self.jshape_stage = 1
                        self.jshape_threshold_last = 0
                        self.jshape_stage_last = 0
                else:
                    self.jshape_threshold_last = 0

            # PID for lane tracking
            if self.tram_timer_flag == False:
                if self.longitudinal_speed >= 0.8:
                    self.rotation_speed = self._high_kp_camera * angle_error + self._high_kd_camera * (angle_error - self._last_time_angle_error)
                else:
                    self.rotation_speed = self._low_kp_camera * angle_error + self._low_kd_camera * (angle_error - self._last_time_angle_error)
            else:
                if self.longitudinal_speed >= 0.8:
                    self.rotation_speed = self._high_kp_camera * angle_error
                else:
                    self.rotation_speed = self._low_kp_camera * angle_error

            # Saturator
            if self.rotation_speed > self.r_max:
                self.rotation_speed = self.r_max
            if self.rotation_speed < -self.r_max:
                self.rotation_speed = -self.r_max
            
            # Update for PID
            self._last_time_angle_error = angle_error

            # l, r to disire
            self.mapping2wheel()
    
    # Parking Callback
    def parking_act(self, message):
        print 'Parking Command...: ', time.time() - time_start, 's'
        global parking_state
        global parking_adjust
        global parking_adjust_count
        parking_adjust_step = 10 # in parking freq

        # J-shape stage correction using parking flag
        if self.parking_stage_update == False:
            self.parking_stage_update = message.begin_parking
            if self.parking_stage_update == True:
                self.jshape_stage = 4

        # Wait for True Flag (will not come back if True)
        if self.parking_flag == False and self.parking_cmd == True:
            self.parking_flag = message.begin_parking
            if self.parking_flag == True:
                print '**Start Parking**'
                parking_state = 1

        # Parking Logic (close-loop part)
        if parking_state == 2:
            if parking_adjust:
                print '**Parking Adjust 1 (callback)**'
                self.longitudinal_speed = 0
                angle_error = message.parking_stg1_steering_error
                self._angle_error = angle_error
                self.rotation_speed = self._parking_kp_camera * angle_error + self._parking_kd_camera * (angle_error - self._last_time_angle_error)

                if self.rotation_speed > self.r_max/2.0:
                    self.rotation_speed = self.r_max/2.0
                if self.rotation_speed < -self.r_max/2.0:
                    self.rotation_speed = -self.r_max/2.0

                # Update for PID
                self._last_time_angle_error = angle_error
                # l, r to disire
                self.mapping2wheel()
                if parking_adjust_count < parking_adjust_step:
                    parking_adjust_count += 1                    
                else:
                    parking_adjust = False
                    parking_adjust_count = 0
            else:
                print '**First Straight (callback)**'
                # tracking and stop
                if message.parking_stg1_stop == False and self.emergency_stop == False:
                    if self.longitudinal_speed == 0:
                        self.longitudinal_speed = self.l_start
                    angle_error = message.parking_stg1_steering_error
                    self._angle_error = angle_error
                    self.rotation_speed = self._low_kp_camera * angle_error + self._low_kd_camera * (angle_error - self._last_time_angle_error)
                    if self.rotation_speed > self.r_max:
                        self.rotation_speed = self.r_max
                    if self.rotation_speed < -self.r_max:
                        self.rotation_speed = -self.r_max

                    # Update for PID
                    self._last_time_angle_error = angle_error
                    # l, r to disire
                    self.mapping2wheel()
                else:
                    parking_state = 3

        if parking_state == 4:
            if parking_adjust:
                print '**Parking Adjust 2 (callback)**'
                self.longitudinal_speed = 0
                angle_error = message.parking_stg2_steering_error
                self._angle_error = angle_error
                self.rotation_speed = self._parking_kp_camera * angle_error + self._parking_kd_camera * (angle_error - self._last_time_angle_error)

                if self.rotation_speed > self.r_max/2.0:
                    self.rotation_speed = self.r_max/2.0
                if self.rotation_speed < -self.r_max/2.0:
                    self.rotation_speed = -self.r_max/2.0

                # Update for PID
                self._last_time_angle_error = angle_error
                # l, r to disire
                self.mapping2wheel()
                
                if parking_adjust_count < parking_adjust_step:
                    parking_adjust_count += 1
                else:
                    parking_adjust = False
                    parking_adjust_count = 0
            else:
                print '**Second Straight (callback)**'
                # tracking and stop
                if message.parking_stg2_stop == False and self.emergency_stop == False:
                    if self.longitudinal_speed == 0:
                        self.longitudinal_speed = self.l_start
                    angle_error = message.parking_stg2_steering_error
                    self._angle_error = angle_error
                    self.rotation_speed = self._low_kp_camera * angle_error + self._low_kd_camera * (angle_error - self._last_time_angle_error)
                    if self.rotation_speed > self.r_max:
                        self.rotation_speed = self.r_max
                    if self.rotation_speed < -self.r_max:
                        self.rotation_speed = -self.r_max
                    
                    # Update for PID
                    self._last_time_angle_error = angle_error
                    # l, r to disire
                    self.mapping2wheel()
                else:
                    parking_state = 5
        
        if parking_state == 5:
            # Stop After Parking
            self.longitudinal_speed = 0
            self.rotation_speed = 0
            # l, r to disire
            self.mapping2wheel()

    # Leader Callback
    def leader_act(self, message):
        self.leader_linear_speed = message.linear_speed
        self.leader_rotation_speed = message.rotation_speed
        self.leader_J_stage = message.J_stage
        self.leader_parking_stage = message.parking_stage

        if not (self.emergency_stop or not self.parking_flag or self.leader_parking_stage != 0):
            self.longitudinal_speed = self.leader_linear_speed

    # Update Pins Value and close-loop control (every control step)
    def control_update(self):
        global parking_state
        global parking_adjust
        global parking_direct_right_turn_count
        global parking_direct_left_turn_count
        global parking_wait_count_1
        global parking_wait_count_2
        
        if time.time()-time_start >= parking_time:
            print '######################parking lap#################'
            self.l_start = parking_speed
            self.parking_cmd = True

        # Parking Logic (open-loop part)
        if self.parking_flag == True:
            if parking_state == 1:
                if self.leader_parking_stage < 5:
                    print '************Wait for Parking*******************'
                    self.longitudinal_speed = 0
                    self.rotation_speed = 0
                else:
                    print '***Right Turn***'
                    if parking_wait_count_1 < 20:
                        print 'Wait 1........', parking_wait_count_1, '(Wait 2) ', parking_wait_count_2
                        self.longitudinal_speed = 0
                        self.rotation_speed = 0
                        parking_wait_count_1 += 1
                    elif not (self.wheels['left'].direct_K + self.wheels['right'].direct_K >= 2 * parking_direct_right_turn_count):
                            print 'Direct control ...', self.wheels['left'].direct_K, self.wheels['right'].direct_K
                            self.wheels['left'].direct_control_flag = True
                            self.wheels['right'].direct_control_flag = True
                            
                            # Set turning speed
                            self.longitudinal_speed = 0
                            self.rotation_speed = 2*math.pi/0.7

                    # Counter satisfied, stop and reset flag
                    if self.wheels['left'].direct_K + self.wheels['right'].direct_K >= 2 * parking_direct_right_turn_count:
                        print 'Wait 2......', parking_wait_count_2, '(Wait 1) ', parking_wait_count_1

                        self.longitudinal_speed = 0
                        self.rotation_speed = 0

                        if parking_wait_count_2 < 20:
                            parking_wait_count_2 += 1
                            
                        else:
                            self.wheels['left'].direct_control_flag = False
                            self.wheels['right'].direct_control_flag = False
                            self.wheels['left'].direct_K = 0
                            self.wheels['right'].direct_K = 0
                            parking_wait_count_1 = 0
                            parking_wait_count_2 = 0
                            parking_state = 2 # state update
                            parking_adjust = True

            elif parking_state == 2:
                fool = 1
                # print 'stage 2'

            elif parking_state == 3:
                print '***Left Turn***'
                if parking_wait_count_1 < 20:
                    print 'Wait 1........', parking_wait_count_1, '(Wait 2) ', parking_wait_count_2
                    self.longitudinal_speed = 0
                    self.rotation_speed = 0
                    parking_wait_count_1 += 1
                elif not (self.wheels['left'].direct_K + self.wheels['right'].direct_K >= 2 * parking_direct_left_turn_count):
                    print 'Direct control ...', self.wheels['left'].direct_K, self.wheels['right'].direct_K
                    self.wheels['left'].direct_control_flag = True
                    self.wheels['right'].direct_control_flag = True

                    # Set turning speed
                    self.longitudinal_speed = 0
                    self.rotation_speed = -2*math.pi/0.7

                # Counter satisfied, stop and reset flag
                if self.wheels['left'].direct_K + self.wheels['right'].direct_K >= 2 * parking_direct_left_turn_count:
                    print 'Wait 2......', parking_wait_count_2, '(Wait 1) ', parking_wait_count_1
                    
                    self.longitudinal_speed = 0
                    self.rotation_speed = 0

                    if parking_wait_count_2 < 20:
                        parking_wait_count_2 += 1
                    else:
                        self.wheels['left'].direct_control_flag = False
                        self.wheels['right'].direct_control_flag = False
                        self.wheels['left'].direct_K = 0
                        self.wheels['right'].direct_K = 0
                        
                        parking_wait_count_1 = 0
                        parking_wait_count_2 = 0
                        parking_state = 4 # state update
                        parking_adjust = True

            elif parking_state ==4:
                fool = 1
                #print '************Second Straight*************'
        # l, r to disire
        self.mapping2wheel()

        # Direction Control (GPIO)
        if self.wheels['left'].direction == 1:
            GPIO.output(self.wheels['left'].forward_pin, GPIO.HIGH)
            GPIO.output(self.wheels['left'].backward_pin, GPIO.LOW)
        if self.wheels['left'].direction == -1:
            GPIO.output(self.wheels['left'].forward_pin, GPIO.LOW)
            GPIO.output(self.wheels['left'].backward_pin, GPIO.HIGH)

        if self.wheels['right'].direction == 1:
            GPIO.output(self.wheels['right'].forward_pin, GPIO.HIGH)
            GPIO.output(self.wheels['right'].backward_pin, GPIO.LOW)
        if self.wheels['right'].direction == -1:
            GPIO.output(self.wheels['right'].forward_pin, GPIO.LOW)
            GPIO.output(self.wheels['right'].backward_pin, GPIO.HIGH)

        # Wheel Speed Control
        self.wheels['left'].feedback_PID()
        self.wheels['right'].feedback_PID()

        # Wheel PWM Duty Update
        self.wheels['left'].pwm_handle.ChangeDutyCycle(self.wheels['left'].PWM_Duty)
        self.wheels['right'].pwm_handle.ChangeDutyCycle(self.wheels['right'].PWM_Duty)
        
        # log
        print '####', 'Stage: ', self.jshape_stage, ', Leader: ', self.leader_J_stage,', angle_error:', self._angle_error, ', ParkingStage, ', parking_state, '#####'
        print 'Command: Speed: ', self.longitudinal_speed, 'Omega: ', self.rotation_speed
        #print 'Tram timer:', self.tram_timer
        #print 'Direct Calculation: ', self.longitudinal_speed - width*self.rotation_speed/2, self.longitudinal_speed + width*self.rotation_speed/2
        #print 'Right: ', self.wheels['left'].direction, ', Desire: ', self.wheels['left'].desire, ', Duty: ', self.wheels['left'].PWM_Duty, self.wheels['left'].feedback_speed
        #print 'Left: ', self.wheels['right'].direction, ', Desire: ', self.wheels['right'].desire, ', Duty: ', self.wheels['right'].PWM_Duty, self.wheels['right'].feedback_speed
        #print 'Right feedback counter: ', self.wheels['left'].direct_K
        #print 'Left feedback counter: ', self.wheels['right'].direct_K
        
        if self.emergency_stop:
            print 'Emergency Stop!!!'
        if self.cf_flag:
            print 'Car Following!!!'

        
        # Wheel Speed Count Update
        self.wheels['left'].K = 0
        self.wheels['right'].K = 0

        # Publish Vehicle info
        current_low_level_msg = low_level_msg()
        current_low_level_msg.linear_speed = self.longitudinal_speed
        current_low_level_msg.rotation_speed = self.rotation_speed
        current_low_level_msg.J_stage = self.jshape_stage
        current_low_level_msg.parking_stage = parking_state
        self.pub.publish(current_low_level_msg)
		
		current_low_level_msg_rm = low_level_msg_ref_mon()
		current_low_level_msg_rm.linear_speed = self.longitudinal_speed
		current_low_level_msg_rm.rotation_speed = self.rotation_speed
		current_low_level_msg_rm.start_time = self.start_time
		current_low_level_msg_rm.angle = self.angle_error
		self.pub.publish(current_low_level_msg_rm)
        print '\n'

    def run(self):
        rate = rospy.Rate(rate_HZ)
        while not rospy.is_shutdown():
            self.control_update()
            rate.sleep()

if __name__ == "__main__":
    autotrac_llc = LLC()
    autotrac_llc.run()
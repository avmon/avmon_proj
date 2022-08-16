#!/usr/bin/python

import sys
import rospy
from low_level_control.msg import low_level_msg_ref_mon

import cv2
import numpy as np
import csv
import time
#from scipy.spatial.transform import Rotation as Rot
from numpy import pi, cos, sin, eye, array, zeros, unwrap, tan, arctan, std
from decimal import Decimal
import math


import tensorflow as tf

# Vehicle Parameters
width = 0.135 # meter
radius = 0.034 # meter

#########################   ANN               #########################################################

# Parameters
model_path = "Model_folder/ROS.ckpt"
# Define placeholders for input and ouput values
n_input = 3
n_output = 2
# tf Graph input
inputs = tf.placeholder(tf.float32, [None, n_input])
outputs = tf.placeholder(tf.float32, [None, n_output])
# Define fully-connected layer with 128 hidden units
h = tf.layers.dense(inputs, 128, activation=tf.nn.relu)
# Define fully-connected layer with 64 hidden units
h = tf.layers.dense(h, 64, activation=tf.nn.relu)
# Define fully-connected layer with 64 hidden units
h = tf.layers.dense(h, 64, activation=tf.nn.relu)
# Define fully-connected layer to 2 output2 prediction
pred = tf.layers.dense(h, 2, activation=None)

# Define variable initializer
init = tf.global_variables_initializer()

# 'Saver' op to save and restore all the variables
saver = tf.train.Saver()

#########################   scalling parameters #########################################################
min_1 = 0.0
min_2 = 0.0
min_3 = -90.0
min_4 = -10.0
min_5 = -10.0

max_1 = 1.0
max_2 = 1.0
max_3 = 90.0
max_4 = 10.0
max_5 = 10.0

#HEADER = ['time_excution']  
HEADER = ['linear_speed, rotation_speed, start_time, angle_radian, error_1, error_2, res_error_1, res_error_2, time_excution_1,time_excution_2']

linear_speed = 0
rotation_speed = 0
start_time = 0
angle_radian = 0    
pre_time  = 0.0
delta_time = 0.0
position = 0.0
error_1 = []
error_2 = []

x_hat = np.matrix([[0],[0]])        
Q = np.matrix([[2, 0],[ 0, 2]])
R = np.matrix([[.02, 0],[ 0, .02]])
Hk = np.matrix([[1, 0],[0, 1]])
P = np.matrix([[0, 0],[0, 0]])

def img_callback(data):
    global delta_time, linear_speed, rotation_speed, start_time, angle_radian, x_hat, Q, R, HK, P , width, radius, error_1, error_2, pre_time
    linear_speed = data.linear_speed
    rotation_speed = data.rotation_speed
    start_time = data.start_time
    angle_radian = data.angle
    startTime = time.time()
    
    if pre_time == 0.0:
        pre_time = start_time
    else:
        delta_time = start_time - pre_time
        pre_time = start_time

    
    position = delta_time * linear_speed
        
    gain = 0.2
    str_cmd = 0.0
    steering = gain * (str_cmd * (np.pi/180.0) - np.pi/2)              
    velocity = linear_speed                                       
    pos = position                                            
    angle = gain * (angle_radian - np.pi/2)                     
    
    lr = width / 2.0
    lf = width / 2.0
    
    dt = delta_time
    # needed matrices
    u = np.matrix([steering, velocity])
    y = np.matrix([[pos],[angle]])
    
    beta = np.arctan(lr / (lr + lf) * np.tan(u.item((0, 0))))
    dpos = u.item((0, 1)) * np.sin(x_hat.item((1, 0)) + beta)
    dangle = (u.item((0, 1)) / lr) * np.sin(beta)
    dx = np.matrix([[dpos],[dangle]])
    Fk = np.matrix([[0, velocity * np.cos(x_hat.item((1, 0)) + beta)],[0, 0]])
    K = np.matmul((np.matmul(P, Hk.transpose())), np.linalg.inv(R))
    x_hat = np.add(x_hat, np.multiply(dt, np.add(dx, np.matmul(K, np.subtract(y, np.matmul(Hk, x_hat))))))
    Pdot = np.add(np.add(np.matmul(Fk, P), np.matmul(P, Fk.transpose())), np.subtract(Q, np.matmul(np.matmul(K, Hk), P)))
    P = np.add(P, np.multiply(dt, Pdot))

    residual = np.subtract(x_hat, y)
    error_1.append(residual[0,0])
    error_2.append(residual[1,0])

    execut_time_1 = time.time()-startTime
    global min_1,min_2,min_3,min_4,min_5
    global max_1,max_2,max_3,max_4,max_5

    #Scalling
    delta_time = (delta_time - min_1) / (max_1 - min_1)
    linear_speed = (linear_speed - min_2) / (max_2 - min_2)
    angle_radian = (angle_radian - min_3) / (max_3 - min_3)
    res_0 = (residual[0] - min_4) / (max_4 - min_4)
    res_1 = (residual[1] - min_5) / (max_5 - min_5)

    #res = [abs(residual[0]), abs(residual[1])] 
    outouts_test = [abs(res_0), abs(res_1)] 
    inputs_test = [delta_time,linear_speed,angle_radian]
    
    inputs_test = np.array(inputs_test).reshape(1,3)
    prediction_values = sess.run([pred], feed_dict={inputs: inputs_test})
    prediction_values = np.array(prediction_values).reshape(-1,2)
    #print(prediction_values[0,0])
    #print(prediction_values[0,1])
    res_0_rev = (prediction_values[0,0] * (max_4 - min_4)) + min_4
    res_1_rev = (prediction_values[0,1] * (max_5 - min_5)) + min_5

    rsudial_savcrip_0 = linear_speed + res_0_rev
    rsudial_savcrip_1 = angle_radian + res_1_rev
   
    execut_time_2 = time.time()-startTime
    
    print 'time : ', execut_time
	
	#rows = [execut_time]
	rows = [linear_speed, rotation_speed, start_time, angle_radian, res_0, res_1, res_0_rev, res_1_rev, execut_time_1,execut_time_2]
    csvwriter.writerow(rows) 


        
       


def RefernceMonitor():
    global csvwriter
    topic = '/c_low_level_ref_mon'
   
    rospy.init_node('RefernceMonitor')
    rospy.Subscriber(topic, low_level_msg_ref_mon, img_callback)
      
    rospy.spin()



if __name__ == '__main__':
    
	# name of csv file
    filename = "Logging_timing_final_v10.csv"
    with open(filename, 'w') as csvfile:  
        # creating a csv writer object  
        csvwriter = csv.writer(csvfile)  

        # writing the fields  
        csvwriter.writerow(HEADER)
		# Running a new session
		print("Testing session...")
		with tf.Session() as sess:
			# Initialize variables
			sess.run(init)

			# Restore model weights from previously saved model
			saver.restore(sess, model_path)
			print("Model restored from file: %s" % model_path)
			RefernceMonitor()

;; Auto-generated. Do not edit!


(when (boundp 'low_level_control::low_level_msg)
  (if (not (find-package "LOW_LEVEL_CONTROL"))
    (make-package "LOW_LEVEL_CONTROL"))
  (shadow 'low_level_msg (find-package "LOW_LEVEL_CONTROL")))
(unless (find-package "LOW_LEVEL_CONTROL::LOW_LEVEL_MSG")
  (make-package "LOW_LEVEL_CONTROL::LOW_LEVEL_MSG"))

(in-package "ROS")
;;//! \htmlinclude low_level_msg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass low_level_control::low_level_msg
  :super ros::object
  :slots (_header _linear_speed _rotation_speed _J_stage _parking_stage _urban_start_turning ))

(defmethod low_level_control::low_level_msg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:linear_speed __linear_speed) 0.0)
    ((:rotation_speed __rotation_speed) 0.0)
    ((:J_stage __J_stage) 0)
    ((:parking_stage __parking_stage) 0)
    ((:urban_start_turning __urban_start_turning) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _linear_speed (float __linear_speed))
   (setq _rotation_speed (float __rotation_speed))
   (setq _J_stage (round __J_stage))
   (setq _parking_stage (round __parking_stage))
   (setq _urban_start_turning __urban_start_turning)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:linear_speed
   (&optional __linear_speed)
   (if __linear_speed (setq _linear_speed __linear_speed)) _linear_speed)
  (:rotation_speed
   (&optional __rotation_speed)
   (if __rotation_speed (setq _rotation_speed __rotation_speed)) _rotation_speed)
  (:J_stage
   (&optional __J_stage)
   (if __J_stage (setq _J_stage __J_stage)) _J_stage)
  (:parking_stage
   (&optional __parking_stage)
   (if __parking_stage (setq _parking_stage __parking_stage)) _parking_stage)
  (:urban_start_turning
   (&optional __urban_start_turning)
   (if __urban_start_turning (setq _urban_start_turning __urban_start_turning)) _urban_start_turning)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _linear_speed
    8
    ;; float64 _rotation_speed
    8
    ;; int32 _J_stage
    4
    ;; int32 _parking_stage
    4
    ;; bool _urban_start_turning
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _linear_speed
       (sys::poke _linear_speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _rotation_speed
       (sys::poke _rotation_speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int32 _J_stage
       (write-long _J_stage s)
     ;; int32 _parking_stage
       (write-long _parking_stage s)
     ;; bool _urban_start_turning
       (if _urban_start_turning (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _linear_speed
     (setq _linear_speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _rotation_speed
     (setq _rotation_speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int32 _J_stage
     (setq _J_stage (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _parking_stage
     (setq _parking_stage (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; bool _urban_start_turning
     (setq _urban_start_turning (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get low_level_control::low_level_msg :md5sum-) "c762b1c31a1dd634c8be30cbcb06f431")
(setf (get low_level_control::low_level_msg :datatype-) "low_level_control/low_level_msg")
(setf (get low_level_control::low_level_msg :definition-)
      "# Message header
Header header

# Vehicle States
float64 linear_speed
float64 rotation_speed

int32 J_stage
int32 parking_stage

bool urban_start_turning
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

")



(provide :low_level_control/low_level_msg "c762b1c31a1dd634c8be30cbcb06f431")



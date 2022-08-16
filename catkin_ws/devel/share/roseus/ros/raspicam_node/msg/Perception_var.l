;; Auto-generated. Do not edit!


(when (boundp 'raspicam_node::Perception_var)
  (if (not (find-package "RASPICAM_NODE"))
    (make-package "RASPICAM_NODE"))
  (shadow 'Perception_var (find-package "RASPICAM_NODE")))
(unless (find-package "RASPICAM_NODE::PERCEPTION_VAR")
  (make-package "RASPICAM_NODE::PERCEPTION_VAR"))

(in-package "ROS")
;;//! \htmlinclude Perception_var.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass raspicam_node::Perception_var
  :super ros::object
  :slots (_header _steering_error _d2intersection _fvar3 _urban_direction _at_tram _stop_turning_flag _var2 _var3 ))

(defmethod raspicam_node::Perception_var
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:steering_error __steering_error) 0.0)
    ((:d2intersection __d2intersection) 0.0)
    ((:fvar3 __fvar3) 0.0)
    ((:urban_direction __urban_direction) 0)
    ((:at_tram __at_tram) nil)
    ((:stop_turning_flag __stop_turning_flag) nil)
    ((:var2 __var2) nil)
    ((:var3 __var3) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _steering_error (float __steering_error))
   (setq _d2intersection (float __d2intersection))
   (setq _fvar3 (float __fvar3))
   (setq _urban_direction (round __urban_direction))
   (setq _at_tram __at_tram)
   (setq _stop_turning_flag __stop_turning_flag)
   (setq _var2 __var2)
   (setq _var3 __var3)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:steering_error
   (&optional __steering_error)
   (if __steering_error (setq _steering_error __steering_error)) _steering_error)
  (:d2intersection
   (&optional __d2intersection)
   (if __d2intersection (setq _d2intersection __d2intersection)) _d2intersection)
  (:fvar3
   (&optional __fvar3)
   (if __fvar3 (setq _fvar3 __fvar3)) _fvar3)
  (:urban_direction
   (&optional __urban_direction)
   (if __urban_direction (setq _urban_direction __urban_direction)) _urban_direction)
  (:at_tram
   (&optional __at_tram)
   (if __at_tram (setq _at_tram __at_tram)) _at_tram)
  (:stop_turning_flag
   (&optional __stop_turning_flag)
   (if __stop_turning_flag (setq _stop_turning_flag __stop_turning_flag)) _stop_turning_flag)
  (:var2
   (&optional __var2)
   (if __var2 (setq _var2 __var2)) _var2)
  (:var3
   (&optional __var3)
   (if __var3 (setq _var3 __var3)) _var3)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _steering_error
    8
    ;; float64 _d2intersection
    8
    ;; float64 _fvar3
    8
    ;; int8 _urban_direction
    1
    ;; bool _at_tram
    1
    ;; bool _stop_turning_flag
    1
    ;; bool _var2
    1
    ;; bool _var3
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _steering_error
       (sys::poke _steering_error (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _d2intersection
       (sys::poke _d2intersection (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _fvar3
       (sys::poke _fvar3 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int8 _urban_direction
       (write-byte _urban_direction s)
     ;; bool _at_tram
       (if _at_tram (write-byte -1 s) (write-byte 0 s))
     ;; bool _stop_turning_flag
       (if _stop_turning_flag (write-byte -1 s) (write-byte 0 s))
     ;; bool _var2
       (if _var2 (write-byte -1 s) (write-byte 0 s))
     ;; bool _var3
       (if _var3 (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _steering_error
     (setq _steering_error (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _d2intersection
     (setq _d2intersection (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _fvar3
     (setq _fvar3 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int8 _urban_direction
     (setq _urban_direction (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _urban_direction 127) (setq _urban_direction (- _urban_direction 256)))
   ;; bool _at_tram
     (setq _at_tram (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _stop_turning_flag
     (setq _stop_turning_flag (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _var2
     (setq _var2 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _var3
     (setq _var3 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get raspicam_node::Perception_var :md5sum-) "de246360e784cb56f3a2ea4a5ddb7187")
(setf (get raspicam_node::Perception_var :datatype-) "raspicam_node/Perception_var")
(setf (get raspicam_node::Perception_var :definition-)
      "# Message header
# This message is for all the outputs of perception algorithms
Header header


# Numerical variables
float64 steering_error       # The steering angle error for lane keeping
float64 d2intersection
float64 fvar3

int8 urban_direction           # -1:left, 0:straight, 1:right


# Bool signals 
bool at_tram
bool stop_turning_flag
bool var2
bool var3
      
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



(provide :raspicam_node/Perception_var "de246360e784cb56f3a2ea4a5ddb7187")



;; Auto-generated. Do not edit!


(when (boundp 'raspicam_node::Parking)
  (if (not (find-package "RASPICAM_NODE"))
    (make-package "RASPICAM_NODE"))
  (shadow 'Parking (find-package "RASPICAM_NODE")))
(unless (find-package "RASPICAM_NODE::PARKING")
  (make-package "RASPICAM_NODE::PARKING"))

(in-package "ROS")
;;//! \htmlinclude Parking.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass raspicam_node::Parking
  :super ros::object
  :slots (_header _steering_error _parking_stg1_steering_error _parking_stg2_steering_error _begin_parking _parking_stg1_stop _parking_stg2_stop ))

(defmethod raspicam_node::Parking
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:steering_error __steering_error) 0.0)
    ((:parking_stg1_steering_error __parking_stg1_steering_error) 0.0)
    ((:parking_stg2_steering_error __parking_stg2_steering_error) 0.0)
    ((:begin_parking __begin_parking) nil)
    ((:parking_stg1_stop __parking_stg1_stop) nil)
    ((:parking_stg2_stop __parking_stg2_stop) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _steering_error (float __steering_error))
   (setq _parking_stg1_steering_error (float __parking_stg1_steering_error))
   (setq _parking_stg2_steering_error (float __parking_stg2_steering_error))
   (setq _begin_parking __begin_parking)
   (setq _parking_stg1_stop __parking_stg1_stop)
   (setq _parking_stg2_stop __parking_stg2_stop)
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
  (:parking_stg1_steering_error
   (&optional __parking_stg1_steering_error)
   (if __parking_stg1_steering_error (setq _parking_stg1_steering_error __parking_stg1_steering_error)) _parking_stg1_steering_error)
  (:parking_stg2_steering_error
   (&optional __parking_stg2_steering_error)
   (if __parking_stg2_steering_error (setq _parking_stg2_steering_error __parking_stg2_steering_error)) _parking_stg2_steering_error)
  (:begin_parking
   (&optional __begin_parking)
   (if __begin_parking (setq _begin_parking __begin_parking)) _begin_parking)
  (:parking_stg1_stop
   (&optional __parking_stg1_stop)
   (if __parking_stg1_stop (setq _parking_stg1_stop __parking_stg1_stop)) _parking_stg1_stop)
  (:parking_stg2_stop
   (&optional __parking_stg2_stop)
   (if __parking_stg2_stop (setq _parking_stg2_stop __parking_stg2_stop)) _parking_stg2_stop)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _steering_error
    8
    ;; float64 _parking_stg1_steering_error
    8
    ;; float64 _parking_stg2_steering_error
    8
    ;; bool _begin_parking
    1
    ;; bool _parking_stg1_stop
    1
    ;; bool _parking_stg2_stop
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
     ;; float64 _parking_stg1_steering_error
       (sys::poke _parking_stg1_steering_error (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _parking_stg2_steering_error
       (sys::poke _parking_stg2_steering_error (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _begin_parking
       (if _begin_parking (write-byte -1 s) (write-byte 0 s))
     ;; bool _parking_stg1_stop
       (if _parking_stg1_stop (write-byte -1 s) (write-byte 0 s))
     ;; bool _parking_stg2_stop
       (if _parking_stg2_stop (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _steering_error
     (setq _steering_error (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _parking_stg1_steering_error
     (setq _parking_stg1_steering_error (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _parking_stg2_steering_error
     (setq _parking_stg2_steering_error (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _begin_parking
     (setq _begin_parking (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _parking_stg1_stop
     (setq _parking_stg1_stop (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _parking_stg2_stop
     (setq _parking_stg2_stop (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get raspicam_node::Parking :md5sum-) "ed391e1436c52e7f07926b152c4f1a22")
(setf (get raspicam_node::Parking :datatype-) "raspicam_node/Parking")
(setf (get raspicam_node::Parking :definition-)
      "# Message header
Header header


# Numerical variables
float64 steering_error    # The steering angle error for lane keeping
float64 parking_stg1_steering_error
float64 parking_stg2_steering_error


# Bool signals 
bool begin_parking        # begin parking (J-shape)
bool parking_stg1_stop
bool parking_stg2_stop
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



(provide :raspicam_node/Parking "ed391e1436c52e7f07926b152c4f1a22")



;; Auto-generated. Do not edit!


(when (boundp 'raspicam_node::Perception)
  (if (not (find-package "RASPICAM_NODE"))
    (make-package "RASPICAM_NODE"))
  (shadow 'Perception (find-package "RASPICAM_NODE")))
(unless (find-package "RASPICAM_NODE::PERCEPTION")
  (make-package "RASPICAM_NODE::PERCEPTION"))

(in-package "ROS")
;;//! \htmlinclude Perception.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass raspicam_node::Perception
  :super ros::object
  :slots (_header _steering_error _variable2 _variable3 _at_intersection _direction _signal4 _signal5 _undistorted_img _bev_img _mainlane_img _parking_img _tram_img _background_img _img7 _img8 ))

(defmethod raspicam_node::Perception
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:steering_error __steering_error) 0.0)
    ((:variable2 __variable2) 0.0)
    ((:variable3 __variable3) 0.0)
    ((:at_intersection __at_intersection) nil)
    ((:direction __direction) nil)
    ((:signal4 __signal4) nil)
    ((:signal5 __signal5) nil)
    ((:undistorted_img __undistorted_img) (instance sensor_msgs::CompressedImage :init))
    ((:bev_img __bev_img) (instance sensor_msgs::CompressedImage :init))
    ((:mainlane_img __mainlane_img) (instance sensor_msgs::CompressedImage :init))
    ((:parking_img __parking_img) (instance sensor_msgs::CompressedImage :init))
    ((:tram_img __tram_img) (instance sensor_msgs::CompressedImage :init))
    ((:background_img __background_img) (instance sensor_msgs::CompressedImage :init))
    ((:img7 __img7) (instance sensor_msgs::CompressedImage :init))
    ((:img8 __img8) (instance sensor_msgs::CompressedImage :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _steering_error (float __steering_error))
   (setq _variable2 (float __variable2))
   (setq _variable3 (float __variable3))
   (setq _at_intersection __at_intersection)
   (setq _direction __direction)
   (setq _signal4 __signal4)
   (setq _signal5 __signal5)
   (setq _undistorted_img __undistorted_img)
   (setq _bev_img __bev_img)
   (setq _mainlane_img __mainlane_img)
   (setq _parking_img __parking_img)
   (setq _tram_img __tram_img)
   (setq _background_img __background_img)
   (setq _img7 __img7)
   (setq _img8 __img8)
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
  (:variable2
   (&optional __variable2)
   (if __variable2 (setq _variable2 __variable2)) _variable2)
  (:variable3
   (&optional __variable3)
   (if __variable3 (setq _variable3 __variable3)) _variable3)
  (:at_intersection
   (&optional __at_intersection)
   (if __at_intersection (setq _at_intersection __at_intersection)) _at_intersection)
  (:direction
   (&optional __direction)
   (if __direction (setq _direction __direction)) _direction)
  (:signal4
   (&optional __signal4)
   (if __signal4 (setq _signal4 __signal4)) _signal4)
  (:signal5
   (&optional __signal5)
   (if __signal5 (setq _signal5 __signal5)) _signal5)
  (:undistorted_img
   (&rest __undistorted_img)
   (if (keywordp (car __undistorted_img))
       (send* _undistorted_img __undistorted_img)
     (progn
       (if __undistorted_img (setq _undistorted_img (car __undistorted_img)))
       _undistorted_img)))
  (:bev_img
   (&rest __bev_img)
   (if (keywordp (car __bev_img))
       (send* _bev_img __bev_img)
     (progn
       (if __bev_img (setq _bev_img (car __bev_img)))
       _bev_img)))
  (:mainlane_img
   (&rest __mainlane_img)
   (if (keywordp (car __mainlane_img))
       (send* _mainlane_img __mainlane_img)
     (progn
       (if __mainlane_img (setq _mainlane_img (car __mainlane_img)))
       _mainlane_img)))
  (:parking_img
   (&rest __parking_img)
   (if (keywordp (car __parking_img))
       (send* _parking_img __parking_img)
     (progn
       (if __parking_img (setq _parking_img (car __parking_img)))
       _parking_img)))
  (:tram_img
   (&rest __tram_img)
   (if (keywordp (car __tram_img))
       (send* _tram_img __tram_img)
     (progn
       (if __tram_img (setq _tram_img (car __tram_img)))
       _tram_img)))
  (:background_img
   (&rest __background_img)
   (if (keywordp (car __background_img))
       (send* _background_img __background_img)
     (progn
       (if __background_img (setq _background_img (car __background_img)))
       _background_img)))
  (:img7
   (&rest __img7)
   (if (keywordp (car __img7))
       (send* _img7 __img7)
     (progn
       (if __img7 (setq _img7 (car __img7)))
       _img7)))
  (:img8
   (&rest __img8)
   (if (keywordp (car __img8))
       (send* _img8 __img8)
     (progn
       (if __img8 (setq _img8 (car __img8)))
       _img8)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _steering_error
    8
    ;; float64 _variable2
    8
    ;; float64 _variable3
    8
    ;; bool _at_intersection
    1
    ;; bool _direction
    1
    ;; bool _signal4
    1
    ;; bool _signal5
    1
    ;; sensor_msgs/CompressedImage _undistorted_img
    (send _undistorted_img :serialization-length)
    ;; sensor_msgs/CompressedImage _bev_img
    (send _bev_img :serialization-length)
    ;; sensor_msgs/CompressedImage _mainlane_img
    (send _mainlane_img :serialization-length)
    ;; sensor_msgs/CompressedImage _parking_img
    (send _parking_img :serialization-length)
    ;; sensor_msgs/CompressedImage _tram_img
    (send _tram_img :serialization-length)
    ;; sensor_msgs/CompressedImage _background_img
    (send _background_img :serialization-length)
    ;; sensor_msgs/CompressedImage _img7
    (send _img7 :serialization-length)
    ;; sensor_msgs/CompressedImage _img8
    (send _img8 :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _steering_error
       (sys::poke _steering_error (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _variable2
       (sys::poke _variable2 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _variable3
       (sys::poke _variable3 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _at_intersection
       (if _at_intersection (write-byte -1 s) (write-byte 0 s))
     ;; bool _direction
       (if _direction (write-byte -1 s) (write-byte 0 s))
     ;; bool _signal4
       (if _signal4 (write-byte -1 s) (write-byte 0 s))
     ;; bool _signal5
       (if _signal5 (write-byte -1 s) (write-byte 0 s))
     ;; sensor_msgs/CompressedImage _undistorted_img
       (send _undistorted_img :serialize s)
     ;; sensor_msgs/CompressedImage _bev_img
       (send _bev_img :serialize s)
     ;; sensor_msgs/CompressedImage _mainlane_img
       (send _mainlane_img :serialize s)
     ;; sensor_msgs/CompressedImage _parking_img
       (send _parking_img :serialize s)
     ;; sensor_msgs/CompressedImage _tram_img
       (send _tram_img :serialize s)
     ;; sensor_msgs/CompressedImage _background_img
       (send _background_img :serialize s)
     ;; sensor_msgs/CompressedImage _img7
       (send _img7 :serialize s)
     ;; sensor_msgs/CompressedImage _img8
       (send _img8 :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _steering_error
     (setq _steering_error (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _variable2
     (setq _variable2 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _variable3
     (setq _variable3 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _at_intersection
     (setq _at_intersection (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _direction
     (setq _direction (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _signal4
     (setq _signal4 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _signal5
     (setq _signal5 (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; sensor_msgs/CompressedImage _undistorted_img
     (send _undistorted_img :deserialize buf ptr-) (incf ptr- (send _undistorted_img :serialization-length))
   ;; sensor_msgs/CompressedImage _bev_img
     (send _bev_img :deserialize buf ptr-) (incf ptr- (send _bev_img :serialization-length))
   ;; sensor_msgs/CompressedImage _mainlane_img
     (send _mainlane_img :deserialize buf ptr-) (incf ptr- (send _mainlane_img :serialization-length))
   ;; sensor_msgs/CompressedImage _parking_img
     (send _parking_img :deserialize buf ptr-) (incf ptr- (send _parking_img :serialization-length))
   ;; sensor_msgs/CompressedImage _tram_img
     (send _tram_img :deserialize buf ptr-) (incf ptr- (send _tram_img :serialization-length))
   ;; sensor_msgs/CompressedImage _background_img
     (send _background_img :deserialize buf ptr-) (incf ptr- (send _background_img :serialization-length))
   ;; sensor_msgs/CompressedImage _img7
     (send _img7 :deserialize buf ptr-) (incf ptr- (send _img7 :serialization-length))
   ;; sensor_msgs/CompressedImage _img8
     (send _img8 :deserialize buf ptr-) (incf ptr- (send _img8 :serialization-length))
   ;;
   self)
  )

(setf (get raspicam_node::Perception :md5sum-) "b77d34b81a12b4e3196798b595588f33")
(setf (get raspicam_node::Perception :datatype-) "raspicam_node/Perception")
(setf (get raspicam_node::Perception :definition-)
      "# Message header
Header header


# Numerical variables
float64 steering_error    # The steering angle error for lane keeping
float64 variable2         # ---
float64 variable3


# Bool signals 
bool at_intersection      # at the center of an intersection (#-shape)
bool direction            # detected direction on the traffic sign (#-shape)
bool signal4
bool signal5


# IMG msg 
sensor_msgs/CompressedImage undistorted_img
sensor_msgs/CompressedImage bev_img                # The bird's eye view image
sensor_msgs/CompressedImage mainlane_img
sensor_msgs/CompressedImage parking_img
sensor_msgs/CompressedImage tram_img
sensor_msgs/CompressedImage background_img
sensor_msgs/CompressedImage img7
sensor_msgs/CompressedImage img8

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

================================================================================
MSG: sensor_msgs/CompressedImage
# This message contains a compressed image

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image

string format        # Specifies the format of the data
                     #   Acceptable values:
                     #     jpeg, png
uint8[] data         # Compressed image buffer

")



(provide :raspicam_node/Perception "b77d34b81a12b4e3196798b595588f33")



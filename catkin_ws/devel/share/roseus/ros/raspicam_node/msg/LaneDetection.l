;; Auto-generated. Do not edit!


(when (boundp 'raspicam_node::LaneDetection)
  (if (not (find-package "RASPICAM_NODE"))
    (make-package "RASPICAM_NODE"))
  (shadow 'LaneDetection (find-package "RASPICAM_NODE")))
(unless (find-package "RASPICAM_NODE::LANEDETECTION")
  (make-package "RASPICAM_NODE::LANEDETECTION"))

(in-package "ROS")
;;//! \htmlinclude LaneDetection.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass raspicam_node::LaneDetection
  :super ros::object
  :slots (_steering_error _at_curve _resized_img _bw_img ))

(defmethod raspicam_node::LaneDetection
  (:init
   (&key
    ((:steering_error __steering_error) 0.0)
    ((:at_curve __at_curve) nil)
    ((:resized_img __resized_img) (instance sensor_msgs::CompressedImage :init))
    ((:bw_img __bw_img) (instance sensor_msgs::CompressedImage :init))
    )
   (send-super :init)
   (setq _steering_error (float __steering_error))
   (setq _at_curve __at_curve)
   (setq _resized_img __resized_img)
   (setq _bw_img __bw_img)
   self)
  (:steering_error
   (&optional __steering_error)
   (if __steering_error (setq _steering_error __steering_error)) _steering_error)
  (:at_curve
   (&optional __at_curve)
   (if __at_curve (setq _at_curve __at_curve)) _at_curve)
  (:resized_img
   (&rest __resized_img)
   (if (keywordp (car __resized_img))
       (send* _resized_img __resized_img)
     (progn
       (if __resized_img (setq _resized_img (car __resized_img)))
       _resized_img)))
  (:bw_img
   (&rest __bw_img)
   (if (keywordp (car __bw_img))
       (send* _bw_img __bw_img)
     (progn
       (if __bw_img (setq _bw_img (car __bw_img)))
       _bw_img)))
  (:serialization-length
   ()
   (+
    ;; float64 _steering_error
    8
    ;; bool _at_curve
    1
    ;; sensor_msgs/CompressedImage _resized_img
    (send _resized_img :serialization-length)
    ;; sensor_msgs/CompressedImage _bw_img
    (send _bw_img :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _steering_error
       (sys::poke _steering_error (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _at_curve
       (if _at_curve (write-byte -1 s) (write-byte 0 s))
     ;; sensor_msgs/CompressedImage _resized_img
       (send _resized_img :serialize s)
     ;; sensor_msgs/CompressedImage _bw_img
       (send _bw_img :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _steering_error
     (setq _steering_error (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _at_curve
     (setq _at_curve (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; sensor_msgs/CompressedImage _resized_img
     (send _resized_img :deserialize buf ptr-) (incf ptr- (send _resized_img :serialization-length))
   ;; sensor_msgs/CompressedImage _bw_img
     (send _bw_img :deserialize buf ptr-) (incf ptr- (send _bw_img :serialization-length))
   ;;
   self)
  )

(setf (get raspicam_node::LaneDetection :md5sum-) "33f171634fb931d1dc01a255358d5654")
(setf (get raspicam_node::LaneDetection :datatype-) "raspicam_node/LaneDetection")
(setf (get raspicam_node::LaneDetection :definition-)
      "# The steering angle error returned by the lane detection
float64 steering_error

# Whether the vehicle is at a curve or on a straight lane
bool at_curve

# img msg for review
sensor_msgs/CompressedImage resized_img
sensor_msgs/CompressedImage bw_img


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



(provide :raspicam_node/LaneDetection "33f171634fb931d1dc01a255358d5654")



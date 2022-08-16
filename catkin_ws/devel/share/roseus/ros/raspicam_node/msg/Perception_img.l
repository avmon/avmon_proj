;; Auto-generated. Do not edit!


(when (boundp 'raspicam_node::Perception_img)
  (if (not (find-package "RASPICAM_NODE"))
    (make-package "RASPICAM_NODE"))
  (shadow 'Perception_img (find-package "RASPICAM_NODE")))
(unless (find-package "RASPICAM_NODE::PERCEPTION_IMG")
  (make-package "RASPICAM_NODE::PERCEPTION_IMG"))

(in-package "ROS")
;;//! \htmlinclude Perception_img.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass raspicam_node::Perception_img
  :super ros::object
  :slots (_header _undistorted_img _bev_img _mainlane_img _parking_img _tram_img _background_img _img7 _img8 ))

(defmethod raspicam_node::Perception_img
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:undistorted_img __undistorted_img) (instance sensor_msgs::CompressedImage :init))
    ((:bev_img __bev_img) (instance sensor_msgs::CompressedImage :init))
    ((:mainlane_img __mainlane_img) (instance sensor_msgs::Image :init))
    ((:parking_img __parking_img) (instance sensor_msgs::Image :init))
    ((:tram_img __tram_img) (instance sensor_msgs::Image :init))
    ((:background_img __background_img) (instance sensor_msgs::Image :init))
    ((:img7 __img7) (instance sensor_msgs::CompressedImage :init))
    ((:img8 __img8) (instance sensor_msgs::CompressedImage :init))
    )
   (send-super :init)
   (setq _header __header)
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
    ;; sensor_msgs/CompressedImage _undistorted_img
    (send _undistorted_img :serialization-length)
    ;; sensor_msgs/CompressedImage _bev_img
    (send _bev_img :serialization-length)
    ;; sensor_msgs/Image _mainlane_img
    (send _mainlane_img :serialization-length)
    ;; sensor_msgs/Image _parking_img
    (send _parking_img :serialization-length)
    ;; sensor_msgs/Image _tram_img
    (send _tram_img :serialization-length)
    ;; sensor_msgs/Image _background_img
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
     ;; sensor_msgs/CompressedImage _undistorted_img
       (send _undistorted_img :serialize s)
     ;; sensor_msgs/CompressedImage _bev_img
       (send _bev_img :serialize s)
     ;; sensor_msgs/Image _mainlane_img
       (send _mainlane_img :serialize s)
     ;; sensor_msgs/Image _parking_img
       (send _parking_img :serialize s)
     ;; sensor_msgs/Image _tram_img
       (send _tram_img :serialize s)
     ;; sensor_msgs/Image _background_img
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
   ;; sensor_msgs/CompressedImage _undistorted_img
     (send _undistorted_img :deserialize buf ptr-) (incf ptr- (send _undistorted_img :serialization-length))
   ;; sensor_msgs/CompressedImage _bev_img
     (send _bev_img :deserialize buf ptr-) (incf ptr- (send _bev_img :serialization-length))
   ;; sensor_msgs/Image _mainlane_img
     (send _mainlane_img :deserialize buf ptr-) (incf ptr- (send _mainlane_img :serialization-length))
   ;; sensor_msgs/Image _parking_img
     (send _parking_img :deserialize buf ptr-) (incf ptr- (send _parking_img :serialization-length))
   ;; sensor_msgs/Image _tram_img
     (send _tram_img :deserialize buf ptr-) (incf ptr- (send _tram_img :serialization-length))
   ;; sensor_msgs/Image _background_img
     (send _background_img :deserialize buf ptr-) (incf ptr- (send _background_img :serialization-length))
   ;; sensor_msgs/CompressedImage _img7
     (send _img7 :deserialize buf ptr-) (incf ptr- (send _img7 :serialization-length))
   ;; sensor_msgs/CompressedImage _img8
     (send _img8 :deserialize buf ptr-) (incf ptr- (send _img8 :serialization-length))
   ;;
   self)
  )

(setf (get raspicam_node::Perception_img :md5sum-) "8a56b3e3562f70b07899255b3e4eb24a")
(setf (get raspicam_node::Perception_img :datatype-) "raspicam_node/Perception_img")
(setf (get raspicam_node::Perception_img :definition-)
      "# Message header
# This message is only for all the imgs output by the synthetic segmentation 
Header header


# IMG msg 
sensor_msgs/CompressedImage undistorted_img
sensor_msgs/CompressedImage bev_img                # The bird's eye view image
sensor_msgs/Image mainlane_img
sensor_msgs/Image parking_img
sensor_msgs/Image tram_img
sensor_msgs/Image background_img
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

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

")



(provide :raspicam_node/Perception_img "8a56b3e3562f70b07899255b3e4eb24a")



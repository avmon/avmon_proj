; Auto-generated. Do not edit!


(cl:in-package raspicam_node-msg)


;//! \htmlinclude Perception_img.msg.html

(cl:defclass <Perception_img> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (undistorted_img
    :reader undistorted_img
    :initarg :undistorted_img
    :type sensor_msgs-msg:CompressedImage
    :initform (cl:make-instance 'sensor_msgs-msg:CompressedImage))
   (bev_img
    :reader bev_img
    :initarg :bev_img
    :type sensor_msgs-msg:CompressedImage
    :initform (cl:make-instance 'sensor_msgs-msg:CompressedImage))
   (mainlane_img
    :reader mainlane_img
    :initarg :mainlane_img
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (parking_img
    :reader parking_img
    :initarg :parking_img
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (tram_img
    :reader tram_img
    :initarg :tram_img
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (background_img
    :reader background_img
    :initarg :background_img
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (img7
    :reader img7
    :initarg :img7
    :type sensor_msgs-msg:CompressedImage
    :initform (cl:make-instance 'sensor_msgs-msg:CompressedImage))
   (img8
    :reader img8
    :initarg :img8
    :type sensor_msgs-msg:CompressedImage
    :initform (cl:make-instance 'sensor_msgs-msg:CompressedImage)))
)

(cl:defclass Perception_img (<Perception_img>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Perception_img>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Perception_img)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name raspicam_node-msg:<Perception_img> is deprecated: use raspicam_node-msg:Perception_img instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Perception_img>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:header-val is deprecated.  Use raspicam_node-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'undistorted_img-val :lambda-list '(m))
(cl:defmethod undistorted_img-val ((m <Perception_img>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:undistorted_img-val is deprecated.  Use raspicam_node-msg:undistorted_img instead.")
  (undistorted_img m))

(cl:ensure-generic-function 'bev_img-val :lambda-list '(m))
(cl:defmethod bev_img-val ((m <Perception_img>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:bev_img-val is deprecated.  Use raspicam_node-msg:bev_img instead.")
  (bev_img m))

(cl:ensure-generic-function 'mainlane_img-val :lambda-list '(m))
(cl:defmethod mainlane_img-val ((m <Perception_img>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:mainlane_img-val is deprecated.  Use raspicam_node-msg:mainlane_img instead.")
  (mainlane_img m))

(cl:ensure-generic-function 'parking_img-val :lambda-list '(m))
(cl:defmethod parking_img-val ((m <Perception_img>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:parking_img-val is deprecated.  Use raspicam_node-msg:parking_img instead.")
  (parking_img m))

(cl:ensure-generic-function 'tram_img-val :lambda-list '(m))
(cl:defmethod tram_img-val ((m <Perception_img>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:tram_img-val is deprecated.  Use raspicam_node-msg:tram_img instead.")
  (tram_img m))

(cl:ensure-generic-function 'background_img-val :lambda-list '(m))
(cl:defmethod background_img-val ((m <Perception_img>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:background_img-val is deprecated.  Use raspicam_node-msg:background_img instead.")
  (background_img m))

(cl:ensure-generic-function 'img7-val :lambda-list '(m))
(cl:defmethod img7-val ((m <Perception_img>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:img7-val is deprecated.  Use raspicam_node-msg:img7 instead.")
  (img7 m))

(cl:ensure-generic-function 'img8-val :lambda-list '(m))
(cl:defmethod img8-val ((m <Perception_img>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:img8-val is deprecated.  Use raspicam_node-msg:img8 instead.")
  (img8 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Perception_img>) ostream)
  "Serializes a message object of type '<Perception_img>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'undistorted_img) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'bev_img) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'mainlane_img) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'parking_img) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'tram_img) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'background_img) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'img7) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'img8) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Perception_img>) istream)
  "Deserializes a message object of type '<Perception_img>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'undistorted_img) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'bev_img) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'mainlane_img) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'parking_img) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'tram_img) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'background_img) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'img7) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'img8) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Perception_img>)))
  "Returns string type for a message object of type '<Perception_img>"
  "raspicam_node/Perception_img")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Perception_img)))
  "Returns string type for a message object of type 'Perception_img"
  "raspicam_node/Perception_img")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Perception_img>)))
  "Returns md5sum for a message object of type '<Perception_img>"
  "8a56b3e3562f70b07899255b3e4eb24a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Perception_img)))
  "Returns md5sum for a message object of type 'Perception_img"
  "8a56b3e3562f70b07899255b3e4eb24a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Perception_img>)))
  "Returns full string definition for message of type '<Perception_img>"
  (cl:format cl:nil "# Message header~%# This message is only for all the imgs output by the synthetic segmentation ~%Header header~%~%~%# IMG msg ~%sensor_msgs/CompressedImage undistorted_img~%sensor_msgs/CompressedImage bev_img                # The bird's eye view image~%sensor_msgs/Image mainlane_img~%sensor_msgs/Image parking_img~%sensor_msgs/Image tram_img~%sensor_msgs/Image background_img~%sensor_msgs/CompressedImage img7~%sensor_msgs/CompressedImage img8~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/CompressedImage~%# This message contains a compressed image~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%~%string format        # Specifies the format of the data~%                     #   Acceptable values:~%                     #     jpeg, png~%uint8[] data         # Compressed image buffer~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Perception_img)))
  "Returns full string definition for message of type 'Perception_img"
  (cl:format cl:nil "# Message header~%# This message is only for all the imgs output by the synthetic segmentation ~%Header header~%~%~%# IMG msg ~%sensor_msgs/CompressedImage undistorted_img~%sensor_msgs/CompressedImage bev_img                # The bird's eye view image~%sensor_msgs/Image mainlane_img~%sensor_msgs/Image parking_img~%sensor_msgs/Image tram_img~%sensor_msgs/Image background_img~%sensor_msgs/CompressedImage img7~%sensor_msgs/CompressedImage img8~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/CompressedImage~%# This message contains a compressed image~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%~%string format        # Specifies the format of the data~%                     #   Acceptable values:~%                     #     jpeg, png~%uint8[] data         # Compressed image buffer~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Perception_img>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'undistorted_img))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'bev_img))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'mainlane_img))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'parking_img))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'tram_img))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'background_img))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'img7))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'img8))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Perception_img>))
  "Converts a ROS message object to a list"
  (cl:list 'Perception_img
    (cl:cons ':header (header msg))
    (cl:cons ':undistorted_img (undistorted_img msg))
    (cl:cons ':bev_img (bev_img msg))
    (cl:cons ':mainlane_img (mainlane_img msg))
    (cl:cons ':parking_img (parking_img msg))
    (cl:cons ':tram_img (tram_img msg))
    (cl:cons ':background_img (background_img msg))
    (cl:cons ':img7 (img7 msg))
    (cl:cons ':img8 (img8 msg))
))

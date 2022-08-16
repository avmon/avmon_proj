; Auto-generated. Do not edit!


(cl:in-package raspicam_node-msg)


;//! \htmlinclude LaneDetection.msg.html

(cl:defclass <LaneDetection> (roslisp-msg-protocol:ros-message)
  ((steering_error
    :reader steering_error
    :initarg :steering_error
    :type cl:float
    :initform 0.0)
   (at_curve
    :reader at_curve
    :initarg :at_curve
    :type cl:boolean
    :initform cl:nil)
   (resized_img
    :reader resized_img
    :initarg :resized_img
    :type sensor_msgs-msg:CompressedImage
    :initform (cl:make-instance 'sensor_msgs-msg:CompressedImage))
   (bw_img
    :reader bw_img
    :initarg :bw_img
    :type sensor_msgs-msg:CompressedImage
    :initform (cl:make-instance 'sensor_msgs-msg:CompressedImage)))
)

(cl:defclass LaneDetection (<LaneDetection>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LaneDetection>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LaneDetection)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name raspicam_node-msg:<LaneDetection> is deprecated: use raspicam_node-msg:LaneDetection instead.")))

(cl:ensure-generic-function 'steering_error-val :lambda-list '(m))
(cl:defmethod steering_error-val ((m <LaneDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:steering_error-val is deprecated.  Use raspicam_node-msg:steering_error instead.")
  (steering_error m))

(cl:ensure-generic-function 'at_curve-val :lambda-list '(m))
(cl:defmethod at_curve-val ((m <LaneDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:at_curve-val is deprecated.  Use raspicam_node-msg:at_curve instead.")
  (at_curve m))

(cl:ensure-generic-function 'resized_img-val :lambda-list '(m))
(cl:defmethod resized_img-val ((m <LaneDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:resized_img-val is deprecated.  Use raspicam_node-msg:resized_img instead.")
  (resized_img m))

(cl:ensure-generic-function 'bw_img-val :lambda-list '(m))
(cl:defmethod bw_img-val ((m <LaneDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:bw_img-val is deprecated.  Use raspicam_node-msg:bw_img instead.")
  (bw_img m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LaneDetection>) ostream)
  "Serializes a message object of type '<LaneDetection>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'steering_error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'at_curve) 1 0)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'resized_img) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'bw_img) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LaneDetection>) istream)
  "Deserializes a message object of type '<LaneDetection>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'steering_error) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'at_curve) (cl:not (cl:zerop (cl:read-byte istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'resized_img) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'bw_img) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LaneDetection>)))
  "Returns string type for a message object of type '<LaneDetection>"
  "raspicam_node/LaneDetection")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LaneDetection)))
  "Returns string type for a message object of type 'LaneDetection"
  "raspicam_node/LaneDetection")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LaneDetection>)))
  "Returns md5sum for a message object of type '<LaneDetection>"
  "33f171634fb931d1dc01a255358d5654")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LaneDetection)))
  "Returns md5sum for a message object of type 'LaneDetection"
  "33f171634fb931d1dc01a255358d5654")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LaneDetection>)))
  "Returns full string definition for message of type '<LaneDetection>"
  (cl:format cl:nil "# The steering angle error returned by the lane detection~%float64 steering_error~%~%# Whether the vehicle is at a curve or on a straight lane~%bool at_curve~%~%# img msg for review~%sensor_msgs/CompressedImage resized_img~%sensor_msgs/CompressedImage bw_img~%~%~%================================================================================~%MSG: sensor_msgs/CompressedImage~%# This message contains a compressed image~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%~%string format        # Specifies the format of the data~%                     #   Acceptable values:~%                     #     jpeg, png~%uint8[] data         # Compressed image buffer~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LaneDetection)))
  "Returns full string definition for message of type 'LaneDetection"
  (cl:format cl:nil "# The steering angle error returned by the lane detection~%float64 steering_error~%~%# Whether the vehicle is at a curve or on a straight lane~%bool at_curve~%~%# img msg for review~%sensor_msgs/CompressedImage resized_img~%sensor_msgs/CompressedImage bw_img~%~%~%================================================================================~%MSG: sensor_msgs/CompressedImage~%# This message contains a compressed image~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%~%string format        # Specifies the format of the data~%                     #   Acceptable values:~%                     #     jpeg, png~%uint8[] data         # Compressed image buffer~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LaneDetection>))
  (cl:+ 0
     8
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'resized_img))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'bw_img))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LaneDetection>))
  "Converts a ROS message object to a list"
  (cl:list 'LaneDetection
    (cl:cons ':steering_error (steering_error msg))
    (cl:cons ':at_curve (at_curve msg))
    (cl:cons ':resized_img (resized_img msg))
    (cl:cons ':bw_img (bw_img msg))
))

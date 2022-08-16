; Auto-generated. Do not edit!


(cl:in-package raspicam_node-msg)


;//! \htmlinclude Perception.msg.html

(cl:defclass <Perception> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (steering_error
    :reader steering_error
    :initarg :steering_error
    :type cl:float
    :initform 0.0)
   (variable2
    :reader variable2
    :initarg :variable2
    :type cl:float
    :initform 0.0)
   (variable3
    :reader variable3
    :initarg :variable3
    :type cl:float
    :initform 0.0)
   (at_intersection
    :reader at_intersection
    :initarg :at_intersection
    :type cl:boolean
    :initform cl:nil)
   (direction
    :reader direction
    :initarg :direction
    :type cl:boolean
    :initform cl:nil)
   (signal4
    :reader signal4
    :initarg :signal4
    :type cl:boolean
    :initform cl:nil)
   (signal5
    :reader signal5
    :initarg :signal5
    :type cl:boolean
    :initform cl:nil)
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
    :type sensor_msgs-msg:CompressedImage
    :initform (cl:make-instance 'sensor_msgs-msg:CompressedImage))
   (parking_img
    :reader parking_img
    :initarg :parking_img
    :type sensor_msgs-msg:CompressedImage
    :initform (cl:make-instance 'sensor_msgs-msg:CompressedImage))
   (tram_img
    :reader tram_img
    :initarg :tram_img
    :type sensor_msgs-msg:CompressedImage
    :initform (cl:make-instance 'sensor_msgs-msg:CompressedImage))
   (background_img
    :reader background_img
    :initarg :background_img
    :type sensor_msgs-msg:CompressedImage
    :initform (cl:make-instance 'sensor_msgs-msg:CompressedImage))
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

(cl:defclass Perception (<Perception>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Perception>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Perception)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name raspicam_node-msg:<Perception> is deprecated: use raspicam_node-msg:Perception instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Perception>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:header-val is deprecated.  Use raspicam_node-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'steering_error-val :lambda-list '(m))
(cl:defmethod steering_error-val ((m <Perception>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:steering_error-val is deprecated.  Use raspicam_node-msg:steering_error instead.")
  (steering_error m))

(cl:ensure-generic-function 'variable2-val :lambda-list '(m))
(cl:defmethod variable2-val ((m <Perception>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:variable2-val is deprecated.  Use raspicam_node-msg:variable2 instead.")
  (variable2 m))

(cl:ensure-generic-function 'variable3-val :lambda-list '(m))
(cl:defmethod variable3-val ((m <Perception>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:variable3-val is deprecated.  Use raspicam_node-msg:variable3 instead.")
  (variable3 m))

(cl:ensure-generic-function 'at_intersection-val :lambda-list '(m))
(cl:defmethod at_intersection-val ((m <Perception>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:at_intersection-val is deprecated.  Use raspicam_node-msg:at_intersection instead.")
  (at_intersection m))

(cl:ensure-generic-function 'direction-val :lambda-list '(m))
(cl:defmethod direction-val ((m <Perception>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:direction-val is deprecated.  Use raspicam_node-msg:direction instead.")
  (direction m))

(cl:ensure-generic-function 'signal4-val :lambda-list '(m))
(cl:defmethod signal4-val ((m <Perception>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:signal4-val is deprecated.  Use raspicam_node-msg:signal4 instead.")
  (signal4 m))

(cl:ensure-generic-function 'signal5-val :lambda-list '(m))
(cl:defmethod signal5-val ((m <Perception>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:signal5-val is deprecated.  Use raspicam_node-msg:signal5 instead.")
  (signal5 m))

(cl:ensure-generic-function 'undistorted_img-val :lambda-list '(m))
(cl:defmethod undistorted_img-val ((m <Perception>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:undistorted_img-val is deprecated.  Use raspicam_node-msg:undistorted_img instead.")
  (undistorted_img m))

(cl:ensure-generic-function 'bev_img-val :lambda-list '(m))
(cl:defmethod bev_img-val ((m <Perception>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:bev_img-val is deprecated.  Use raspicam_node-msg:bev_img instead.")
  (bev_img m))

(cl:ensure-generic-function 'mainlane_img-val :lambda-list '(m))
(cl:defmethod mainlane_img-val ((m <Perception>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:mainlane_img-val is deprecated.  Use raspicam_node-msg:mainlane_img instead.")
  (mainlane_img m))

(cl:ensure-generic-function 'parking_img-val :lambda-list '(m))
(cl:defmethod parking_img-val ((m <Perception>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:parking_img-val is deprecated.  Use raspicam_node-msg:parking_img instead.")
  (parking_img m))

(cl:ensure-generic-function 'tram_img-val :lambda-list '(m))
(cl:defmethod tram_img-val ((m <Perception>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:tram_img-val is deprecated.  Use raspicam_node-msg:tram_img instead.")
  (tram_img m))

(cl:ensure-generic-function 'background_img-val :lambda-list '(m))
(cl:defmethod background_img-val ((m <Perception>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:background_img-val is deprecated.  Use raspicam_node-msg:background_img instead.")
  (background_img m))

(cl:ensure-generic-function 'img7-val :lambda-list '(m))
(cl:defmethod img7-val ((m <Perception>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:img7-val is deprecated.  Use raspicam_node-msg:img7 instead.")
  (img7 m))

(cl:ensure-generic-function 'img8-val :lambda-list '(m))
(cl:defmethod img8-val ((m <Perception>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:img8-val is deprecated.  Use raspicam_node-msg:img8 instead.")
  (img8 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Perception>) ostream)
  "Serializes a message object of type '<Perception>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'steering_error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'variable2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'variable3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'at_intersection) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'direction) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'signal4) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'signal5) 1 0)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'undistorted_img) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'bev_img) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'mainlane_img) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'parking_img) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'tram_img) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'background_img) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'img7) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'img8) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Perception>) istream)
  "Deserializes a message object of type '<Perception>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
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
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'variable2) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'variable3) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'at_intersection) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'direction) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'signal4) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'signal5) (cl:not (cl:zerop (cl:read-byte istream))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Perception>)))
  "Returns string type for a message object of type '<Perception>"
  "raspicam_node/Perception")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Perception)))
  "Returns string type for a message object of type 'Perception"
  "raspicam_node/Perception")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Perception>)))
  "Returns md5sum for a message object of type '<Perception>"
  "b77d34b81a12b4e3196798b595588f33")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Perception)))
  "Returns md5sum for a message object of type 'Perception"
  "b77d34b81a12b4e3196798b595588f33")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Perception>)))
  "Returns full string definition for message of type '<Perception>"
  (cl:format cl:nil "# Message header~%Header header~%~%~%# Numerical variables~%float64 steering_error    # The steering angle error for lane keeping~%float64 variable2         # ---~%float64 variable3~%~%~%# Bool signals ~%bool at_intersection      # at the center of an intersection (#-shape)~%bool direction            # detected direction on the traffic sign (#-shape)~%bool signal4~%bool signal5~%~%~%# IMG msg ~%sensor_msgs/CompressedImage undistorted_img~%sensor_msgs/CompressedImage bev_img                # The bird's eye view image~%sensor_msgs/CompressedImage mainlane_img~%sensor_msgs/CompressedImage parking_img~%sensor_msgs/CompressedImage tram_img~%sensor_msgs/CompressedImage background_img~%sensor_msgs/CompressedImage img7~%sensor_msgs/CompressedImage img8~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/CompressedImage~%# This message contains a compressed image~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%~%string format        # Specifies the format of the data~%                     #   Acceptable values:~%                     #     jpeg, png~%uint8[] data         # Compressed image buffer~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Perception)))
  "Returns full string definition for message of type 'Perception"
  (cl:format cl:nil "# Message header~%Header header~%~%~%# Numerical variables~%float64 steering_error    # The steering angle error for lane keeping~%float64 variable2         # ---~%float64 variable3~%~%~%# Bool signals ~%bool at_intersection      # at the center of an intersection (#-shape)~%bool direction            # detected direction on the traffic sign (#-shape)~%bool signal4~%bool signal5~%~%~%# IMG msg ~%sensor_msgs/CompressedImage undistorted_img~%sensor_msgs/CompressedImage bev_img                # The bird's eye view image~%sensor_msgs/CompressedImage mainlane_img~%sensor_msgs/CompressedImage parking_img~%sensor_msgs/CompressedImage tram_img~%sensor_msgs/CompressedImage background_img~%sensor_msgs/CompressedImage img7~%sensor_msgs/CompressedImage img8~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/CompressedImage~%# This message contains a compressed image~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%~%string format        # Specifies the format of the data~%                     #   Acceptable values:~%                     #     jpeg, png~%uint8[] data         # Compressed image buffer~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Perception>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     8
     8
     1
     1
     1
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'undistorted_img))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'bev_img))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'mainlane_img))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'parking_img))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'tram_img))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'background_img))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'img7))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'img8))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Perception>))
  "Converts a ROS message object to a list"
  (cl:list 'Perception
    (cl:cons ':header (header msg))
    (cl:cons ':steering_error (steering_error msg))
    (cl:cons ':variable2 (variable2 msg))
    (cl:cons ':variable3 (variable3 msg))
    (cl:cons ':at_intersection (at_intersection msg))
    (cl:cons ':direction (direction msg))
    (cl:cons ':signal4 (signal4 msg))
    (cl:cons ':signal5 (signal5 msg))
    (cl:cons ':undistorted_img (undistorted_img msg))
    (cl:cons ':bev_img (bev_img msg))
    (cl:cons ':mainlane_img (mainlane_img msg))
    (cl:cons ':parking_img (parking_img msg))
    (cl:cons ':tram_img (tram_img msg))
    (cl:cons ':background_img (background_img msg))
    (cl:cons ':img7 (img7 msg))
    (cl:cons ':img8 (img8 msg))
))

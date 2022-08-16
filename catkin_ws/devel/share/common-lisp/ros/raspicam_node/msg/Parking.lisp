; Auto-generated. Do not edit!


(cl:in-package raspicam_node-msg)


;//! \htmlinclude Parking.msg.html

(cl:defclass <Parking> (roslisp-msg-protocol:ros-message)
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
   (parking_stg1_steering_error
    :reader parking_stg1_steering_error
    :initarg :parking_stg1_steering_error
    :type cl:float
    :initform 0.0)
   (parking_stg2_steering_error
    :reader parking_stg2_steering_error
    :initarg :parking_stg2_steering_error
    :type cl:float
    :initform 0.0)
   (begin_parking
    :reader begin_parking
    :initarg :begin_parking
    :type cl:boolean
    :initform cl:nil)
   (parking_stg1_stop
    :reader parking_stg1_stop
    :initarg :parking_stg1_stop
    :type cl:boolean
    :initform cl:nil)
   (parking_stg2_stop
    :reader parking_stg2_stop
    :initarg :parking_stg2_stop
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Parking (<Parking>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Parking>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Parking)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name raspicam_node-msg:<Parking> is deprecated: use raspicam_node-msg:Parking instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Parking>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:header-val is deprecated.  Use raspicam_node-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'steering_error-val :lambda-list '(m))
(cl:defmethod steering_error-val ((m <Parking>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:steering_error-val is deprecated.  Use raspicam_node-msg:steering_error instead.")
  (steering_error m))

(cl:ensure-generic-function 'parking_stg1_steering_error-val :lambda-list '(m))
(cl:defmethod parking_stg1_steering_error-val ((m <Parking>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:parking_stg1_steering_error-val is deprecated.  Use raspicam_node-msg:parking_stg1_steering_error instead.")
  (parking_stg1_steering_error m))

(cl:ensure-generic-function 'parking_stg2_steering_error-val :lambda-list '(m))
(cl:defmethod parking_stg2_steering_error-val ((m <Parking>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:parking_stg2_steering_error-val is deprecated.  Use raspicam_node-msg:parking_stg2_steering_error instead.")
  (parking_stg2_steering_error m))

(cl:ensure-generic-function 'begin_parking-val :lambda-list '(m))
(cl:defmethod begin_parking-val ((m <Parking>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:begin_parking-val is deprecated.  Use raspicam_node-msg:begin_parking instead.")
  (begin_parking m))

(cl:ensure-generic-function 'parking_stg1_stop-val :lambda-list '(m))
(cl:defmethod parking_stg1_stop-val ((m <Parking>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:parking_stg1_stop-val is deprecated.  Use raspicam_node-msg:parking_stg1_stop instead.")
  (parking_stg1_stop m))

(cl:ensure-generic-function 'parking_stg2_stop-val :lambda-list '(m))
(cl:defmethod parking_stg2_stop-val ((m <Parking>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:parking_stg2_stop-val is deprecated.  Use raspicam_node-msg:parking_stg2_stop instead.")
  (parking_stg2_stop m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Parking>) ostream)
  "Serializes a message object of type '<Parking>"
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
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'parking_stg1_steering_error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'parking_stg2_steering_error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'begin_parking) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'parking_stg1_stop) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'parking_stg2_stop) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Parking>) istream)
  "Deserializes a message object of type '<Parking>"
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
    (cl:setf (cl:slot-value msg 'parking_stg1_steering_error) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'parking_stg2_steering_error) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'begin_parking) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'parking_stg1_stop) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'parking_stg2_stop) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Parking>)))
  "Returns string type for a message object of type '<Parking>"
  "raspicam_node/Parking")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Parking)))
  "Returns string type for a message object of type 'Parking"
  "raspicam_node/Parking")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Parking>)))
  "Returns md5sum for a message object of type '<Parking>"
  "ed391e1436c52e7f07926b152c4f1a22")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Parking)))
  "Returns md5sum for a message object of type 'Parking"
  "ed391e1436c52e7f07926b152c4f1a22")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Parking>)))
  "Returns full string definition for message of type '<Parking>"
  (cl:format cl:nil "# Message header~%Header header~%~%~%# Numerical variables~%float64 steering_error    # The steering angle error for lane keeping~%float64 parking_stg1_steering_error~%float64 parking_stg2_steering_error~%~%~%# Bool signals ~%bool begin_parking        # begin parking (J-shape)~%bool parking_stg1_stop~%bool parking_stg2_stop~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Parking)))
  "Returns full string definition for message of type 'Parking"
  (cl:format cl:nil "# Message header~%Header header~%~%~%# Numerical variables~%float64 steering_error    # The steering angle error for lane keeping~%float64 parking_stg1_steering_error~%float64 parking_stg2_steering_error~%~%~%# Bool signals ~%bool begin_parking        # begin parking (J-shape)~%bool parking_stg1_stop~%bool parking_stg2_stop~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Parking>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     8
     8
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Parking>))
  "Converts a ROS message object to a list"
  (cl:list 'Parking
    (cl:cons ':header (header msg))
    (cl:cons ':steering_error (steering_error msg))
    (cl:cons ':parking_stg1_steering_error (parking_stg1_steering_error msg))
    (cl:cons ':parking_stg2_steering_error (parking_stg2_steering_error msg))
    (cl:cons ':begin_parking (begin_parking msg))
    (cl:cons ':parking_stg1_stop (parking_stg1_stop msg))
    (cl:cons ':parking_stg2_stop (parking_stg2_stop msg))
))

; Auto-generated. Do not edit!


(cl:in-package low_level_control-msg)


;//! \htmlinclude low_level_msg.msg.html

(cl:defclass <low_level_msg> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (linear_speed
    :reader linear_speed
    :initarg :linear_speed
    :type cl:float
    :initform 0.0)
   (rotation_speed
    :reader rotation_speed
    :initarg :rotation_speed
    :type cl:float
    :initform 0.0)
   (J_stage
    :reader J_stage
    :initarg :J_stage
    :type cl:integer
    :initform 0)
   (parking_stage
    :reader parking_stage
    :initarg :parking_stage
    :type cl:integer
    :initform 0)
   (urban_start_turning
    :reader urban_start_turning
    :initarg :urban_start_turning
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass low_level_msg (<low_level_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <low_level_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'low_level_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name low_level_control-msg:<low_level_msg> is deprecated: use low_level_control-msg:low_level_msg instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <low_level_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader low_level_control-msg:header-val is deprecated.  Use low_level_control-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'linear_speed-val :lambda-list '(m))
(cl:defmethod linear_speed-val ((m <low_level_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader low_level_control-msg:linear_speed-val is deprecated.  Use low_level_control-msg:linear_speed instead.")
  (linear_speed m))

(cl:ensure-generic-function 'rotation_speed-val :lambda-list '(m))
(cl:defmethod rotation_speed-val ((m <low_level_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader low_level_control-msg:rotation_speed-val is deprecated.  Use low_level_control-msg:rotation_speed instead.")
  (rotation_speed m))

(cl:ensure-generic-function 'J_stage-val :lambda-list '(m))
(cl:defmethod J_stage-val ((m <low_level_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader low_level_control-msg:J_stage-val is deprecated.  Use low_level_control-msg:J_stage instead.")
  (J_stage m))

(cl:ensure-generic-function 'parking_stage-val :lambda-list '(m))
(cl:defmethod parking_stage-val ((m <low_level_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader low_level_control-msg:parking_stage-val is deprecated.  Use low_level_control-msg:parking_stage instead.")
  (parking_stage m))

(cl:ensure-generic-function 'urban_start_turning-val :lambda-list '(m))
(cl:defmethod urban_start_turning-val ((m <low_level_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader low_level_control-msg:urban_start_turning-val is deprecated.  Use low_level_control-msg:urban_start_turning instead.")
  (urban_start_turning m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <low_level_msg>) ostream)
  "Serializes a message object of type '<low_level_msg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'linear_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'rotation_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'J_stage)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'parking_stage)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'urban_start_turning) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <low_level_msg>) istream)
  "Deserializes a message object of type '<low_level_msg>"
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
    (cl:setf (cl:slot-value msg 'linear_speed) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rotation_speed) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'J_stage) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'parking_stage) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:slot-value msg 'urban_start_turning) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<low_level_msg>)))
  "Returns string type for a message object of type '<low_level_msg>"
  "low_level_control/low_level_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'low_level_msg)))
  "Returns string type for a message object of type 'low_level_msg"
  "low_level_control/low_level_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<low_level_msg>)))
  "Returns md5sum for a message object of type '<low_level_msg>"
  "c762b1c31a1dd634c8be30cbcb06f431")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'low_level_msg)))
  "Returns md5sum for a message object of type 'low_level_msg"
  "c762b1c31a1dd634c8be30cbcb06f431")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<low_level_msg>)))
  "Returns full string definition for message of type '<low_level_msg>"
  (cl:format cl:nil "# Message header~%Header header~%~%# Vehicle States~%float64 linear_speed~%float64 rotation_speed~%~%int32 J_stage~%int32 parking_stage~%~%bool urban_start_turning~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'low_level_msg)))
  "Returns full string definition for message of type 'low_level_msg"
  (cl:format cl:nil "# Message header~%Header header~%~%# Vehicle States~%float64 linear_speed~%float64 rotation_speed~%~%int32 J_stage~%int32 parking_stage~%~%bool urban_start_turning~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <low_level_msg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     8
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <low_level_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'low_level_msg
    (cl:cons ':header (header msg))
    (cl:cons ':linear_speed (linear_speed msg))
    (cl:cons ':rotation_speed (rotation_speed msg))
    (cl:cons ':J_stage (J_stage msg))
    (cl:cons ':parking_stage (parking_stage msg))
    (cl:cons ':urban_start_turning (urban_start_turning msg))
))

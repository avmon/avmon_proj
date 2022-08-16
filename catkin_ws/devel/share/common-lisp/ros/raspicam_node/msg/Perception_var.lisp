; Auto-generated. Do not edit!


(cl:in-package raspicam_node-msg)


;//! \htmlinclude Perception_var.msg.html

(cl:defclass <Perception_var> (roslisp-msg-protocol:ros-message)
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
   (d2intersection
    :reader d2intersection
    :initarg :d2intersection
    :type cl:float
    :initform 0.0)
   (fvar3
    :reader fvar3
    :initarg :fvar3
    :type cl:float
    :initform 0.0)
   (urban_direction
    :reader urban_direction
    :initarg :urban_direction
    :type cl:fixnum
    :initform 0)
   (at_tram
    :reader at_tram
    :initarg :at_tram
    :type cl:boolean
    :initform cl:nil)
   (stop_turning_flag
    :reader stop_turning_flag
    :initarg :stop_turning_flag
    :type cl:boolean
    :initform cl:nil)
   (var2
    :reader var2
    :initarg :var2
    :type cl:boolean
    :initform cl:nil)
   (var3
    :reader var3
    :initarg :var3
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Perception_var (<Perception_var>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Perception_var>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Perception_var)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name raspicam_node-msg:<Perception_var> is deprecated: use raspicam_node-msg:Perception_var instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Perception_var>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:header-val is deprecated.  Use raspicam_node-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'steering_error-val :lambda-list '(m))
(cl:defmethod steering_error-val ((m <Perception_var>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:steering_error-val is deprecated.  Use raspicam_node-msg:steering_error instead.")
  (steering_error m))

(cl:ensure-generic-function 'd2intersection-val :lambda-list '(m))
(cl:defmethod d2intersection-val ((m <Perception_var>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:d2intersection-val is deprecated.  Use raspicam_node-msg:d2intersection instead.")
  (d2intersection m))

(cl:ensure-generic-function 'fvar3-val :lambda-list '(m))
(cl:defmethod fvar3-val ((m <Perception_var>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:fvar3-val is deprecated.  Use raspicam_node-msg:fvar3 instead.")
  (fvar3 m))

(cl:ensure-generic-function 'urban_direction-val :lambda-list '(m))
(cl:defmethod urban_direction-val ((m <Perception_var>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:urban_direction-val is deprecated.  Use raspicam_node-msg:urban_direction instead.")
  (urban_direction m))

(cl:ensure-generic-function 'at_tram-val :lambda-list '(m))
(cl:defmethod at_tram-val ((m <Perception_var>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:at_tram-val is deprecated.  Use raspicam_node-msg:at_tram instead.")
  (at_tram m))

(cl:ensure-generic-function 'stop_turning_flag-val :lambda-list '(m))
(cl:defmethod stop_turning_flag-val ((m <Perception_var>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:stop_turning_flag-val is deprecated.  Use raspicam_node-msg:stop_turning_flag instead.")
  (stop_turning_flag m))

(cl:ensure-generic-function 'var2-val :lambda-list '(m))
(cl:defmethod var2-val ((m <Perception_var>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:var2-val is deprecated.  Use raspicam_node-msg:var2 instead.")
  (var2 m))

(cl:ensure-generic-function 'var3-val :lambda-list '(m))
(cl:defmethod var3-val ((m <Perception_var>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raspicam_node-msg:var3-val is deprecated.  Use raspicam_node-msg:var3 instead.")
  (var3 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Perception_var>) ostream)
  "Serializes a message object of type '<Perception_var>"
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
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'd2intersection))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'fvar3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'urban_direction)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'at_tram) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'stop_turning_flag) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'var2) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'var3) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Perception_var>) istream)
  "Deserializes a message object of type '<Perception_var>"
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
    (cl:setf (cl:slot-value msg 'd2intersection) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fvar3) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'urban_direction) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:setf (cl:slot-value msg 'at_tram) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'stop_turning_flag) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'var2) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'var3) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Perception_var>)))
  "Returns string type for a message object of type '<Perception_var>"
  "raspicam_node/Perception_var")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Perception_var)))
  "Returns string type for a message object of type 'Perception_var"
  "raspicam_node/Perception_var")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Perception_var>)))
  "Returns md5sum for a message object of type '<Perception_var>"
  "de246360e784cb56f3a2ea4a5ddb7187")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Perception_var)))
  "Returns md5sum for a message object of type 'Perception_var"
  "de246360e784cb56f3a2ea4a5ddb7187")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Perception_var>)))
  "Returns full string definition for message of type '<Perception_var>"
  (cl:format cl:nil "# Message header~%# This message is for all the outputs of perception algorithms~%Header header~%~%~%# Numerical variables~%float64 steering_error       # The steering angle error for lane keeping~%float64 d2intersection~%float64 fvar3~%~%int8 urban_direction           # -1:left, 0:straight, 1:right~%~%~%# Bool signals ~%bool at_tram~%bool stop_turning_flag~%bool var2~%bool var3~%      ~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Perception_var)))
  "Returns full string definition for message of type 'Perception_var"
  (cl:format cl:nil "# Message header~%# This message is for all the outputs of perception algorithms~%Header header~%~%~%# Numerical variables~%float64 steering_error       # The steering angle error for lane keeping~%float64 d2intersection~%float64 fvar3~%~%int8 urban_direction           # -1:left, 0:straight, 1:right~%~%~%# Bool signals ~%bool at_tram~%bool stop_turning_flag~%bool var2~%bool var3~%      ~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Perception_var>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     8
     8
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Perception_var>))
  "Converts a ROS message object to a list"
  (cl:list 'Perception_var
    (cl:cons ':header (header msg))
    (cl:cons ':steering_error (steering_error msg))
    (cl:cons ':d2intersection (d2intersection msg))
    (cl:cons ':fvar3 (fvar3 msg))
    (cl:cons ':urban_direction (urban_direction msg))
    (cl:cons ':at_tram (at_tram msg))
    (cl:cons ':stop_turning_flag (stop_turning_flag msg))
    (cl:cons ':var2 (var2 msg))
    (cl:cons ':var3 (var3 msg))
))

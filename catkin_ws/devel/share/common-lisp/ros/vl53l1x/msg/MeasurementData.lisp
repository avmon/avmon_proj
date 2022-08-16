; Auto-generated. Do not edit!


(cl:in-package vl53l1x-msg)


;//! \htmlinclude MeasurementData.msg.html

(cl:defclass <MeasurementData> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (signal
    :reader signal
    :initarg :signal
    :type cl:float
    :initform 0.0)
   (ambient
    :reader ambient
    :initarg :ambient
    :type cl:float
    :initform 0.0)
   (effective_spad
    :reader effective_spad
    :initarg :effective_spad
    :type cl:fixnum
    :initform 0)
   (sigma
    :reader sigma
    :initarg :sigma
    :type cl:float
    :initform 0.0)
   (status
    :reader status
    :initarg :status
    :type cl:fixnum
    :initform 0))
)

(cl:defclass MeasurementData (<MeasurementData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MeasurementData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MeasurementData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vl53l1x-msg:<MeasurementData> is deprecated: use vl53l1x-msg:MeasurementData instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MeasurementData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vl53l1x-msg:header-val is deprecated.  Use vl53l1x-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'signal-val :lambda-list '(m))
(cl:defmethod signal-val ((m <MeasurementData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vl53l1x-msg:signal-val is deprecated.  Use vl53l1x-msg:signal instead.")
  (signal m))

(cl:ensure-generic-function 'ambient-val :lambda-list '(m))
(cl:defmethod ambient-val ((m <MeasurementData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vl53l1x-msg:ambient-val is deprecated.  Use vl53l1x-msg:ambient instead.")
  (ambient m))

(cl:ensure-generic-function 'effective_spad-val :lambda-list '(m))
(cl:defmethod effective_spad-val ((m <MeasurementData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vl53l1x-msg:effective_spad-val is deprecated.  Use vl53l1x-msg:effective_spad instead.")
  (effective_spad m))

(cl:ensure-generic-function 'sigma-val :lambda-list '(m))
(cl:defmethod sigma-val ((m <MeasurementData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vl53l1x-msg:sigma-val is deprecated.  Use vl53l1x-msg:sigma instead.")
  (sigma m))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <MeasurementData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vl53l1x-msg:status-val is deprecated.  Use vl53l1x-msg:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<MeasurementData>)))
    "Constants for message type '<MeasurementData>"
  '((:STATUS_RANGE_VALID . 0)
    (:STATUS_SIGMA_FAIL . 1)
    (:STATUS_SIGNAL_FAIL . 2)
    (:STATUS_RANGE_VALID_MIN_RANGE_CLIPPED . 3)
    (:STATUS_OUTOFBOUNDS_FAIL . 4)
    (:STATUS_HARDWARE_FAIL . 5)
    (:STATUS_RANGE_VALID_NO_WRAP_CHECK_FAIL . 6)
    (:STATUS_WRAP_TARGET_FAIL . 7)
    (:STATUS_PROCESSING_FAIL . 8)
    (:STATUS_XTALK_SIGNAL_FAIL . 9)
    (:STATUS_SYNCRONISATION_INT . 10)
    (:STATUS_RANGE_VALID_MERGED_PULSE . 11)
    (:STATUS_TARGET_PRESENT_LACK_OF_SIGNAL . 12)
    (:STATUS_MIN_RANGE_FAIL . 13)
    (:STATUS_RANGE_INVALID . 14)
    (:STATUS_NONE . 255))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'MeasurementData)))
    "Constants for message type 'MeasurementData"
  '((:STATUS_RANGE_VALID . 0)
    (:STATUS_SIGMA_FAIL . 1)
    (:STATUS_SIGNAL_FAIL . 2)
    (:STATUS_RANGE_VALID_MIN_RANGE_CLIPPED . 3)
    (:STATUS_OUTOFBOUNDS_FAIL . 4)
    (:STATUS_HARDWARE_FAIL . 5)
    (:STATUS_RANGE_VALID_NO_WRAP_CHECK_FAIL . 6)
    (:STATUS_WRAP_TARGET_FAIL . 7)
    (:STATUS_PROCESSING_FAIL . 8)
    (:STATUS_XTALK_SIGNAL_FAIL . 9)
    (:STATUS_SYNCRONISATION_INT . 10)
    (:STATUS_RANGE_VALID_MERGED_PULSE . 11)
    (:STATUS_TARGET_PRESENT_LACK_OF_SIGNAL . 12)
    (:STATUS_MIN_RANGE_FAIL . 13)
    (:STATUS_RANGE_INVALID . 14)
    (:STATUS_NONE . 255))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MeasurementData>) ostream)
  "Serializes a message object of type '<MeasurementData>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'signal))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'ambient))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'effective_spad)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'sigma))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MeasurementData>) istream)
  "Deserializes a message object of type '<MeasurementData>"
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
    (cl:setf (cl:slot-value msg 'signal) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ambient) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'effective_spad)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'sigma) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MeasurementData>)))
  "Returns string type for a message object of type '<MeasurementData>"
  "vl53l1x/MeasurementData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MeasurementData)))
  "Returns string type for a message object of type 'MeasurementData"
  "vl53l1x/MeasurementData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MeasurementData>)))
  "Returns md5sum for a message object of type '<MeasurementData>"
  "36897d720215b87a4d4722de6ad95b13")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MeasurementData)))
  "Returns md5sum for a message object of type 'MeasurementData"
  "36897d720215b87a4d4722de6ad95b13")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MeasurementData>)))
  "Returns full string definition for message of type '<MeasurementData>"
  (cl:format cl:nil "Header header~%~%# Some of the fields of resulting RangingMeasurementData structure.~%~%float64 signal # return signal rate in MegaCount per second (MCPS)~%float64 ambient # return ambient rate in MegaCount per second (MCPS)~%uint8 effective_spad # effective SPAD count for the current ranging~%float64 sigma # estimation of the standard deviation of the current ranging, m~%uint8 status # status for the current measurement, a value of 0 means the ranging is valid~%~%# Status field meanings:~%~%uint8 STATUS_RANGE_VALID = 0 # The Range is valid~%uint8 STATUS_SIGMA_FAIL = 1 # Sigma Fail~%uint8 STATUS_SIGNAL_FAIL = 2 # Signal fail~%uint8 STATUS_RANGE_VALID_MIN_RANGE_CLIPPED = 3 # Target is below minimum detection threshold~%uint8 STATUS_OUTOFBOUNDS_FAIL = 4 # Phase out of valid limits - different to a wrap exit~%uint8 STATUS_HARDWARE_FAIL = 5 # Hardware fail~%uint8 STATUS_RANGE_VALID_NO_WRAP_CHECK_FAIL = 6 # The Range is valid but the wraparound check has not been done~%uint8 STATUS_WRAP_TARGET_FAIL = 7 # Wrapped target - no matching phase in other VCSEL period timing~%uint8 STATUS_PROCESSING_FAIL = 8 # Internal algo underflow or overflow in lite ranging~%uint8 STATUS_XTALK_SIGNAL_FAIL = 9 # Specific to lite ranging~%uint8 STATUS_SYNCRONISATION_INT = 10 # 1st interrupt when starting ranging in back to back mode. Ignore data~%uint8 STATUS_RANGE_VALID_MERGED_PULSE = 11 # All Range ok but object is result of multiple pulses merging together. Used by RQL for merged pulse detection~%uint8 STATUS_TARGET_PRESENT_LACK_OF_SIGNAL = 12 # Used by RQL as different to phase fail~%uint8 STATUS_MIN_RANGE_FAIL = 13 # User ROI input is not valid e.g. beyond SPAD Array~%uint8 STATUS_RANGE_INVALID = 14 # lld returned valid range but negative value~%uint8 STATUS_NONE = 255 # No Update~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MeasurementData)))
  "Returns full string definition for message of type 'MeasurementData"
  (cl:format cl:nil "Header header~%~%# Some of the fields of resulting RangingMeasurementData structure.~%~%float64 signal # return signal rate in MegaCount per second (MCPS)~%float64 ambient # return ambient rate in MegaCount per second (MCPS)~%uint8 effective_spad # effective SPAD count for the current ranging~%float64 sigma # estimation of the standard deviation of the current ranging, m~%uint8 status # status for the current measurement, a value of 0 means the ranging is valid~%~%# Status field meanings:~%~%uint8 STATUS_RANGE_VALID = 0 # The Range is valid~%uint8 STATUS_SIGMA_FAIL = 1 # Sigma Fail~%uint8 STATUS_SIGNAL_FAIL = 2 # Signal fail~%uint8 STATUS_RANGE_VALID_MIN_RANGE_CLIPPED = 3 # Target is below minimum detection threshold~%uint8 STATUS_OUTOFBOUNDS_FAIL = 4 # Phase out of valid limits - different to a wrap exit~%uint8 STATUS_HARDWARE_FAIL = 5 # Hardware fail~%uint8 STATUS_RANGE_VALID_NO_WRAP_CHECK_FAIL = 6 # The Range is valid but the wraparound check has not been done~%uint8 STATUS_WRAP_TARGET_FAIL = 7 # Wrapped target - no matching phase in other VCSEL period timing~%uint8 STATUS_PROCESSING_FAIL = 8 # Internal algo underflow or overflow in lite ranging~%uint8 STATUS_XTALK_SIGNAL_FAIL = 9 # Specific to lite ranging~%uint8 STATUS_SYNCRONISATION_INT = 10 # 1st interrupt when starting ranging in back to back mode. Ignore data~%uint8 STATUS_RANGE_VALID_MERGED_PULSE = 11 # All Range ok but object is result of multiple pulses merging together. Used by RQL for merged pulse detection~%uint8 STATUS_TARGET_PRESENT_LACK_OF_SIGNAL = 12 # Used by RQL as different to phase fail~%uint8 STATUS_MIN_RANGE_FAIL = 13 # User ROI input is not valid e.g. beyond SPAD Array~%uint8 STATUS_RANGE_INVALID = 14 # lld returned valid range but negative value~%uint8 STATUS_NONE = 255 # No Update~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MeasurementData>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     8
     1
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MeasurementData>))
  "Converts a ROS message object to a list"
  (cl:list 'MeasurementData
    (cl:cons ':header (header msg))
    (cl:cons ':signal (signal msg))
    (cl:cons ':ambient (ambient msg))
    (cl:cons ':effective_spad (effective_spad msg))
    (cl:cons ':sigma (sigma msg))
    (cl:cons ':status (status msg))
))

;; Auto-generated. Do not edit!


(when (boundp 'vl53l1x::MeasurementData)
  (if (not (find-package "VL53L1X"))
    (make-package "VL53L1X"))
  (shadow 'MeasurementData (find-package "VL53L1X")))
(unless (find-package "VL53L1X::MEASUREMENTDATA")
  (make-package "VL53L1X::MEASUREMENTDATA"))

(in-package "ROS")
;;//! \htmlinclude MeasurementData.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*STATUS_RANGE_VALID*" (find-package "VL53L1X::MEASUREMENTDATA"))
(shadow '*STATUS_RANGE_VALID* (find-package "VL53L1X::MEASUREMENTDATA"))
(defconstant vl53l1x::MeasurementData::*STATUS_RANGE_VALID* 0)
(intern "*STATUS_SIGMA_FAIL*" (find-package "VL53L1X::MEASUREMENTDATA"))
(shadow '*STATUS_SIGMA_FAIL* (find-package "VL53L1X::MEASUREMENTDATA"))
(defconstant vl53l1x::MeasurementData::*STATUS_SIGMA_FAIL* 1)
(intern "*STATUS_SIGNAL_FAIL*" (find-package "VL53L1X::MEASUREMENTDATA"))
(shadow '*STATUS_SIGNAL_FAIL* (find-package "VL53L1X::MEASUREMENTDATA"))
(defconstant vl53l1x::MeasurementData::*STATUS_SIGNAL_FAIL* 2)
(intern "*STATUS_RANGE_VALID_MIN_RANGE_CLIPPED*" (find-package "VL53L1X::MEASUREMENTDATA"))
(shadow '*STATUS_RANGE_VALID_MIN_RANGE_CLIPPED* (find-package "VL53L1X::MEASUREMENTDATA"))
(defconstant vl53l1x::MeasurementData::*STATUS_RANGE_VALID_MIN_RANGE_CLIPPED* 3)
(intern "*STATUS_OUTOFBOUNDS_FAIL*" (find-package "VL53L1X::MEASUREMENTDATA"))
(shadow '*STATUS_OUTOFBOUNDS_FAIL* (find-package "VL53L1X::MEASUREMENTDATA"))
(defconstant vl53l1x::MeasurementData::*STATUS_OUTOFBOUNDS_FAIL* 4)
(intern "*STATUS_HARDWARE_FAIL*" (find-package "VL53L1X::MEASUREMENTDATA"))
(shadow '*STATUS_HARDWARE_FAIL* (find-package "VL53L1X::MEASUREMENTDATA"))
(defconstant vl53l1x::MeasurementData::*STATUS_HARDWARE_FAIL* 5)
(intern "*STATUS_RANGE_VALID_NO_WRAP_CHECK_FAIL*" (find-package "VL53L1X::MEASUREMENTDATA"))
(shadow '*STATUS_RANGE_VALID_NO_WRAP_CHECK_FAIL* (find-package "VL53L1X::MEASUREMENTDATA"))
(defconstant vl53l1x::MeasurementData::*STATUS_RANGE_VALID_NO_WRAP_CHECK_FAIL* 6)
(intern "*STATUS_WRAP_TARGET_FAIL*" (find-package "VL53L1X::MEASUREMENTDATA"))
(shadow '*STATUS_WRAP_TARGET_FAIL* (find-package "VL53L1X::MEASUREMENTDATA"))
(defconstant vl53l1x::MeasurementData::*STATUS_WRAP_TARGET_FAIL* 7)
(intern "*STATUS_PROCESSING_FAIL*" (find-package "VL53L1X::MEASUREMENTDATA"))
(shadow '*STATUS_PROCESSING_FAIL* (find-package "VL53L1X::MEASUREMENTDATA"))
(defconstant vl53l1x::MeasurementData::*STATUS_PROCESSING_FAIL* 8)
(intern "*STATUS_XTALK_SIGNAL_FAIL*" (find-package "VL53L1X::MEASUREMENTDATA"))
(shadow '*STATUS_XTALK_SIGNAL_FAIL* (find-package "VL53L1X::MEASUREMENTDATA"))
(defconstant vl53l1x::MeasurementData::*STATUS_XTALK_SIGNAL_FAIL* 9)
(intern "*STATUS_SYNCRONISATION_INT*" (find-package "VL53L1X::MEASUREMENTDATA"))
(shadow '*STATUS_SYNCRONISATION_INT* (find-package "VL53L1X::MEASUREMENTDATA"))
(defconstant vl53l1x::MeasurementData::*STATUS_SYNCRONISATION_INT* 10)
(intern "*STATUS_RANGE_VALID_MERGED_PULSE*" (find-package "VL53L1X::MEASUREMENTDATA"))
(shadow '*STATUS_RANGE_VALID_MERGED_PULSE* (find-package "VL53L1X::MEASUREMENTDATA"))
(defconstant vl53l1x::MeasurementData::*STATUS_RANGE_VALID_MERGED_PULSE* 11)
(intern "*STATUS_TARGET_PRESENT_LACK_OF_SIGNAL*" (find-package "VL53L1X::MEASUREMENTDATA"))
(shadow '*STATUS_TARGET_PRESENT_LACK_OF_SIGNAL* (find-package "VL53L1X::MEASUREMENTDATA"))
(defconstant vl53l1x::MeasurementData::*STATUS_TARGET_PRESENT_LACK_OF_SIGNAL* 12)
(intern "*STATUS_MIN_RANGE_FAIL*" (find-package "VL53L1X::MEASUREMENTDATA"))
(shadow '*STATUS_MIN_RANGE_FAIL* (find-package "VL53L1X::MEASUREMENTDATA"))
(defconstant vl53l1x::MeasurementData::*STATUS_MIN_RANGE_FAIL* 13)
(intern "*STATUS_RANGE_INVALID*" (find-package "VL53L1X::MEASUREMENTDATA"))
(shadow '*STATUS_RANGE_INVALID* (find-package "VL53L1X::MEASUREMENTDATA"))
(defconstant vl53l1x::MeasurementData::*STATUS_RANGE_INVALID* 14)
(intern "*STATUS_NONE*" (find-package "VL53L1X::MEASUREMENTDATA"))
(shadow '*STATUS_NONE* (find-package "VL53L1X::MEASUREMENTDATA"))
(defconstant vl53l1x::MeasurementData::*STATUS_NONE* 255)
(defclass vl53l1x::MeasurementData
  :super ros::object
  :slots (_header _signal _ambient _effective_spad _sigma _status ))

(defmethod vl53l1x::MeasurementData
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:signal __signal) 0.0)
    ((:ambient __ambient) 0.0)
    ((:effective_spad __effective_spad) 0)
    ((:sigma __sigma) 0.0)
    ((:status __status) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _signal (float __signal))
   (setq _ambient (float __ambient))
   (setq _effective_spad (round __effective_spad))
   (setq _sigma (float __sigma))
   (setq _status (round __status))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:signal
   (&optional __signal)
   (if __signal (setq _signal __signal)) _signal)
  (:ambient
   (&optional __ambient)
   (if __ambient (setq _ambient __ambient)) _ambient)
  (:effective_spad
   (&optional __effective_spad)
   (if __effective_spad (setq _effective_spad __effective_spad)) _effective_spad)
  (:sigma
   (&optional __sigma)
   (if __sigma (setq _sigma __sigma)) _sigma)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _signal
    8
    ;; float64 _ambient
    8
    ;; uint8 _effective_spad
    1
    ;; float64 _sigma
    8
    ;; uint8 _status
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _signal
       (sys::poke _signal (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ambient
       (sys::poke _ambient (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint8 _effective_spad
       (write-byte _effective_spad s)
     ;; float64 _sigma
       (sys::poke _sigma (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint8 _status
       (write-byte _status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _signal
     (setq _signal (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ambient
     (setq _ambient (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint8 _effective_spad
     (setq _effective_spad (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float64 _sigma
     (setq _sigma (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint8 _status
     (setq _status (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get vl53l1x::MeasurementData :md5sum-) "36897d720215b87a4d4722de6ad95b13")
(setf (get vl53l1x::MeasurementData :datatype-) "vl53l1x/MeasurementData")
(setf (get vl53l1x::MeasurementData :definition-)
      "Header header

# Some of the fields of resulting RangingMeasurementData structure.

float64 signal # return signal rate in MegaCount per second (MCPS)
float64 ambient # return ambient rate in MegaCount per second (MCPS)
uint8 effective_spad # effective SPAD count for the current ranging
float64 sigma # estimation of the standard deviation of the current ranging, m
uint8 status # status for the current measurement, a value of 0 means the ranging is valid

# Status field meanings:

uint8 STATUS_RANGE_VALID = 0 # The Range is valid
uint8 STATUS_SIGMA_FAIL = 1 # Sigma Fail
uint8 STATUS_SIGNAL_FAIL = 2 # Signal fail
uint8 STATUS_RANGE_VALID_MIN_RANGE_CLIPPED = 3 # Target is below minimum detection threshold
uint8 STATUS_OUTOFBOUNDS_FAIL = 4 # Phase out of valid limits - different to a wrap exit
uint8 STATUS_HARDWARE_FAIL = 5 # Hardware fail
uint8 STATUS_RANGE_VALID_NO_WRAP_CHECK_FAIL = 6 # The Range is valid but the wraparound check has not been done
uint8 STATUS_WRAP_TARGET_FAIL = 7 # Wrapped target - no matching phase in other VCSEL period timing
uint8 STATUS_PROCESSING_FAIL = 8 # Internal algo underflow or overflow in lite ranging
uint8 STATUS_XTALK_SIGNAL_FAIL = 9 # Specific to lite ranging
uint8 STATUS_SYNCRONISATION_INT = 10 # 1st interrupt when starting ranging in back to back mode. Ignore data
uint8 STATUS_RANGE_VALID_MERGED_PULSE = 11 # All Range ok but object is result of multiple pulses merging together. Used by RQL for merged pulse detection
uint8 STATUS_TARGET_PRESENT_LACK_OF_SIGNAL = 12 # Used by RQL as different to phase fail
uint8 STATUS_MIN_RANGE_FAIL = 13 # User ROI input is not valid e.g. beyond SPAD Array
uint8 STATUS_RANGE_INVALID = 14 # lld returned valid range but negative value
uint8 STATUS_NONE = 255 # No Update

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



(provide :vl53l1x/MeasurementData "36897d720215b87a4d4722de6ad95b13")



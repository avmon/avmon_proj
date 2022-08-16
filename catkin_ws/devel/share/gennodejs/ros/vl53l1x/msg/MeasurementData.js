// Auto-generated. Do not edit!

// (in-package vl53l1x.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class MeasurementData {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.signal = null;
      this.ambient = null;
      this.effective_spad = null;
      this.sigma = null;
      this.status = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('signal')) {
        this.signal = initObj.signal
      }
      else {
        this.signal = 0.0;
      }
      if (initObj.hasOwnProperty('ambient')) {
        this.ambient = initObj.ambient
      }
      else {
        this.ambient = 0.0;
      }
      if (initObj.hasOwnProperty('effective_spad')) {
        this.effective_spad = initObj.effective_spad
      }
      else {
        this.effective_spad = 0;
      }
      if (initObj.hasOwnProperty('sigma')) {
        this.sigma = initObj.sigma
      }
      else {
        this.sigma = 0.0;
      }
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MeasurementData
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [signal]
    bufferOffset = _serializer.float64(obj.signal, buffer, bufferOffset);
    // Serialize message field [ambient]
    bufferOffset = _serializer.float64(obj.ambient, buffer, bufferOffset);
    // Serialize message field [effective_spad]
    bufferOffset = _serializer.uint8(obj.effective_spad, buffer, bufferOffset);
    // Serialize message field [sigma]
    bufferOffset = _serializer.float64(obj.sigma, buffer, bufferOffset);
    // Serialize message field [status]
    bufferOffset = _serializer.uint8(obj.status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MeasurementData
    let len;
    let data = new MeasurementData(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [signal]
    data.signal = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [ambient]
    data.ambient = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [effective_spad]
    data.effective_spad = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [sigma]
    data.sigma = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [status]
    data.status = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 26;
  }

  static datatype() {
    // Returns string type for a message object
    return 'vl53l1x/MeasurementData';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '36897d720215b87a4d4722de6ad95b13';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MeasurementData(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.signal !== undefined) {
      resolved.signal = msg.signal;
    }
    else {
      resolved.signal = 0.0
    }

    if (msg.ambient !== undefined) {
      resolved.ambient = msg.ambient;
    }
    else {
      resolved.ambient = 0.0
    }

    if (msg.effective_spad !== undefined) {
      resolved.effective_spad = msg.effective_spad;
    }
    else {
      resolved.effective_spad = 0
    }

    if (msg.sigma !== undefined) {
      resolved.sigma = msg.sigma;
    }
    else {
      resolved.sigma = 0.0
    }

    if (msg.status !== undefined) {
      resolved.status = msg.status;
    }
    else {
      resolved.status = 0
    }

    return resolved;
    }
};

// Constants for message
MeasurementData.Constants = {
  STATUS_RANGE_VALID: 0,
  STATUS_SIGMA_FAIL: 1,
  STATUS_SIGNAL_FAIL: 2,
  STATUS_RANGE_VALID_MIN_RANGE_CLIPPED: 3,
  STATUS_OUTOFBOUNDS_FAIL: 4,
  STATUS_HARDWARE_FAIL: 5,
  STATUS_RANGE_VALID_NO_WRAP_CHECK_FAIL: 6,
  STATUS_WRAP_TARGET_FAIL: 7,
  STATUS_PROCESSING_FAIL: 8,
  STATUS_XTALK_SIGNAL_FAIL: 9,
  STATUS_SYNCRONISATION_INT: 10,
  STATUS_RANGE_VALID_MERGED_PULSE: 11,
  STATUS_TARGET_PRESENT_LACK_OF_SIGNAL: 12,
  STATUS_MIN_RANGE_FAIL: 13,
  STATUS_RANGE_INVALID: 14,
  STATUS_NONE: 255,
}

module.exports = MeasurementData;

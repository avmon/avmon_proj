// Auto-generated. Do not edit!

// (in-package raspicam_node.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Parking {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.steering_error = null;
      this.parking_stg1_steering_error = null;
      this.parking_stg2_steering_error = null;
      this.begin_parking = null;
      this.parking_stg1_stop = null;
      this.parking_stg2_stop = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('steering_error')) {
        this.steering_error = initObj.steering_error
      }
      else {
        this.steering_error = 0.0;
      }
      if (initObj.hasOwnProperty('parking_stg1_steering_error')) {
        this.parking_stg1_steering_error = initObj.parking_stg1_steering_error
      }
      else {
        this.parking_stg1_steering_error = 0.0;
      }
      if (initObj.hasOwnProperty('parking_stg2_steering_error')) {
        this.parking_stg2_steering_error = initObj.parking_stg2_steering_error
      }
      else {
        this.parking_stg2_steering_error = 0.0;
      }
      if (initObj.hasOwnProperty('begin_parking')) {
        this.begin_parking = initObj.begin_parking
      }
      else {
        this.begin_parking = false;
      }
      if (initObj.hasOwnProperty('parking_stg1_stop')) {
        this.parking_stg1_stop = initObj.parking_stg1_stop
      }
      else {
        this.parking_stg1_stop = false;
      }
      if (initObj.hasOwnProperty('parking_stg2_stop')) {
        this.parking_stg2_stop = initObj.parking_stg2_stop
      }
      else {
        this.parking_stg2_stop = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Parking
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [steering_error]
    bufferOffset = _serializer.float64(obj.steering_error, buffer, bufferOffset);
    // Serialize message field [parking_stg1_steering_error]
    bufferOffset = _serializer.float64(obj.parking_stg1_steering_error, buffer, bufferOffset);
    // Serialize message field [parking_stg2_steering_error]
    bufferOffset = _serializer.float64(obj.parking_stg2_steering_error, buffer, bufferOffset);
    // Serialize message field [begin_parking]
    bufferOffset = _serializer.bool(obj.begin_parking, buffer, bufferOffset);
    // Serialize message field [parking_stg1_stop]
    bufferOffset = _serializer.bool(obj.parking_stg1_stop, buffer, bufferOffset);
    // Serialize message field [parking_stg2_stop]
    bufferOffset = _serializer.bool(obj.parking_stg2_stop, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Parking
    let len;
    let data = new Parking(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [steering_error]
    data.steering_error = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [parking_stg1_steering_error]
    data.parking_stg1_steering_error = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [parking_stg2_steering_error]
    data.parking_stg2_steering_error = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [begin_parking]
    data.begin_parking = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [parking_stg1_stop]
    data.parking_stg1_stop = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [parking_stg2_stop]
    data.parking_stg2_stop = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 27;
  }

  static datatype() {
    // Returns string type for a message object
    return 'raspicam_node/Parking';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ed391e1436c52e7f07926b152c4f1a22';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Message header
    Header header
    
    
    # Numerical variables
    float64 steering_error    # The steering angle error for lane keeping
    float64 parking_stg1_steering_error
    float64 parking_stg2_steering_error
    
    
    # Bool signals 
    bool begin_parking        # begin parking (J-shape)
    bool parking_stg1_stop
    bool parking_stg2_stop
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
    const resolved = new Parking(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.steering_error !== undefined) {
      resolved.steering_error = msg.steering_error;
    }
    else {
      resolved.steering_error = 0.0
    }

    if (msg.parking_stg1_steering_error !== undefined) {
      resolved.parking_stg1_steering_error = msg.parking_stg1_steering_error;
    }
    else {
      resolved.parking_stg1_steering_error = 0.0
    }

    if (msg.parking_stg2_steering_error !== undefined) {
      resolved.parking_stg2_steering_error = msg.parking_stg2_steering_error;
    }
    else {
      resolved.parking_stg2_steering_error = 0.0
    }

    if (msg.begin_parking !== undefined) {
      resolved.begin_parking = msg.begin_parking;
    }
    else {
      resolved.begin_parking = false
    }

    if (msg.parking_stg1_stop !== undefined) {
      resolved.parking_stg1_stop = msg.parking_stg1_stop;
    }
    else {
      resolved.parking_stg1_stop = false
    }

    if (msg.parking_stg2_stop !== undefined) {
      resolved.parking_stg2_stop = msg.parking_stg2_stop;
    }
    else {
      resolved.parking_stg2_stop = false
    }

    return resolved;
    }
};

module.exports = Parking;

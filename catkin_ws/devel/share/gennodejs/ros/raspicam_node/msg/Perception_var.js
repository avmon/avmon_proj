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

class Perception_var {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.steering_error = null;
      this.d2intersection = null;
      this.fvar3 = null;
      this.urban_direction = null;
      this.at_tram = null;
      this.stop_turning_flag = null;
      this.var2 = null;
      this.var3 = null;
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
      if (initObj.hasOwnProperty('d2intersection')) {
        this.d2intersection = initObj.d2intersection
      }
      else {
        this.d2intersection = 0.0;
      }
      if (initObj.hasOwnProperty('fvar3')) {
        this.fvar3 = initObj.fvar3
      }
      else {
        this.fvar3 = 0.0;
      }
      if (initObj.hasOwnProperty('urban_direction')) {
        this.urban_direction = initObj.urban_direction
      }
      else {
        this.urban_direction = 0;
      }
      if (initObj.hasOwnProperty('at_tram')) {
        this.at_tram = initObj.at_tram
      }
      else {
        this.at_tram = false;
      }
      if (initObj.hasOwnProperty('stop_turning_flag')) {
        this.stop_turning_flag = initObj.stop_turning_flag
      }
      else {
        this.stop_turning_flag = false;
      }
      if (initObj.hasOwnProperty('var2')) {
        this.var2 = initObj.var2
      }
      else {
        this.var2 = false;
      }
      if (initObj.hasOwnProperty('var3')) {
        this.var3 = initObj.var3
      }
      else {
        this.var3 = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Perception_var
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [steering_error]
    bufferOffset = _serializer.float64(obj.steering_error, buffer, bufferOffset);
    // Serialize message field [d2intersection]
    bufferOffset = _serializer.float64(obj.d2intersection, buffer, bufferOffset);
    // Serialize message field [fvar3]
    bufferOffset = _serializer.float64(obj.fvar3, buffer, bufferOffset);
    // Serialize message field [urban_direction]
    bufferOffset = _serializer.int8(obj.urban_direction, buffer, bufferOffset);
    // Serialize message field [at_tram]
    bufferOffset = _serializer.bool(obj.at_tram, buffer, bufferOffset);
    // Serialize message field [stop_turning_flag]
    bufferOffset = _serializer.bool(obj.stop_turning_flag, buffer, bufferOffset);
    // Serialize message field [var2]
    bufferOffset = _serializer.bool(obj.var2, buffer, bufferOffset);
    // Serialize message field [var3]
    bufferOffset = _serializer.bool(obj.var3, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Perception_var
    let len;
    let data = new Perception_var(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [steering_error]
    data.steering_error = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [d2intersection]
    data.d2intersection = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [fvar3]
    data.fvar3 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [urban_direction]
    data.urban_direction = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [at_tram]
    data.at_tram = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [stop_turning_flag]
    data.stop_turning_flag = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [var2]
    data.var2 = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [var3]
    data.var3 = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 29;
  }

  static datatype() {
    // Returns string type for a message object
    return 'raspicam_node/Perception_var';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'de246360e784cb56f3a2ea4a5ddb7187';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Message header
    # This message is for all the outputs of perception algorithms
    Header header
    
    
    # Numerical variables
    float64 steering_error       # The steering angle error for lane keeping
    float64 d2intersection
    float64 fvar3
    
    int8 urban_direction           # -1:left, 0:straight, 1:right
    
    
    # Bool signals 
    bool at_tram
    bool stop_turning_flag
    bool var2
    bool var3
          
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
    const resolved = new Perception_var(null);
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

    if (msg.d2intersection !== undefined) {
      resolved.d2intersection = msg.d2intersection;
    }
    else {
      resolved.d2intersection = 0.0
    }

    if (msg.fvar3 !== undefined) {
      resolved.fvar3 = msg.fvar3;
    }
    else {
      resolved.fvar3 = 0.0
    }

    if (msg.urban_direction !== undefined) {
      resolved.urban_direction = msg.urban_direction;
    }
    else {
      resolved.urban_direction = 0
    }

    if (msg.at_tram !== undefined) {
      resolved.at_tram = msg.at_tram;
    }
    else {
      resolved.at_tram = false
    }

    if (msg.stop_turning_flag !== undefined) {
      resolved.stop_turning_flag = msg.stop_turning_flag;
    }
    else {
      resolved.stop_turning_flag = false
    }

    if (msg.var2 !== undefined) {
      resolved.var2 = msg.var2;
    }
    else {
      resolved.var2 = false
    }

    if (msg.var3 !== undefined) {
      resolved.var3 = msg.var3;
    }
    else {
      resolved.var3 = false
    }

    return resolved;
    }
};

module.exports = Perception_var;

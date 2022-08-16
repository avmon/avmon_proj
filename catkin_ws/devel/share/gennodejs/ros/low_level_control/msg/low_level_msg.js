// Auto-generated. Do not edit!

// (in-package low_level_control.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class low_level_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.linear_speed = null;
      this.rotation_speed = null;
      this.J_stage = null;
      this.parking_stage = null;
      this.urban_start_turning = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('linear_speed')) {
        this.linear_speed = initObj.linear_speed
      }
      else {
        this.linear_speed = 0.0;
      }
      if (initObj.hasOwnProperty('rotation_speed')) {
        this.rotation_speed = initObj.rotation_speed
      }
      else {
        this.rotation_speed = 0.0;
      }
      if (initObj.hasOwnProperty('J_stage')) {
        this.J_stage = initObj.J_stage
      }
      else {
        this.J_stage = 0;
      }
      if (initObj.hasOwnProperty('parking_stage')) {
        this.parking_stage = initObj.parking_stage
      }
      else {
        this.parking_stage = 0;
      }
      if (initObj.hasOwnProperty('urban_start_turning')) {
        this.urban_start_turning = initObj.urban_start_turning
      }
      else {
        this.urban_start_turning = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type low_level_msg
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [linear_speed]
    bufferOffset = _serializer.float64(obj.linear_speed, buffer, bufferOffset);
    // Serialize message field [rotation_speed]
    bufferOffset = _serializer.float64(obj.rotation_speed, buffer, bufferOffset);
    // Serialize message field [J_stage]
    bufferOffset = _serializer.int32(obj.J_stage, buffer, bufferOffset);
    // Serialize message field [parking_stage]
    bufferOffset = _serializer.int32(obj.parking_stage, buffer, bufferOffset);
    // Serialize message field [urban_start_turning]
    bufferOffset = _serializer.bool(obj.urban_start_turning, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type low_level_msg
    let len;
    let data = new low_level_msg(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [linear_speed]
    data.linear_speed = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [rotation_speed]
    data.rotation_speed = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [J_stage]
    data.J_stage = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [parking_stage]
    data.parking_stage = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [urban_start_turning]
    data.urban_start_turning = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 25;
  }

  static datatype() {
    // Returns string type for a message object
    return 'low_level_control/low_level_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c762b1c31a1dd634c8be30cbcb06f431';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Message header
    Header header
    
    # Vehicle States
    float64 linear_speed
    float64 rotation_speed
    
    int32 J_stage
    int32 parking_stage
    
    bool urban_start_turning
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
    const resolved = new low_level_msg(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.linear_speed !== undefined) {
      resolved.linear_speed = msg.linear_speed;
    }
    else {
      resolved.linear_speed = 0.0
    }

    if (msg.rotation_speed !== undefined) {
      resolved.rotation_speed = msg.rotation_speed;
    }
    else {
      resolved.rotation_speed = 0.0
    }

    if (msg.J_stage !== undefined) {
      resolved.J_stage = msg.J_stage;
    }
    else {
      resolved.J_stage = 0
    }

    if (msg.parking_stage !== undefined) {
      resolved.parking_stage = msg.parking_stage;
    }
    else {
      resolved.parking_stage = 0
    }

    if (msg.urban_start_turning !== undefined) {
      resolved.urban_start_turning = msg.urban_start_turning;
    }
    else {
      resolved.urban_start_turning = false
    }

    return resolved;
    }
};

module.exports = low_level_msg;

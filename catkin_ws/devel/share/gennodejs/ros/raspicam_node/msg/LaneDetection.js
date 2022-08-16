// Auto-generated. Do not edit!

// (in-package raspicam_node.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

class LaneDetection {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.steering_error = null;
      this.at_curve = null;
      this.resized_img = null;
      this.bw_img = null;
    }
    else {
      if (initObj.hasOwnProperty('steering_error')) {
        this.steering_error = initObj.steering_error
      }
      else {
        this.steering_error = 0.0;
      }
      if (initObj.hasOwnProperty('at_curve')) {
        this.at_curve = initObj.at_curve
      }
      else {
        this.at_curve = false;
      }
      if (initObj.hasOwnProperty('resized_img')) {
        this.resized_img = initObj.resized_img
      }
      else {
        this.resized_img = new sensor_msgs.msg.CompressedImage();
      }
      if (initObj.hasOwnProperty('bw_img')) {
        this.bw_img = initObj.bw_img
      }
      else {
        this.bw_img = new sensor_msgs.msg.CompressedImage();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LaneDetection
    // Serialize message field [steering_error]
    bufferOffset = _serializer.float64(obj.steering_error, buffer, bufferOffset);
    // Serialize message field [at_curve]
    bufferOffset = _serializer.bool(obj.at_curve, buffer, bufferOffset);
    // Serialize message field [resized_img]
    bufferOffset = sensor_msgs.msg.CompressedImage.serialize(obj.resized_img, buffer, bufferOffset);
    // Serialize message field [bw_img]
    bufferOffset = sensor_msgs.msg.CompressedImage.serialize(obj.bw_img, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LaneDetection
    let len;
    let data = new LaneDetection(null);
    // Deserialize message field [steering_error]
    data.steering_error = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [at_curve]
    data.at_curve = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [resized_img]
    data.resized_img = sensor_msgs.msg.CompressedImage.deserialize(buffer, bufferOffset);
    // Deserialize message field [bw_img]
    data.bw_img = sensor_msgs.msg.CompressedImage.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += sensor_msgs.msg.CompressedImage.getMessageSize(object.resized_img);
    length += sensor_msgs.msg.CompressedImage.getMessageSize(object.bw_img);
    return length + 9;
  }

  static datatype() {
    // Returns string type for a message object
    return 'raspicam_node/LaneDetection';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '33f171634fb931d1dc01a255358d5654';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # The steering angle error returned by the lane detection
    float64 steering_error
    
    # Whether the vehicle is at a curve or on a straight lane
    bool at_curve
    
    # img msg for review
    sensor_msgs/CompressedImage resized_img
    sensor_msgs/CompressedImage bw_img
    
    
    ================================================================================
    MSG: sensor_msgs/CompressedImage
    # This message contains a compressed image
    
    Header header        # Header timestamp should be acquisition time of image
                         # Header frame_id should be optical frame of camera
                         # origin of frame should be optical center of camera
                         # +x should point to the right in the image
                         # +y should point down in the image
                         # +z should point into to plane of the image
    
    string format        # Specifies the format of the data
                         #   Acceptable values:
                         #     jpeg, png
    uint8[] data         # Compressed image buffer
    
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
    const resolved = new LaneDetection(null);
    if (msg.steering_error !== undefined) {
      resolved.steering_error = msg.steering_error;
    }
    else {
      resolved.steering_error = 0.0
    }

    if (msg.at_curve !== undefined) {
      resolved.at_curve = msg.at_curve;
    }
    else {
      resolved.at_curve = false
    }

    if (msg.resized_img !== undefined) {
      resolved.resized_img = sensor_msgs.msg.CompressedImage.Resolve(msg.resized_img)
    }
    else {
      resolved.resized_img = new sensor_msgs.msg.CompressedImage()
    }

    if (msg.bw_img !== undefined) {
      resolved.bw_img = sensor_msgs.msg.CompressedImage.Resolve(msg.bw_img)
    }
    else {
      resolved.bw_img = new sensor_msgs.msg.CompressedImage()
    }

    return resolved;
    }
};

module.exports = LaneDetection;

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
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Perception_img {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.undistorted_img = null;
      this.bev_img = null;
      this.mainlane_img = null;
      this.parking_img = null;
      this.tram_img = null;
      this.background_img = null;
      this.img7 = null;
      this.img8 = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('undistorted_img')) {
        this.undistorted_img = initObj.undistorted_img
      }
      else {
        this.undistorted_img = new sensor_msgs.msg.CompressedImage();
      }
      if (initObj.hasOwnProperty('bev_img')) {
        this.bev_img = initObj.bev_img
      }
      else {
        this.bev_img = new sensor_msgs.msg.CompressedImage();
      }
      if (initObj.hasOwnProperty('mainlane_img')) {
        this.mainlane_img = initObj.mainlane_img
      }
      else {
        this.mainlane_img = new sensor_msgs.msg.Image();
      }
      if (initObj.hasOwnProperty('parking_img')) {
        this.parking_img = initObj.parking_img
      }
      else {
        this.parking_img = new sensor_msgs.msg.Image();
      }
      if (initObj.hasOwnProperty('tram_img')) {
        this.tram_img = initObj.tram_img
      }
      else {
        this.tram_img = new sensor_msgs.msg.Image();
      }
      if (initObj.hasOwnProperty('background_img')) {
        this.background_img = initObj.background_img
      }
      else {
        this.background_img = new sensor_msgs.msg.Image();
      }
      if (initObj.hasOwnProperty('img7')) {
        this.img7 = initObj.img7
      }
      else {
        this.img7 = new sensor_msgs.msg.CompressedImage();
      }
      if (initObj.hasOwnProperty('img8')) {
        this.img8 = initObj.img8
      }
      else {
        this.img8 = new sensor_msgs.msg.CompressedImage();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Perception_img
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [undistorted_img]
    bufferOffset = sensor_msgs.msg.CompressedImage.serialize(obj.undistorted_img, buffer, bufferOffset);
    // Serialize message field [bev_img]
    bufferOffset = sensor_msgs.msg.CompressedImage.serialize(obj.bev_img, buffer, bufferOffset);
    // Serialize message field [mainlane_img]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.mainlane_img, buffer, bufferOffset);
    // Serialize message field [parking_img]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.parking_img, buffer, bufferOffset);
    // Serialize message field [tram_img]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.tram_img, buffer, bufferOffset);
    // Serialize message field [background_img]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.background_img, buffer, bufferOffset);
    // Serialize message field [img7]
    bufferOffset = sensor_msgs.msg.CompressedImage.serialize(obj.img7, buffer, bufferOffset);
    // Serialize message field [img8]
    bufferOffset = sensor_msgs.msg.CompressedImage.serialize(obj.img8, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Perception_img
    let len;
    let data = new Perception_img(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [undistorted_img]
    data.undistorted_img = sensor_msgs.msg.CompressedImage.deserialize(buffer, bufferOffset);
    // Deserialize message field [bev_img]
    data.bev_img = sensor_msgs.msg.CompressedImage.deserialize(buffer, bufferOffset);
    // Deserialize message field [mainlane_img]
    data.mainlane_img = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    // Deserialize message field [parking_img]
    data.parking_img = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    // Deserialize message field [tram_img]
    data.tram_img = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    // Deserialize message field [background_img]
    data.background_img = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    // Deserialize message field [img7]
    data.img7 = sensor_msgs.msg.CompressedImage.deserialize(buffer, bufferOffset);
    // Deserialize message field [img8]
    data.img8 = sensor_msgs.msg.CompressedImage.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += sensor_msgs.msg.CompressedImage.getMessageSize(object.undistorted_img);
    length += sensor_msgs.msg.CompressedImage.getMessageSize(object.bev_img);
    length += sensor_msgs.msg.Image.getMessageSize(object.mainlane_img);
    length += sensor_msgs.msg.Image.getMessageSize(object.parking_img);
    length += sensor_msgs.msg.Image.getMessageSize(object.tram_img);
    length += sensor_msgs.msg.Image.getMessageSize(object.background_img);
    length += sensor_msgs.msg.CompressedImage.getMessageSize(object.img7);
    length += sensor_msgs.msg.CompressedImage.getMessageSize(object.img8);
    return length;
  }

  static datatype() {
    // Returns string type for a message object
    return 'raspicam_node/Perception_img';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8a56b3e3562f70b07899255b3e4eb24a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Message header
    # This message is only for all the imgs output by the synthetic segmentation 
    Header header
    
    
    # IMG msg 
    sensor_msgs/CompressedImage undistorted_img
    sensor_msgs/CompressedImage bev_img                # The bird's eye view image
    sensor_msgs/Image mainlane_img
    sensor_msgs/Image parking_img
    sensor_msgs/Image tram_img
    sensor_msgs/Image background_img
    sensor_msgs/CompressedImage img7
    sensor_msgs/CompressedImage img8
    
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
    MSG: sensor_msgs/Image
    # This message contains an uncompressed image
    # (0, 0) is at top-left corner of image
    #
    
    Header header        # Header timestamp should be acquisition time of image
                         # Header frame_id should be optical frame of camera
                         # origin of frame should be optical center of camera
                         # +x should point to the right in the image
                         # +y should point down in the image
                         # +z should point into to plane of the image
                         # If the frame_id here and the frame_id of the CameraInfo
                         # message associated with the image conflict
                         # the behavior is undefined
    
    uint32 height         # image height, that is, number of rows
    uint32 width          # image width, that is, number of columns
    
    # The legal values for encoding are in file src/image_encodings.cpp
    # If you want to standardize a new string format, join
    # ros-users@lists.sourceforge.net and send an email proposing a new encoding.
    
    string encoding       # Encoding of pixels -- channel meaning, ordering, size
                          # taken from the list of strings in include/sensor_msgs/image_encodings.h
    
    uint8 is_bigendian    # is this data bigendian?
    uint32 step           # Full row length in bytes
    uint8[] data          # actual matrix data, size is (step * rows)
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Perception_img(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.undistorted_img !== undefined) {
      resolved.undistorted_img = sensor_msgs.msg.CompressedImage.Resolve(msg.undistorted_img)
    }
    else {
      resolved.undistorted_img = new sensor_msgs.msg.CompressedImage()
    }

    if (msg.bev_img !== undefined) {
      resolved.bev_img = sensor_msgs.msg.CompressedImage.Resolve(msg.bev_img)
    }
    else {
      resolved.bev_img = new sensor_msgs.msg.CompressedImage()
    }

    if (msg.mainlane_img !== undefined) {
      resolved.mainlane_img = sensor_msgs.msg.Image.Resolve(msg.mainlane_img)
    }
    else {
      resolved.mainlane_img = new sensor_msgs.msg.Image()
    }

    if (msg.parking_img !== undefined) {
      resolved.parking_img = sensor_msgs.msg.Image.Resolve(msg.parking_img)
    }
    else {
      resolved.parking_img = new sensor_msgs.msg.Image()
    }

    if (msg.tram_img !== undefined) {
      resolved.tram_img = sensor_msgs.msg.Image.Resolve(msg.tram_img)
    }
    else {
      resolved.tram_img = new sensor_msgs.msg.Image()
    }

    if (msg.background_img !== undefined) {
      resolved.background_img = sensor_msgs.msg.Image.Resolve(msg.background_img)
    }
    else {
      resolved.background_img = new sensor_msgs.msg.Image()
    }

    if (msg.img7 !== undefined) {
      resolved.img7 = sensor_msgs.msg.CompressedImage.Resolve(msg.img7)
    }
    else {
      resolved.img7 = new sensor_msgs.msg.CompressedImage()
    }

    if (msg.img8 !== undefined) {
      resolved.img8 = sensor_msgs.msg.CompressedImage.Resolve(msg.img8)
    }
    else {
      resolved.img8 = new sensor_msgs.msg.CompressedImage()
    }

    return resolved;
    }
};

module.exports = Perception_img;

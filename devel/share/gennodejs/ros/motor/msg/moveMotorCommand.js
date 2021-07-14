// Auto-generated. Do not edit!

// (in-package motor.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class moveMotorCommand {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pwm = null;
      this.direction = null;
    }
    else {
      if (initObj.hasOwnProperty('pwm')) {
        this.pwm = initObj.pwm
      }
      else {
        this.pwm = 0;
      }
      if (initObj.hasOwnProperty('direction')) {
        this.direction = initObj.direction
      }
      else {
        this.direction = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type moveMotorCommand
    // Serialize message field [pwm]
    bufferOffset = _serializer.int8(obj.pwm, buffer, bufferOffset);
    // Serialize message field [direction]
    bufferOffset = _serializer.string(obj.direction, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type moveMotorCommand
    let len;
    let data = new moveMotorCommand(null);
    // Deserialize message field [pwm]
    data.pwm = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [direction]
    data.direction = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.direction.length;
    return length + 5;
  }

  static datatype() {
    // Returns string type for a message object
    return 'motor/moveMotorCommand';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c946b539dea19a8f696fa84fcd88bf58';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 pwm
    string direction
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new moveMotorCommand(null);
    if (msg.pwm !== undefined) {
      resolved.pwm = msg.pwm;
    }
    else {
      resolved.pwm = 0
    }

    if (msg.direction !== undefined) {
      resolved.direction = msg.direction;
    }
    else {
      resolved.direction = ''
    }

    return resolved;
    }
};

module.exports = moveMotorCommand;

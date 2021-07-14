; Auto-generated. Do not edit!


(cl:in-package motor-msg)


;//! \htmlinclude moveMotorCommand.msg.html

(cl:defclass <moveMotorCommand> (roslisp-msg-protocol:ros-message)
  ((pwm
    :reader pwm
    :initarg :pwm
    :type cl:fixnum
    :initform 0)
   (direction
    :reader direction
    :initarg :direction
    :type cl:string
    :initform ""))
)

(cl:defclass moveMotorCommand (<moveMotorCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <moveMotorCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'moveMotorCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name motor-msg:<moveMotorCommand> is deprecated: use motor-msg:moveMotorCommand instead.")))

(cl:ensure-generic-function 'pwm-val :lambda-list '(m))
(cl:defmethod pwm-val ((m <moveMotorCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader motor-msg:pwm-val is deprecated.  Use motor-msg:pwm instead.")
  (pwm m))

(cl:ensure-generic-function 'direction-val :lambda-list '(m))
(cl:defmethod direction-val ((m <moveMotorCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader motor-msg:direction-val is deprecated.  Use motor-msg:direction instead.")
  (direction m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <moveMotorCommand>) ostream)
  "Serializes a message object of type '<moveMotorCommand>"
  (cl:let* ((signed (cl:slot-value msg 'pwm)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'direction))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'direction))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <moveMotorCommand>) istream)
  "Deserializes a message object of type '<moveMotorCommand>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pwm) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'direction) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'direction) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<moveMotorCommand>)))
  "Returns string type for a message object of type '<moveMotorCommand>"
  "motor/moveMotorCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'moveMotorCommand)))
  "Returns string type for a message object of type 'moveMotorCommand"
  "motor/moveMotorCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<moveMotorCommand>)))
  "Returns md5sum for a message object of type '<moveMotorCommand>"
  "c946b539dea19a8f696fa84fcd88bf58")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'moveMotorCommand)))
  "Returns md5sum for a message object of type 'moveMotorCommand"
  "c946b539dea19a8f696fa84fcd88bf58")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<moveMotorCommand>)))
  "Returns full string definition for message of type '<moveMotorCommand>"
  (cl:format cl:nil "int8 pwm~%string direction~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'moveMotorCommand)))
  "Returns full string definition for message of type 'moveMotorCommand"
  (cl:format cl:nil "int8 pwm~%string direction~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <moveMotorCommand>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'direction))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <moveMotorCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'moveMotorCommand
    (cl:cons ':pwm (pwm msg))
    (cl:cons ':direction (direction msg))
))

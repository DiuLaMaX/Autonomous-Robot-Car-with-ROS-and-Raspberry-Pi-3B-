; Auto-generated. Do not edit!


(cl:in-package motor-srv)


;//! \htmlinclude moveMotor-request.msg.html

(cl:defclass <moveMotor-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass moveMotor-request (<moveMotor-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <moveMotor-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'moveMotor-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name motor-srv:<moveMotor-request> is deprecated: use motor-srv:moveMotor-request instead.")))

(cl:ensure-generic-function 'pwm-val :lambda-list '(m))
(cl:defmethod pwm-val ((m <moveMotor-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader motor-srv:pwm-val is deprecated.  Use motor-srv:pwm instead.")
  (pwm m))

(cl:ensure-generic-function 'direction-val :lambda-list '(m))
(cl:defmethod direction-val ((m <moveMotor-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader motor-srv:direction-val is deprecated.  Use motor-srv:direction instead.")
  (direction m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <moveMotor-request>) ostream)
  "Serializes a message object of type '<moveMotor-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <moveMotor-request>) istream)
  "Deserializes a message object of type '<moveMotor-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<moveMotor-request>)))
  "Returns string type for a service object of type '<moveMotor-request>"
  "motor/moveMotorRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'moveMotor-request)))
  "Returns string type for a service object of type 'moveMotor-request"
  "motor/moveMotorRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<moveMotor-request>)))
  "Returns md5sum for a message object of type '<moveMotor-request>"
  "d427495b34f5d0c5b55ab8f7f1ac8c30")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'moveMotor-request)))
  "Returns md5sum for a message object of type 'moveMotor-request"
  "d427495b34f5d0c5b55ab8f7f1ac8c30")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<moveMotor-request>)))
  "Returns full string definition for message of type '<moveMotor-request>"
  (cl:format cl:nil "int8 pwm~%string direction~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'moveMotor-request)))
  "Returns full string definition for message of type 'moveMotor-request"
  (cl:format cl:nil "int8 pwm~%string direction~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <moveMotor-request>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'direction))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <moveMotor-request>))
  "Converts a ROS message object to a list"
  (cl:list 'moveMotor-request
    (cl:cons ':pwm (pwm msg))
    (cl:cons ':direction (direction msg))
))
;//! \htmlinclude moveMotor-response.msg.html

(cl:defclass <moveMotor-response> (roslisp-msg-protocol:ros-message)
  ((done
    :reader done
    :initarg :done
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass moveMotor-response (<moveMotor-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <moveMotor-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'moveMotor-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name motor-srv:<moveMotor-response> is deprecated: use motor-srv:moveMotor-response instead.")))

(cl:ensure-generic-function 'done-val :lambda-list '(m))
(cl:defmethod done-val ((m <moveMotor-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader motor-srv:done-val is deprecated.  Use motor-srv:done instead.")
  (done m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <moveMotor-response>) ostream)
  "Serializes a message object of type '<moveMotor-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'done) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <moveMotor-response>) istream)
  "Deserializes a message object of type '<moveMotor-response>"
    (cl:setf (cl:slot-value msg 'done) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<moveMotor-response>)))
  "Returns string type for a service object of type '<moveMotor-response>"
  "motor/moveMotorResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'moveMotor-response)))
  "Returns string type for a service object of type 'moveMotor-response"
  "motor/moveMotorResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<moveMotor-response>)))
  "Returns md5sum for a message object of type '<moveMotor-response>"
  "d427495b34f5d0c5b55ab8f7f1ac8c30")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'moveMotor-response)))
  "Returns md5sum for a message object of type 'moveMotor-response"
  "d427495b34f5d0c5b55ab8f7f1ac8c30")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<moveMotor-response>)))
  "Returns full string definition for message of type '<moveMotor-response>"
  (cl:format cl:nil "bool done~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'moveMotor-response)))
  "Returns full string definition for message of type 'moveMotor-response"
  (cl:format cl:nil "bool done~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <moveMotor-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <moveMotor-response>))
  "Converts a ROS message object to a list"
  (cl:list 'moveMotor-response
    (cl:cons ':done (done msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'moveMotor)))
  'moveMotor-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'moveMotor)))
  'moveMotor-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'moveMotor)))
  "Returns string type for a service object of type '<moveMotor>"
  "motor/moveMotor")
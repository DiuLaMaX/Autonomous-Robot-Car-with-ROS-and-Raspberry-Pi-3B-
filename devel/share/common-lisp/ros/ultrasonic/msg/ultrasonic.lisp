; Auto-generated. Do not edit!


(cl:in-package ultrasonic-msg)


;//! \htmlinclude ultrasonic.msg.html

(cl:defclass <ultrasonic> (roslisp-msg-protocol:ros-message)
  ((distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0))
)

(cl:defclass ultrasonic (<ultrasonic>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ultrasonic>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ultrasonic)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ultrasonic-msg:<ultrasonic> is deprecated: use ultrasonic-msg:ultrasonic instead.")))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <ultrasonic>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ultrasonic-msg:distance-val is deprecated.  Use ultrasonic-msg:distance instead.")
  (distance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ultrasonic>) ostream)
  "Serializes a message object of type '<ultrasonic>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ultrasonic>) istream)
  "Deserializes a message object of type '<ultrasonic>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ultrasonic>)))
  "Returns string type for a message object of type '<ultrasonic>"
  "ultrasonic/ultrasonic")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ultrasonic)))
  "Returns string type for a message object of type 'ultrasonic"
  "ultrasonic/ultrasonic")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ultrasonic>)))
  "Returns md5sum for a message object of type '<ultrasonic>"
  "6e77fb10f0c8b4833ec273aa9ac74459")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ultrasonic)))
  "Returns md5sum for a message object of type 'ultrasonic"
  "6e77fb10f0c8b4833ec273aa9ac74459")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ultrasonic>)))
  "Returns full string definition for message of type '<ultrasonic>"
  (cl:format cl:nil "float32 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ultrasonic)))
  "Returns full string definition for message of type 'ultrasonic"
  (cl:format cl:nil "float32 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ultrasonic>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ultrasonic>))
  "Converts a ROS message object to a list"
  (cl:list 'ultrasonic
    (cl:cons ':distance (distance msg))
))

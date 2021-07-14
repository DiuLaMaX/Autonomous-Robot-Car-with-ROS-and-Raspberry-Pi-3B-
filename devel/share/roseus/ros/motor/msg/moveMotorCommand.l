;; Auto-generated. Do not edit!


(when (boundp 'motor::moveMotorCommand)
  (if (not (find-package "MOTOR"))
    (make-package "MOTOR"))
  (shadow 'moveMotorCommand (find-package "MOTOR")))
(unless (find-package "MOTOR::MOVEMOTORCOMMAND")
  (make-package "MOTOR::MOVEMOTORCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude moveMotorCommand.msg.html


(defclass motor::moveMotorCommand
  :super ros::object
  :slots (_pwm _direction ))

(defmethod motor::moveMotorCommand
  (:init
   (&key
    ((:pwm __pwm) 0)
    ((:direction __direction) "")
    )
   (send-super :init)
   (setq _pwm (round __pwm))
   (setq _direction (string __direction))
   self)
  (:pwm
   (&optional __pwm)
   (if __pwm (setq _pwm __pwm)) _pwm)
  (:direction
   (&optional __direction)
   (if __direction (setq _direction __direction)) _direction)
  (:serialization-length
   ()
   (+
    ;; int8 _pwm
    1
    ;; string _direction
    4 (length _direction)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _pwm
       (write-byte _pwm s)
     ;; string _direction
       (write-long (length _direction) s) (princ _direction s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _pwm
     (setq _pwm (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _pwm 127) (setq _pwm (- _pwm 256)))
   ;; string _direction
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _direction (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get motor::moveMotorCommand :md5sum-) "c946b539dea19a8f696fa84fcd88bf58")
(setf (get motor::moveMotorCommand :datatype-) "motor/moveMotorCommand")
(setf (get motor::moveMotorCommand :definition-)
      "int8 pwm
string direction
")



(provide :motor/moveMotorCommand "c946b539dea19a8f696fa84fcd88bf58")



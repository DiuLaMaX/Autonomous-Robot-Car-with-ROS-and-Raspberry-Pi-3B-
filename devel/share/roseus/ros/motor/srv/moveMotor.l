;; Auto-generated. Do not edit!


(when (boundp 'motor::moveMotor)
  (if (not (find-package "MOTOR"))
    (make-package "MOTOR"))
  (shadow 'moveMotor (find-package "MOTOR")))
(unless (find-package "MOTOR::MOVEMOTOR")
  (make-package "MOTOR::MOVEMOTOR"))
(unless (find-package "MOTOR::MOVEMOTORREQUEST")
  (make-package "MOTOR::MOVEMOTORREQUEST"))
(unless (find-package "MOTOR::MOVEMOTORRESPONSE")
  (make-package "MOTOR::MOVEMOTORRESPONSE"))

(in-package "ROS")





(defclass motor::moveMotorRequest
  :super ros::object
  :slots (_pwm _direction ))

(defmethod motor::moveMotorRequest
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

(defclass motor::moveMotorResponse
  :super ros::object
  :slots (_done ))

(defmethod motor::moveMotorResponse
  (:init
   (&key
    ((:done __done) nil)
    )
   (send-super :init)
   (setq _done __done)
   self)
  (:done
   (&optional __done)
   (if __done (setq _done __done)) _done)
  (:serialization-length
   ()
   (+
    ;; bool _done
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _done
       (if _done (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _done
     (setq _done (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass motor::moveMotor
  :super ros::object
  :slots ())

(setf (get motor::moveMotor :md5sum-) "d427495b34f5d0c5b55ab8f7f1ac8c30")
(setf (get motor::moveMotor :datatype-) "motor/moveMotor")
(setf (get motor::moveMotor :request) motor::moveMotorRequest)
(setf (get motor::moveMotor :response) motor::moveMotorResponse)

(defmethod motor::moveMotorRequest
  (:response () (instance motor::moveMotorResponse :init)))

(setf (get motor::moveMotorRequest :md5sum-) "d427495b34f5d0c5b55ab8f7f1ac8c30")
(setf (get motor::moveMotorRequest :datatype-) "motor/moveMotorRequest")
(setf (get motor::moveMotorRequest :definition-)
      "int8 pwm
string direction
---
bool done

")

(setf (get motor::moveMotorResponse :md5sum-) "d427495b34f5d0c5b55ab8f7f1ac8c30")
(setf (get motor::moveMotorResponse :datatype-) "motor/moveMotorResponse")
(setf (get motor::moveMotorResponse :definition-)
      "int8 pwm
string direction
---
bool done

")



(provide :motor/moveMotor "d427495b34f5d0c5b55ab8f7f1ac8c30")



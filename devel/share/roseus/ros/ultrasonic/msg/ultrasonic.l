;; Auto-generated. Do not edit!


(when (boundp 'ultrasonic::ultrasonic)
  (if (not (find-package "ULTRASONIC"))
    (make-package "ULTRASONIC"))
  (shadow 'ultrasonic (find-package "ULTRASONIC")))
(unless (find-package "ULTRASONIC::ULTRASONIC")
  (make-package "ULTRASONIC::ULTRASONIC"))

(in-package "ROS")
;;//! \htmlinclude ultrasonic.msg.html


(defclass ultrasonic::ultrasonic
  :super ros::object
  :slots (_distance ))

(defmethod ultrasonic::ultrasonic
  (:init
   (&key
    ((:distance __distance) 0.0)
    )
   (send-super :init)
   (setq _distance (float __distance))
   self)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:serialization-length
   ()
   (+
    ;; float32 _distance
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _distance
     (setq _distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ultrasonic::ultrasonic :md5sum-) "6e77fb10f0c8b4833ec273aa9ac74459")
(setf (get ultrasonic::ultrasonic :datatype-) "ultrasonic/ultrasonic")
(setf (get ultrasonic::ultrasonic :definition-)
      "float32 distance

")



(provide :ultrasonic/ultrasonic "6e77fb10f0c8b4833ec273aa9ac74459")



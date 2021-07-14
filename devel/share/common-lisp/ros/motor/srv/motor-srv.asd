
(cl:in-package :asdf)

(defsystem "motor-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "moveMotor" :depends-on ("_package_moveMotor"))
    (:file "_package_moveMotor" :depends-on ("_package"))
  ))
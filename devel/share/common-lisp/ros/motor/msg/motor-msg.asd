
(cl:in-package :asdf)

(defsystem "motor-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "moveMotorCommand" :depends-on ("_package_moveMotorCommand"))
    (:file "_package_moveMotorCommand" :depends-on ("_package"))
  ))
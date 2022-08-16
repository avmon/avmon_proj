
(cl:in-package :asdf)

(defsystem "low_level_control-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "low_level_msg" :depends-on ("_package_low_level_msg"))
    (:file "_package_low_level_msg" :depends-on ("_package"))
  ))
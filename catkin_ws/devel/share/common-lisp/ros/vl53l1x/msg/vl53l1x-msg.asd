
(cl:in-package :asdf)

(defsystem "vl53l1x-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "MeasurementData" :depends-on ("_package_MeasurementData"))
    (:file "_package_MeasurementData" :depends-on ("_package"))
  ))
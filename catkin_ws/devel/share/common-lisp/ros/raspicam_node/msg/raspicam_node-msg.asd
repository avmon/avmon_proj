
(cl:in-package :asdf)

(defsystem "raspicam_node-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "MotionVectors" :depends-on ("_package_MotionVectors"))
    (:file "_package_MotionVectors" :depends-on ("_package"))
    (:file "Parking" :depends-on ("_package_Parking"))
    (:file "_package_Parking" :depends-on ("_package"))
    (:file "Perception_img" :depends-on ("_package_Perception_img"))
    (:file "_package_Perception_img" :depends-on ("_package"))
    (:file "Perception_var" :depends-on ("_package_Perception_var"))
    (:file "_package_Perception_var" :depends-on ("_package"))
  ))
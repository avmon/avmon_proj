# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "low_level_control: 1 messages, 0 services")

set(MSG_I_FLAGS "-Ilow_level_control:/home/corvin/catkin_ws/src/low_level_control/msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(low_level_control_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/corvin/catkin_ws/src/low_level_control/msg/low_level_msg.msg" NAME_WE)
add_custom_target(_low_level_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "low_level_control" "/home/corvin/catkin_ws/src/low_level_control/msg/low_level_msg.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(low_level_control
  "/home/corvin/catkin_ws/src/low_level_control/msg/low_level_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/low_level_control
)

### Generating Services

### Generating Module File
_generate_module_cpp(low_level_control
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/low_level_control
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(low_level_control_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(low_level_control_generate_messages low_level_control_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/corvin/catkin_ws/src/low_level_control/msg/low_level_msg.msg" NAME_WE)
add_dependencies(low_level_control_generate_messages_cpp _low_level_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(low_level_control_gencpp)
add_dependencies(low_level_control_gencpp low_level_control_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS low_level_control_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(low_level_control
  "/home/corvin/catkin_ws/src/low_level_control/msg/low_level_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/low_level_control
)

### Generating Services

### Generating Module File
_generate_module_eus(low_level_control
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/low_level_control
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(low_level_control_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(low_level_control_generate_messages low_level_control_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/corvin/catkin_ws/src/low_level_control/msg/low_level_msg.msg" NAME_WE)
add_dependencies(low_level_control_generate_messages_eus _low_level_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(low_level_control_geneus)
add_dependencies(low_level_control_geneus low_level_control_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS low_level_control_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(low_level_control
  "/home/corvin/catkin_ws/src/low_level_control/msg/low_level_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/low_level_control
)

### Generating Services

### Generating Module File
_generate_module_lisp(low_level_control
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/low_level_control
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(low_level_control_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(low_level_control_generate_messages low_level_control_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/corvin/catkin_ws/src/low_level_control/msg/low_level_msg.msg" NAME_WE)
add_dependencies(low_level_control_generate_messages_lisp _low_level_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(low_level_control_genlisp)
add_dependencies(low_level_control_genlisp low_level_control_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS low_level_control_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(low_level_control
  "/home/corvin/catkin_ws/src/low_level_control/msg/low_level_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/low_level_control
)

### Generating Services

### Generating Module File
_generate_module_nodejs(low_level_control
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/low_level_control
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(low_level_control_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(low_level_control_generate_messages low_level_control_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/corvin/catkin_ws/src/low_level_control/msg/low_level_msg.msg" NAME_WE)
add_dependencies(low_level_control_generate_messages_nodejs _low_level_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(low_level_control_gennodejs)
add_dependencies(low_level_control_gennodejs low_level_control_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS low_level_control_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(low_level_control
  "/home/corvin/catkin_ws/src/low_level_control/msg/low_level_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/low_level_control
)

### Generating Services

### Generating Module File
_generate_module_py(low_level_control
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/low_level_control
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(low_level_control_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(low_level_control_generate_messages low_level_control_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/corvin/catkin_ws/src/low_level_control/msg/low_level_msg.msg" NAME_WE)
add_dependencies(low_level_control_generate_messages_py _low_level_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(low_level_control_genpy)
add_dependencies(low_level_control_genpy low_level_control_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS low_level_control_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/low_level_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/low_level_control
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(low_level_control_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/low_level_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/low_level_control
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(low_level_control_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/low_level_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/low_level_control
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(low_level_control_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/low_level_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/low_level_control
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(low_level_control_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/low_level_control)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/low_level_control\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/low_level_control
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(low_level_control_generate_messages_py geometry_msgs_generate_messages_py)
endif()

locals {
  ros_team = [
    "Blast545",
    "Yadunund",
    "adityapande-1995",
    "ahcorde",
    "audrow",
    "chapulina",
    "clalancette",
    "cottsay",
    "gbiggs",
    "hidmic",
    "ivanpauno",
    "j-rivero",
    "jacobperron",
    "mabelzhang",
    "methylDragon",
    "mjcarroll",
    "mjeronimo",
    "nuclearsandwich",
    "quarkytale",
    "sloretz",
    "tfoote",
    "wjwwood",
  ]

  ros_core_repositories = [
    "ament_cmake-release",
    "ament_cmake_ros-release",
    "ament_index-release",
    "ament_lint-release",
    "class_loader-release",
    "common_interfaces-release",
    "launch-release",
    "launch_ros-release",
    "pluginlib-release",
    "rcl-release",
    "rclcpp-release",
    "rclpy-release",
    "ros2cli_common_extensions-release",
    "ros_environment-release",
    "rosidl_core-release",
    "rosidl_defaults-release",
    "sros2-release",
  ]

  ros_base_repositories = [
    "geometry2-release",
    "kdl_parser-release",
    "orocos_kdl_vendor-release",
    "robot_state_publisher-release",
    "rosbag2-release",
    "urdf-release",
  ]

  ros_desktop_repositories = [
    "angles-release",
    "demos-release",
    "depthimage_to_laserscan-release",
    "examples-release",
    "joystick_drivers-release",
    "pcl_conversions-release",
    "teleop_twist_joy-release",
    "teleop_twist_keyboard-release",
    "tlsf-release",
  ]

  ros_rqt_repositories = [
    "rqt-release",
    "rqt_action-release",
    "rqt_bag-release",
    "rqt_common_plugins-release",
    "rqt_console-release",
    "rqt_graph-release",
    "rqt_image_view-release",
    "rqt_moveit-release",
    "rqt_msg-release",
    "rqt_plot-release",
    "rqt_publisher-release",
    "rqt_py_console-release",
    "rqt_reconfigure-release",
    "rqt_robot_monitor-release",
    "rqt_robot_steering-release",
    "rqt_service_caller-release",
    "rqt_shell-release",
    "rqt_srv-release",
    "rqt_tf_tree-release",
    "rqt_top-release",
    "rqt_topic-release",
  ]

  additional_ros_team_repositories = [
    "ament_package-release",
    "bond_core-release",
    "cartographer-release",
    "cartographer_ros-release",
    "console_bridge_vendor-release",
    "cyclonedds-release",
    "domain_bridge-release",
    "eigen3_cmake_module-release",
    "eigen_stl_containers-release",
    "example_interfaces-release",
    "fastcdr-release",
    "fastrtps-release",
    "fcl-release",
    "filters-release",
    "geometry_tutorials-release",
    "google_benchmark_vendor-release",
    "googletest-release",
    "image_common-release",
    "image_transport_plugins-release",
    "interactive_markers-release",
    "joint_state_publisher-release",
    "joystick_drivers-release",
    "laser_geometry-release",
    "laser_proc-release",
    "libyaml_vendor-release",
    "linux_isolate_process-release",
    "mimick_vendor-release",
    "navigation_msgs-release",
    "nodl_to_policy-release",
    "orocos_kinematics_dynamics-release",
    "osrf_pycommon-release",
    "osrf_testing_tools_cpp-release",
    "performance_test_fixture-release",
    "phidgets_drivers-release",
    "pybind11_vendor-release",
    "python_cmake_module-release",
    "python_qt_binding-release",
    "qt_gui_core-release",
    "rcl_interfaces-release",
    "rcl_logging-release",
    "rcpputils-release",
    "rcutils-release",
    "realtime_support-release",
    "resource_retriever-release",
    "rmw-release",
    "rmw_connext-release", # archive after Foxy end-of-support
    "rmw_connextdds-release",
    "rmw_cyclonedds-release",
    "rmw_dds_common-release",
    "rmw_fastrtps-release",
    "rmw_implementation-release",
    "rmw_zenoh-release",
    "ros1_bridge-release",
    "ros2_message_filters-release",
    "ros2cli-release",
    "ros2launch_security-release",
    "ros_testing-release",
    "ros_tutorials-release",
    "ros_workspace-release",
    "rosbridge_suite-release",
    "rosidl-release",
    "rosidl_dds-release",
    "rosidl_dynamic_typesupport-release",
    "rosidl_dynamic_typesupport_fastrtps-release",
    "rosidl_python-release",
    "rosidl_runtime_py-release",
    "rosidl_typesupport-release",
    "rosidl_typesupport_connext-release", #archive after Foxy end-of-support
    "rosidl_typesupport_fastrtps-release",
    "rpyutils-release",
    "rviz-release",
    "sdformat_urdf-release",
    "slide_show-release",
    "spdlog_vendor-release",
    "tango_icons_vendor-release",
    "test_interface_files-release",
    "tinydir_vendor-release",
    "tinyxml2_vendor-release",
    "tinyxml_vendor-release",
    "uncrustify_vendor-release",
    "unique_identifier_msgs-release",
    "urdfdom-release",
    "urdfdom_headers-release",
    "urdfdom_py-release",
    "variants-release",
    "vision_opencv-release",
    "yaml_cpp_vendor-release",
  ]

  ros_repositories = setunion(
    local.ros_core_repositories,
    local.ros_base_repositories,
    local.ros_desktop_repositories,
    local.ros_rqt_repositories,
    local.additional_ros_team_repositories,
  )
}

module "ros_team" {
  source       = "./modules/release_team"
  team_name    = "ros2-team"
  members      = local.ros_team
  repositories = local.ros_repositories
  depends_on   = [github_membership.members, github_repository.repositories]
}

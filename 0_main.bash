#!/bin/bash

#########################################################################################
#                                                                                       #
#  Reference from https://github.com/IntelRealSense/realsense-ros/wiki/SLAM-with-D435i  #
#                                                                                       #
#  This script install ROS NOETIC SLAM for Ubuntu 20.04.                                #
#  It will install the following components:                                            #
#    1. ROS Noetic                                                                      #
#    2. realsense2_camera                                                               #
#    3. imu_filter_madgwick                                                             #
#    4. rtabmap_ros                                                                     #
#    5. robot_localization                                                              #
#                                                                                       #
#########################################################################################

# Print notice.
echo ''
echo 'Recommendation :'
echo '  (1) To avoid from privilege issues,'
echo "      edit sudo file to give $USER root privileges without entering password."
echo ''
echo '  (2) Run this script by'
echo '      $ ./0_main.bash 2>&1 | tee install.log'
echo '      is a good idea.'
echo ''
read -p 'Press ENTER to continue ......' trash
echo ''

# Install ros noetic.
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt install curl # if you haven't already installed curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt update
sudo apt install ros-noetic-desktop-full -y

echo '# Include ROS Noetic.' >> ~/.bashrc
echo 'source /opt/ros/noetic/setup.bash' >> ~/.bashrc
echo '' >> ~/.bashrc
source ~/.bashrc

# Intsall other components.
sudo apt install ros-noetic-realsense2-camera ros-noetic-imu-filter-madgwick ros-noetic-rtabmap-ros ros-noetic-robot-localization -y

# Install config.
if [[ -d '/opt/ros/noetic/share/rtabmap_ros/launch/config' ]]
then
    sudo cp config/* '/opt/ros/noetic/share/rtabmap_ros/launch/config/'
    sudo sed -i 's/rgbd.rviz/project.rviz/1' '/opt/ros/noetic/share/rtabmap_ros/launch/rtabmap.launch'
    echo 'Success to install config file.'
else
    echo 'Failed to install config file.'
fi

# Print usage.
echo 'Run the following command to start SLAM.'
echo '  $ roslaunch realsense2_camera opensource_tracking.launch'
echo ''

if [[ -d "$HOME/Scripts" ]]
then
    cp scripts/* "$HOME/Scripts/"
    echo 'These scripts are also available.'
    echo '  $ slam_start'
    echo '  $ slam_save_2d'
    echo '  $ slam_view_color_depth'
else
    echo "Scripts directory '$HOME/Scripts' does NOT exist."
    echo 'Startup script is NOT installed.'
fi

echo ''


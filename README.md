# What's this
This is an installer for [SLAM with RealSense D435i](https://github.com/IntelRealSense/realsense-ros/wiki/SLAM-with-D435i) based on bash.
This script runs with a poor UX, but it works.

# Pre-requirements
Please ensure the environment is compatible to run this script.

- Hardware
  - [Raspberry Pi 4 (4GB RAM)](https://www.raspberrypi.org/products/raspberry-pi-4-model-b/)

- Software
  - [Ubuntu server 20.04](https://cdimage.ubuntu.com/releases/20.04.3/release/ubuntu-20.04.3-preinstalled-server-arm64+raspi.img.xz)
  - bash shell

If all things get ready, you can download this project and run *0_main.bash* .
For more information, please reference to *Install section*.

# Install
1. Download this project.

        git clone 'https://github.com/haward79/RealSense_RosWrapper_Noetic_SLAM_Installer/'
        cd RealSense_RosWrapper_Noetic_SLAM_Installer

2. Please ensure the user has privilege to run the scripts.

        chmod u+x *.bash

3. Run the main script  
   Have a cup of coffee and take a rest !

        ./0_main.bash

# Changelog
- 10/06 2021
    1. Edit script slam_view_color_depth. The script will show aligned images of rgb and depth.

- 10/06 2021
    1. Change config file.
    2. Add a start script.

- 10/06 2021
    1. Change config file. (Add localization pose scene)
    
- 10/04 2021
    1. Add map server to install script

- 10/04 2021
    1. First commit

# Copyright
These scripts are written by [haward79](https://www.haward79.tw/).
They are free to use for both education and business.


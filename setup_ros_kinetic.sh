#! /bin/bash    

# ref: http://wiki.ros.org/kinetic/Installation/Ubuntu
echo "Installing ROS kinectic (tested on Ubuntu 16.04)"

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

sudo apt-get update

sudo apt-get install ros-kinetic-desktop-full -y

sudo rosdep init
rosdep update

echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# dependencies to build ros packages:
sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential -y

source ~/.bashrc

echo "now you should be able to run a command like: catkin_init_workspace"

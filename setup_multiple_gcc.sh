#! /bin/bash
# ref https://gist.github.com/application2000/73fd6f4bf1be6600a2cf9f56315a2d91
echo "adding GCC 6.3.0, 7.2.0 on Ubuntu 16.04:"

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install build-essential software-properties-common -y
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y

sudo apt-get update -y
sudo apt-get install gcc-6 g++-6 -y
sudo apt-get install gcc-7 g++-7 -y

# default version is gcc 5.x
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 100 --slave /usr/bin/g++ g++ /usr/bin/g++-5
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 90 --slave /usr/bin/g++ g++ /usr/bin/g++-6
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 80 --slave /usr/bin/g++ g++ /usr/bin/g++-7

sudo update-alternatives --config gcc
gcc --version

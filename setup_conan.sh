#! /bin/bash


sudo apt-get install python-pip -y

echo "upgrade pip"
pip install --upgrade pip

echo "install conan"
sudo pip install conan -y

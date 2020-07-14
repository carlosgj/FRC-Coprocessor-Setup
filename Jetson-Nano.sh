#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run this script as root."
  exit
fi

apt update
apt upgrade -y
apt install -y nano screen python3-dev python3-pip python3-setuptools build-essential htop iftop
python3 -m pip install thefuck

#Install ROS
#sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
apt update
apt install -y ros-melodic-desktop


#Disable internet MOTD
sed -i 's/ENABLED=1/ENABLED=0/g' /etc/default/motd-news
rm /etc/update-motd.d/10-help-text

sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' /home/frc696/.bashrc
echo "screen -D -RR" >> /home/frc696/.bashrc

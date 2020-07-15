#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run this script as root."
  exit
fi

apt update
apt upgrade -y
apt install -y nano git screen build-essential htop iftop

#Allow non-root shutdown
echo "ALL ALL=NOPASSWD: /sbin/halt, /sbin/reboot, /sbin/poweroff" >> /etc/sudoers
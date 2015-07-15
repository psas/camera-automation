#!/bin/sh

if [ $(id -u) -ne 0 ]; then
    echo "Must run as root to install packages"
    exec sudo $HOME/camera-automation/$(hostname)/first-boot.sh
fi

echo "############################################################"
echo "# Configuring this pi as $(hostname)"
echo "# Please set a password and then enable the camera"
echo "############################################################"

passwd pi
raspi-config
apt-get update
xargs -ra /home/pi/camera-automation/$(hostname)/package-dependencies.list apt-get install
rm /home/pi/.bash_login
raspi-config --expand-rootfs

echo "############################################################"
echo "# Rebooting"
echo "############################################################"
reboot

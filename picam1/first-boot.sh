#!/bin/sh

if [ $(id -u) -ne 0 ]; then
    echo "Must run as root to install packages"
    exec sudo $0 "$@"
fi

passwd pi
apt-get update
xargs -ra /home/pi/camera-automation/$(hostname)/package-dependancies.list apt-get install
rm /home/pi/.bash_login
raspi-config --expand-rootfs

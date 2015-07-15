#!/bin/sh

echo "Using root directory: ${ROOT:=${1:-.}}"

install -o 1000 -g 1000 -m 700 -d ${ROOT}/home/pi/.ssh/
ln -sf ../camera-automation/picam1/authorized_keys2 ${ROOT}/home/pi/.ssh/authorized_keys2
ln -sf camera-automation/picam1/go_cameras_go.sh ${ROOT}/home/pi/go_cameras_go.sh
ln -sf camera-automation/picam1/go_cameras_go_debug.sh ${ROOT}/home/pi/go_cameras_go_debug.sh
ln -sf camera-automation/picam1/first-boot.sh ${ROOT}/home/pi/.bash_login
ln -sf camera-automation/picam1/gpio.sh ${ROOT}/home/pi/gpio.sh
sed -i '/^# Print the IP address/i/home/pi/gpio.sh\n' ${ROOT}/etc/rc.local
ln -sf ../../home/pi/camera-automation/picam1/interfaces ${ROOT}/etc/network/interfaces
ln -sf ../home/pi/camera-automation/picam1/hosts ${ROOT}/etc/hosts
ln -sf ../home/pi/camera-automation/picam1/hostname ${ROOT}/etc/hostname
ln -sf ../home/pi/camera-automation/picam1/resolvconf.conf ${ROOT}/etc/resolvconf.conf

echo "Done!"

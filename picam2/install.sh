#!/bin/sh

echo "Using root directory: ${ROOT:=${1:-.}}"

install -o 1000 -g 1000 -m 755 -d ${ROOT}/home/pi/video/
install -o 1000 -g 1000 -m 700 -d ${ROOT}/home/pi/.ssh/
ln -sf ../camera-automation/picam2/authorized_keys2 ${ROOT}/home/pi/.ssh/
ln -sf camera-automation/picam2/go_cameras_go.sh ${ROOT}/home/pi/
ln -sf camera-automation/picam2/CameraScripts ${ROOT}/home/pi/
ln -sf camera-automation/picam2/first-boot.sh ${ROOT}/home/pi/.bash_login
ln -sf camera-automation/picam2/gpio.sh ${ROOT}/home/pi/
sed -i '/^# Print the IP address/i/home/pi/gpio.sh\n' ${ROOT}/etc/rc.local
ln -sf ../../home/pi/camera-automation/picam2/interfaces ${ROOT}/etc/network/
ln -sf ../home/pi/camera-automation/picam2/hosts ${ROOT}/etc/
ln -sf ../home/pi/camera-automation/picam2/hostname ${ROOT}/etc/
ln -sf ../home/pi/camera-automation/picam2/resolvconf.conf ${ROOT}/etc/

cd ${ROOT}/home/pi
git clone https://github.com/psas/GeigerLog.git
chown -R pi:pi GeigerLog
ln -sf ../../home/pi/GeigerLog/init.d-geiger ${ROOT}/etc/init.d/geiger
sync

echo "Done!"

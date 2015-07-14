#!/bin/sh

ROOT=${1:-.}
HOST=${2:-picam1}

cd ${ROOT}/home/pi/
git clone https://github.com/psas/camera-automation.git
chown -R 1000:1000 camera-automation
cd -
exec home/pi/camera-automation/${HOST}/install.sh

#!/bin/sh

export HOST=${1:-picam1}
export ROOT=${2:-.}

cd ${ROOT}/home/pi/
git clone https://github.com/psas/camera-automation.git
chown -R 1000:1000 camera-automation
exec ${ROOT}/home/pi/camera-automation/${HOST}/install.sh

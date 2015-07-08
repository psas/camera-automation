#!/bin/sh

/home/pi/CameraScripts/StartEverything.sh

raspivid -n -w 640 -h 480 -b 500000 -fps 30 -rot 270 -t 0 -o - | \
    gst-launch-1.0 -v fdsrc \
    ! tee name=splitter \
    ! h264parse \
    ! queue \
    ! filesink location="videofile.h264"

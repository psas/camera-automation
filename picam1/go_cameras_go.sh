#!/bin/sh

raspivid -n -w 640 -h 480 -b 500000 -fps 30 -rot 270 -t 0 -o - | \
    gst-launch-1.0 -v fdsrc \
    ! tee name=splitter \
    ! h264parse \
    ! queue \
    ! rtph264pay config-interval=10 pt=96 \
    ! udpsink host=10.10.10.10 port=30000 \
    splitter. \
    ! queue \
    ! filesink location="videofile.h264"

# Transcoding could be accomplished with more horsepower like this:
#    # Add these lines after h264parse
#    ! omxh264dec \
#    ! videoscale \
#    ! 'video/x-raw,width=640,height=480' \
#    ! omxh264enc \

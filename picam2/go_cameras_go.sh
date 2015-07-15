#!/bin/sh

raspivid -n -w 1920 -h 1080 -b 500000 -fps 30 -rot 270 -t 0 \
    -o $(mktemp /home/pi/video/XXXXXX.h264) &

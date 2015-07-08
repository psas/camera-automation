#!/bin/sh

# Source my handy dandy set of LL GPIO functions
. $HOME/CameraScripts/GPIOFunctions.sh

# For those that may not be aware of what they are doing
usage() {
    echo Whoops! You need to specify only the gpio pin number
    echo usage: $0 PinNumber
}


# Check to make sure the pin number was specified
if [ $# -eq 1 ]; then
    PIN_NUM=$1
    # Initialize the pin
    makePinOUT $1
    #Start Camera
    send $PIN_NUM 1
else
    usage
fi



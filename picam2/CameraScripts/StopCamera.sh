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
    #Stop Camera
    if [ -d "/sys/class/gpio/gpio$PIN_NUM" ]; then
        send $PIN_NUM 0
	# The next line will unexport the GPIO
	# we don't want it to float, so just send 0
	#turnOffPin $PIN_NUM
    else
	echo "Pin $PIN_NUM is not currently Initialized"
    fi
else
    usage
fi

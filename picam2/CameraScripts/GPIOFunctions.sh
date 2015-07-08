#!/bin/bash

turnOnPin() {
    PIN=$1
    if [ ! -d "/sys/class/gpio/gpio$PIN" ]; then
        echo "$1" >> /sys/class/gpio/export
    fi
}

turnOffPin() {
    if [ -d "/sys/class/gpio/gpio$PIN" ]; then
        echo "$1" >> /sys/class/gpio/unexport
    fi
}

setDirectionIN() {
    echo "in" > /sys/class/gpio/gpio$1/direction
}

setDirectionOUT() {
    echo "out" > /sys/class/gpio/gpio$1/direction
}

send() {
    PIN=$1
    if [ -d /sys/class/gpio/gpio$PIN ]; then
        shift
        echo "$@" >> /sys/class/gpio/gpio$PIN/value
    else
        echo "Pin $PIN has not been initialized"
    fi
}

get() {
    PIN=$1
    if [ -d /sys/class/gpio/gpio$PIN ]; then
        cat /sys/class/gpio/gpio$PIN/value
    else
        echo "Pin $PIN has not been initialized"
    fi
}

makePinIN() {
    turnOnPin $1
    setDirectionIN $1
}

makePinOUT() {
    turnOnPin $1
    setDirectionOUT $1
}


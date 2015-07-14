#!/bin/sh

# GPIO numbers should be from this list
# 0, 1, 4, 7, 8, 9, 10, 11, 14, 15, 17, 18, 21, 22, 23, 24, 25

# Note that the GPIO numbers that you program here refer to the pins
# of the BCM2835 and *not* the numbers on the pin header. 
# So, if you want to activate GPIO7 on the header you should be 
# using GPIO4 in this script. Likewise if you want to activate GPIO0
# on the header you should be using GPIO17 here.


#States:
#0 = On
#1 = Off
#
#Pins:
#29 = Red
#30 = Green
#31 = Blue

OUTPUT="29 30 31"
# Initialize for output
for GPIO in $OUTPUT; do
    echo "$GPIO" > /sys/class/gpio/export
    echo "out" > /sys/class/gpio/gpio$GPIO/direction
    echo "1" > /sys/class/gpio/gpio$GPIO/value
done

#INPUT=""
## Initialize for input
#for GPIO in $INPUT; do
#    echo "$GPIO" > /sys/class/gpio/export
#    echo "in" > /sys/class/gpio/gpio$GPIO/direction
#done

## Write output
#echo "1" > /sys/class/gpio/gpio4/value
#
## Read from input
#cat /sys/class/gpio/gpio7/value 

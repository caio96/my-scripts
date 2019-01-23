#!/bin/bash
# Displays on the HDMI if connected, otherwise displays on notebook

# Lockscreen display on the correct resolution in just one monitor
# Add this line to /etc/lightdm/lightdm.conf with the location of this script:
#
# display-setup-script=/home/caio/bin/greeter_initial_script.sh

intern=eDP1
extern=HDMI1

if xrandr | grep -q "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$intern" --auto --primary
else
    xrandr --output "$intern" --off --output "$extern" --auto --primary
fi

#!/bin/bash
# Sends notification to indicate caps locl on or off
# Bind to Caps Lock key in shortcuts

sleep 0.25

if [ $(xset q | grep "LED mask" | grep -Eco "[0]{8}") = 1 ];
then
        notify-send -t 1000 -i keyboard "Caps Lock" "Off";
else
        notify-send -t 1000 -i keyboard "Caps Lock" "On";
fi

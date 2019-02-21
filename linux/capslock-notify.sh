#!/bin/bash
# Sends notification to indicate caps locl on or off
# Bind to Caps Lock key in shortcuts

sleep 0.25

if [ $(xset -q | grep -c "Caps Lock:[[:space:]]*on") -eq '0' ];
then
        notify-send -t 1000 -i keyboard "Caps Lock" "Off";
else
        notify-send -t 1000 -i keyboard "Caps Lock" "On";
fi

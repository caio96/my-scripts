#!/bin/bash
# Toggle sound when HDMI is connected

# Sound toggle to HDMI automatically
# Copy files to this locations:
#
# /usr/local/bin/hdmi_sound_toggle.sh
# /etc/udev/rules.d/99-hdmi_sound.rules
# /etc/systemd/system/hdmi_sound_toggle.service

USER_NAME=$(who | cut -f 1 -d ' ')
USER_ID=$(id -u "$USER_NAME")
HDMI_STATUS=$(cat /sys/class/drm/card0/card0-HDMI-A-1/status)

[[ -z $USER_NAME ]] && exit
[[ -z $HDMI_STATUS ]] && exit

export PULSE_SERVER="unix:/run/user/"$USER_ID"/pulse/native"

if [[ $HDMI_STATUS == connected ]]
then
   sudo -u "$USER_NAME" pactl --server "$PULSE_SERVER" set-card-profile 0 output:hdmi-stereo+input:analog-stereo
else
   sudo -u "$USER_NAME" pactl --server "$PULSE_SERVER" set-card-profile 0 output:analog-stereo+input:analog-stereo
fi

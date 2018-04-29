#!/bin/bash
# shell script to prepend i3status with more stuff

i3status_conf=${1}

i3status --config ${i3status_conf} | while :
do
    read line
    LAYOUT=$(~/bin/xkb-switch)
    BRIGHT=$(cat /sys/class/backlight/intel_backlight/brightness)
    dat=", { \"full_text\": \"💡$BRIGHT\", \"color\": \"#999900\"}, { \"full_text\": \"🅰$LAYOUT\", \"color\":\"#FF8C00\" }]"
    echo "${line/]/$dat}" || exit 1
done


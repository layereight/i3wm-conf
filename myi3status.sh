#!/bin/bash
# shell script to prepend i3status with more stuff

i3status_conf=${1}
PATH=${PATH}:~/bin

i3status --config "${i3status_conf}" | while :
do
    read -r line
    LAYOUT=$(xkb-switch)
    BRIGHT=$(cat /sys/class/backlight/acpi_video0/brightness)

    TOUCHPAD_ID=$(xinput list | grep -i Touchpad | sed 's/.*id=\(.*\) *\[.*/\1/')
    TOUCHPAD_ENABLED=$(xinput list-props "${TOUCHPAD_ID}" | grep Enabled | sed 's/.*\(.\)$/\1/')

    if [ "${TOUCHPAD_ENABLED}" -eq 1 ]; then
        TOUCHPAD="⊐"
    else
        TOUCHPAD="⋣"
    fi


    dat=", { \"full_text\": \"💡$BRIGHT\", \"color\": \"#999900\"}, \
    { \"full_text\": \"🅰$LAYOUT\", \"color\":\"#FF8C00\" }, \
    { \"full_text\": \"$TOUCHPAD\", \"color\":\"#FFFFFF\" } \
    ]"
    echo "${line/]/$dat}" || exit 1
done


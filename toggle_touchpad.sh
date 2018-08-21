#!/bin/sh


TOUCHPAD_ID=$(xinput list | grep Touchpad | sed 's/.*id=\(.*\) *\[.*/\1/')

#echo TOUCHPAD_ID=$TOUCHPAD_ID

TOUCHPAD_ENABLED=$(xinput list-props ${TOUCHPAD_ID} | grep Enabled | sed 's/.*\(.\)$/\1/')

#echo ENABLED=${TOUCHPAD_ENABLED}

if [ ${TOUCHPAD_ENABLED} -eq 1 ]; then
    xinput disable ${TOUCHPAD_ID}
else
    xinput enable ${TOUCHPAD_ID}
fi

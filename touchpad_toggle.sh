#!/bin/sh

script_dir=$(dirname ${0})

. ${script_dir}/touchpad_id.sh

$(get_touchpad_id)
TOUCHPAD_ID=$?

#echo TOUCHPAD_ID=$TOUCHPAD_ID

TOUCHPAD_ENABLED=$(xinput list-props ${TOUCHPAD_ID} | grep Enabled | sed 's/.*\(.\)$/\1/')

#echo ENABLED=${TOUCHPAD_ENABLED}

if [ ${TOUCHPAD_ENABLED} -eq 1 ]; then
    xinput disable ${TOUCHPAD_ID}
else
    xinput enable ${TOUCHPAD_ID}
fi

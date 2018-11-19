#!/bin/sh

script_dir=$(dirname ${0})

. ${script_dir}/touchpad_id.sh

$(get_touchpad_id)
TOUCHPAD_ID=$?

#echo TOUCHPAD_ID=$TOUCHPAD_ID

# enable horizontal AND vertical scrolling
xinput --set-prop ${TOUCHPAD_ID} "Synaptics Two-Finger Scrolling" 1 1
# inverted/natural scrolling
xinput --set-prop ${TOUCHPAD_ID} "Synaptics Scrolling Distance" -69 -69
# enable palm detection
xinput --set-prop ${TOUCHPAD_ID} "Synaptics Palm Detection" 1

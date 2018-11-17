#!/bin/sh

get_touchpad_id() {
    return $(xinput list | grep -i Touchpad | sed 's/.*id=\(.*\) *\[.*/\1/')
}
#!/bin/bash

export DISPLAY=:0
export XAUTHORITY=/home/xel/.Xauthority

MONITOR='VGA1'
LAPTOP='LVDS1'

MONITOR_STATE=$(xrandr | grep "$MONITOR connected")

if [[ -n $MONITOR_STATE ]]; then
    xrandr --output $MONITOR --auto
    xrandr --output $LAPTOP --off
else
    xrandr --output $MONITOR --off
    xrandr --output $LAPTOP --auto
fi

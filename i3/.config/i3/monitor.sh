#!/bin/bash
# one still has to run "chmod +x monitor.sh"
EXTERNAL_OUTPUT="VGA-1"
INTERNAL_OUTPUT="LVDS-1"

if [ ! -f ~/.config/i3/monitor_mode.txt ] ; then
    monitor_mode="all"
else
    monitor_mode=`cat ~/.config/i3/monitor_mode.txt`
fi

if [ $monitor_mode = "all" ]; then
        monitor_mode="external"
        xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT --auto
elif [ $monitor_mode = "external" ]; then
        monitor_mode="clones"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --same-as $INTERNAL_OUTPUT
elif [ $monitor_mode = "clones" ]; then
        monitor_mode="internal"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --off
else
        monitor_mode="all"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --left-of $INTERNAL_OUTPUT
fi

# set wallpaper again
feh --bg-fill ~/.config/i3/wallpapers/*

echo "${monitor_mode}" > ~/.config/i3/monitor_mode.txt

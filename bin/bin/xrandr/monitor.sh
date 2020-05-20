#!/bin/bash
external=$(xrandr | grep -o "VGA[\w'-]*\w*")
internal=$(xrandr | grep -o "LVDS[\w'-]*\w*")

if [ ! -f ~/bin/.monitor_mode.txt ] ; then
    monitor_mode="all"
else
    monitor_mode=`cat ~/bin/.monitor_mode.txt`
fi

if [ $monitor_mode = "all" ]; then
        monitor_mode="external"
        xrandr --output "$internal" --off --output "$external" --auto
        notify-send "external"
elif [ $monitor_mode = "external" ]; then
        monitor_mode="clones"
        xrandr --output "$internal" --auto --output "$external" --auto --same-as "$internal"
        notify-send "mirroring screens"
elif [ $monitor_mode = "clones" ]; then
        monitor_mode="internal"
        xrandr --output "$internal" --auto --output "$external" --off
        notify-send "internal"
else
        monitor_mode="all"
        xrandr --output "$internal" --auto --output "$external" --auto --left-of "$internal"
        notify-send "external left of internal"
fi

# set wallpaper again
set_background.sh

echo "${monitor_mode}" > ~/bin/.monitor_mode.txt

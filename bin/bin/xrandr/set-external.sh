#!/bin/bash


# find name of internal monitor
monitors=$(xrandr -q)
declare -a possible_internal_names=("LVDS1" "eDP1")
for int_port in "${possible_internal_names[@]}"
do 
    if echo "$monitors" | grep -q $int_port
    then
        internal=$int_port
    fi
done


# somehow it doesn't work all the time?
declare -a ports=("DP" "HDMI" "VGA")
# loop over connectors and break if one of them is connected
for port in "${ports[@]}"
do
    external=$(echo "$monitors" | grep "^$port. con" | awk '{print $1}')
    xrandr --output $internal --off --output "$external" --auto && break
done


# other possible solution
# external_dp=$(xrandr | grep -o "^DP[\w'-]*\w* connected" | awk '{print$1}')
# external_hdmi=$(xrandr | grep -o "^HDMI[\w'-]*\w* connected" | awk '{print$1}')
# xrandr --output $internal --off --output "$external_dp" --auto --output "$externalhdmi" --auto


# set wallpaper again
set_background.sh
set_background.sh

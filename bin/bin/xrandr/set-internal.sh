#!/bin/bash


externalvga=$(xrandr | grep -o "VGA[\w'-]*\w*")
externalhdmi=$(xrandr | grep -o "HDMI[\w'-]*\w* connected")
# remove the keyword "connected"
externalhdmi=${externalhdmi% connected}
# remove the space at the end
# externalhdmi="${externalhdmi::-1}"
# echo "$externalhdmi"


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


xrandr --output $internal --auto --output $externalvga --off --output HDMI1 --off --output HDMI2 --off --output HDMI3 --off --output DP2 --off

# set wallpaper again
set_background.sh


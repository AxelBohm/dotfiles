#!/bin/bash


get_song_name()
{
    first_line=$(mpc | sed q)
    first_word="${first_line:0:7}"
    if [[ $first_word = "volume:" ]]; then
        song=""
    else
        song=$first_line
    fi
}


while true;
do
    f=$(cat /sys/class/thermal/thermal_zone0/temp)
    batt=$( acpi -b | sed 's/.*[Full|charging|unknown], \([0-9]*\)%.*/\1/gi' )
    temp=$(echo $f | cut -b -2)°C
    date=$(date +'%a %b %d, %R')
    get_song_name
    xsetroot -name ""$song" | Bat: $batt % | $temp | $date"
    sleep 0.1;
done;

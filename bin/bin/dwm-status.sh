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
    temp=$(echo $f | cut -b -2)°C
    batt=$(acpi -b | sed 's/.*[Full|charging|unknown], \([0-9]*\)%.*/\1/gi')
    date=$(date +'%a %b %d, %R')
    wifi_ssid=$(iwgetid --raw)
    memory=$(free -m | awk 'FNR==2{ printf "%.0f%\n", $3*100/$2 }')
    get_song_name
    xsetroot -name "$song   wifi: $wifi_ssid  bat: $batt%  mem: $memory  $temp  $date"
    sleep 0.5;
done;

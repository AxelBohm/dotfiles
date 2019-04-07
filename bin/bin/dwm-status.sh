#!/bin/bash

music() {
    printf "$(mpc current)"
}

email(){
    maildirs="$HOME/.mail/*/INBOX/new/"
    ml="$(find $maildirs -type f | wc -l)"
    if (( ml > 0 )); then
        printf "%b" "$ml"
    else
        printf "0"
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
    xsetroot -name "$(music)  mail:$(email)  wifi:$wifi_ssid  bat:$batt%  mem:$memory  $temp  $date"
    sleep 1;
done;

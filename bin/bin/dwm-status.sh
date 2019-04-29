#!/bin/bash

music() {
    printf "$(mpc current)"
}

email(){
    maildirs="$HOME/.mail/*/INBOX/new/"
    mail="$(find $maildirs -type f | wc -l)"
    printf "$mail"
}

wifi(){
    ssid="$(iw dev | grep ssid | awk '{print $2}')"
    # ssid="$(iwgetid --raw)"
    printf "$ssid"
}

while true;
do
    vol=$(amixer get Master | awk -F'[][]' 'END{ print $4":"$2 }')
    f=$(cat /sys/class/thermal/thermal_zone0/temp)
    temp=$(echo $f | cut -b -2)°C
    batt=$(acpi -b | sed 's/.*[Full|charging|unknown], \([0-9]*\)%.*/\1/gi')
    date=$(date +'%a %b %d, %R')
    memory=$(free -m | awk 'FNR==2{ printf "%.0f%\n", $3*100/$2 }')
    xsetroot -name "$(music)  mail:$(email)  wifi:$(wifi)  bat:$batt%  mem:$memory  $temp  $date"
    sleep 1;
done;

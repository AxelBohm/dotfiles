#!/bin/bash

music() {
     cur="$(mpc current)"
     if [[ $cur ]]; then
         playing="$(mpc | grep playing)"
         if [[ $playing  ]]; then
             icon=" "
         else
             icon=" "
         fi
     else
         icon=""
     fi
     printf "$icon$cur"
}

email(){
    maildirs="$HOME/.mail/*/*/new/"
    mail="$(find $maildirs -type f | grep -i "Inbox/new" | wc -l)"
    printf " $mail"
}

wifi(){
    ssid="$(iw dev | grep ssid | awk '{print $2}')"
    # ssid="$(iwgetid --raw)"
    printf " $ssid"
}

temp(){
    f=$(cat /sys/class/thermal/thermal_zone0/temp)
    temp=$(echo $f | cut -b -2)°C
    printf "$temp"
}

volume(){
    vol=$(amixer get Master | awk -F'[][]' 'END{ print $2 }')
    mute=$(amixer get Master | awk -F'[][]' 'END{ print $4 }')
	if [[ "$mute" == "off" ]]; then
		icon= #mute icon
	else
		# if [[ "$vol" -lt "40" ]]; then
		# 	icon= #low volume icon
		# elif [[ "$vol" -gt "40" && "$vol" -lt "70" ]]; then
		# 	icon= #medium volume icon
		# elif [[ "$vol" -gt "70" ]]; then
        icon= #high volume icon
		# fi
	fi

	echo "$icon $vol"
}

battery(){
    batt=$(acpi | cut -d ',' -f 2 | cut -d " " -f 2)
    echo " $batt"
}

memory(){
    memory=$(free -m | awk 'FNR==2{ printf "%.0f%\n", $3*100/$2 }')
    icon=" "
    echo "$icon$memory"
}

get_weather(){
    wttr=$(curl wttr.in?format='%t+%p')
    temp=$(echo $wttr | awk '{print $1;}')
    rain=$(echo $wttr | awk '{print $2;}')

    rain_icon=" "
    temp_icon=" "
    printf "$rain_icon$rain, $temp_icon$temp"
}

while true;
do
    if [[ $weather ]]; then
        minute="$(date +'%M')"
        if [[ $minute == "00" ]]; then
            weather=$(get_weather)
        fi
    else
        weather=$(get_weather)
    fi

    date=$(date +'%a %b %d, %R')

    xsetroot -name "$(music)  $weather  $(volume)  $(email)  $(wifi)  $(battery)  $(memory)  $(temp)  $date"

    sleep 1;
done;

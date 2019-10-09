#!/bin/bash

FIFO=~/.lemonbar.fifo

n="lemonbar-xft"
g="1920x16+0+25"
f1="envypn:style=Regular:size=13"
f2="FontAwesome:size=11"
BG="#9ddce5"
FG="#f2f3f4"
C1="#ec5ca1"
C2="#606e8c"
C3="#939cb1"
WHITE="#ffffff"
BLACK="#262626"


# powerline decorator
# $1: content
# $2: fg color
# $3: bg color
# $4: next bg color
# $5: padding
powerline() {
	echo -e "%{F$2}%{B$3}%{O$5} $1 %{O$5B-F$3}%{B$4}\ue0b0%{B-F-}"
}


clock() {
	while true; do
		echo "C`date +%H:%M`"
		sleep 1
	done
}

battery() {
	while true; do
		CAP=`cat /sys/class/power_supply/BAT0/capacity`
		case "$(cat /sys/class/power_supply/BAT0/status)" in
			D*)	STAT="" ;;
			*)	STAT="\uf0e7" ;;
		esac
		if (( 0 < CAP && CAP <= 20 )); then
			SYM="\uf244"
		elif (( 20 < CAP && CAP <= 40 )); then
			SYM="\uf243"
		elif (( 40 < CAP && CAP <= 60 )); then
			SYM="\uf242"
		elif (( 60 < CAP && CAP <= 80 )); then
			SYM="\uf241"
		else
			SYM="\uf240"
		fi
		echo "B$STAT $SYM"
		sleep 5
	done
}

wifi() {
	while true; do
		echo "W\uf1eb%{O15}`iw wlp3s0 info | grep -oP '(?<=ssid ).*$'`"
		sleep 5
	done
}


trap 'trap - TERM; kill 0' INT TERM QUIT EXIT


[ -p "$FIFO" ] || mkfifo $FIFO

clock   > $FIFO &
battery > $FIFO &
wifi    > $FIFO &

while read -r line; do
	case $line in
		C*)	C=`powerline "${line#?}" $WHITE $C1 $C2 20` ;;
		B*)	B=`powerline "${line#?}" $WHITE $C2 $C3 20` ;;
		W*)	W=`powerline "${line#?}" $WHITE $C3 $C3 35` ;;
	esac
	echo -e "%{c}$C$B$W"
done < $FIFO | lemonbar -p -n $n -g $g -f $f1 -f $f2 -B $BG -F $FG | sh &

wid=`xdo id -m -a $n`
xdo above -t `xdo id -N Bspwm -n root | sort | head -n 1` $wid


wait

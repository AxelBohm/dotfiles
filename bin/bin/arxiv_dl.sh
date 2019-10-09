#!/bin/sh

# regex='(((https://arxiv.org))[.:][^ >"\t]*|www\.[-a-z0-9.]+)[^ .,;\t>">\):]'
regex='(((http|https)://arxiv.org/abs/)[^ >"\t]*[0-9.])[^ .,;\t>">\):]'
url=$(grep -Po "$regex" | sed 's/abs/pdf/g')
name=$(dmenu -p "name PDF:" | sed 's/ /_/g' | sed 's/$/.pdf/' ) || exit
if [ -n "$url" ]; then
    notify-send "downloading paper"
    wget --user-agent="Mozilla" -O ~/Downloads/"$name" "$url"
fi
yn=('yes\n' 'no')
choice=$(print "$yn" | dmenu -p "open pdf?")

case choice in
    yes)
        zathura ~Downloads/"$name"
        ;;
esac

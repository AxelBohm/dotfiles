#!/bin/bash

if [[ "$(calcurse -n)" ]]; then
    notify-send "calcurse reminder" "$(calcurse -n)"
fi

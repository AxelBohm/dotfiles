#!/bin/bash

nextapp=$(calcurse -n | tail -1 )
name=$(echo "$nextapp" | cut -d ' ' -f 5- -)

time=$(echo "$nextapp" | cut -d ' ' -f 1-4 | tr -d [ | tr -d ] | tr -d :)

if [[ $time -le 10 ]]; then
    notify-send "[reminder]" "$name"
fi

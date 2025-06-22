#!/bin/bash

# Extract current brightness robustly
current=$(ddcutil getvcp 10 | sed -n 's/.*current value *= *\([0-9][0-9]*\).*/\1/p')

[ -z "$current" ] && { echo "Could not read brightness"; exit 1; }

# Decrease by 10, floor at 0
new=$(( current - 10 ))
[ "$new" -lt 0 ] && new=0

echo "Setting brightness to $new"
ddcutil setvcp 10 $new

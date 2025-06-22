#!/bin/bash

# Get current brightness
current=$(ddcutil getvcp 10 | sed -n 's/.*current value *= *\([0-9][0-9]*\).*/\1/p')

# Fallback if parsing failed
[ -z "$current" ] && { echo "Could not read brightness"; exit 1; }

# Increase by 10
new=$(( current + 10 ))

# Set new brightness
echo "Setting brightness to $new"
ddcutil setvcp 10 $new

#!/usr/bin/bash

# Define the clock
Clock() {
        DATETIME=$(date "+%a %b %d, %T")

        echo -n "$DATETIME"
}

# Print the clock

while true; do
        echo "%{c}%{#3b4252}%{$color1} $(Clock) %{F-}%{B-}"
        sleep 1
done

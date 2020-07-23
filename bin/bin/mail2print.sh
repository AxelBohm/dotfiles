#!/bin/sh

echo "pretty please print" | neomutt -a "$1" -s "print" -- mobile-print.mathematik@univie.ac.at

notify-send "mail sent to printer"

#!/bin/bash
# add to path when called as a cronjob
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
CALCURSE_CALDAV_PASSWORD=$(pass show Uni/univie-rechner | sed 1q) calcurse-caldav
# CALCURSE_CALDAV_PASSWORD=$(pass show --password fruux-arch) calcurse-caldav

# how to initialize
#CALCURSE_CALDAV_PASSWORD=$(pass show Uni/univie-rechner | sed 1q) calcurse-caldav --init="two-way"

#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
CALCURSE_CALDAV_PASSWORD=$(pass show Uni/univie-rechner | sed 1q) calcurse-caldav --config ~/.calcurse/caldav/config_cal --syncdb ~/.calcurse/caldav/sync_cal.db
# CALCURSE_CALDAV_PASSWORD=$(pass show --password fruux-arch) calcurse-caldav --config ~/.calcurse/caldav/config_todo --syncdb ~/.calcurse/caldav/sync_todo.db

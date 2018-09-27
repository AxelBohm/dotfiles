#!/bin/bash
CALCURSE_CALDAV_PASSWORD=$(lpass show --password fruux-arch) calcurse-caldav --config ~/.calcurse/caldav/config_cal --syncdb ~/.calcurse/caldav/sync_cal.db
CALCURSE_CALDAV_PASSWORD=$(lpass show --password fruux-arch) calcurse-caldav --config ~/.calcurse/caldav/config_todo --syncdb ~/.calcurse/caldav/sync_todo.db

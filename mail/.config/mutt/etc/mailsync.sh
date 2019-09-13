#!/usr/bin/env bash
# This script will run offlineimap and check
# for new email if there is an internet connection.
#
# If it detects new mail, it uses mpv to play a
# notification sound: notify.opus

export DISPLAY=:0.0

echo 🔃 > ~/.config/mutt/.dl

# Run offlineimap. You can feed this script different settings.
offlineimap -o "$@"
rm -f ~/.config/mutt/.dl
pkill -RTMIN+12 i3blocks

# Check all accounts/mailboxes for new mail. Notify if there is new content.
for account in $(ls ~/.mail)
do
	#List unread messages newer than last mailsync and count them
	newcount=$(find ~/.mail/$account/INBOX/new/ -type f -newer ~/.config/mutt/etc/mailsynclastrun 2> /dev/null | wc -l)
	if [ "$newcount" -gt "0" ]
	then
        notify-send "new mail"
	fi
done

#Create a touch file that indicates the time of the last run of mailsync
touch ~/.config/mutt/etc/mailsynclastrun

# index mail
notmuch new

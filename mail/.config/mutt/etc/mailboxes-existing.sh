#!/bin/sh

mailroot=$1
shift

line=
for mailbox do
	path=${mailbox#=}
	[ -d "$mailroot/$path" ] || continue

	escaped=$(printf '%s' "$mailbox" | sed 's/\\/\\\\/g; s/"/\\"/g')
	line="$line \"$escaped\""
done

if [ -n "$line" ]; then
	printf 'mailboxes%s\n' "$line"
fi

exit 0

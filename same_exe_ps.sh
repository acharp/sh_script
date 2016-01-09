#!/bin/sh

# Get the PID of all the processes that come from the same executable but different user.


CURRENT_COMMAND=""
CURRENT_USER=""

ps -eo user,pid,comm | sed '1d' | sort -k3 | while read USER PID COMMAND; do

	if [ "$CURRENT_COMMAND" != "$COMMAND" ]; then
		CURRENT_COMMAND="$COMMAND"
		CURRENT_USER="$USER"
	fi

	if [ "$CURRENT_USER" != "$USER" ]; then
		echo $PID
	fi

done
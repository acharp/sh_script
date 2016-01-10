#!/bin/sh

# List all the processes that have a link to the outside (outside meaning all that isn't local network)
# Need to have sockstat installed.


sockstat -4c | sed '1d' | \
	while read USER COMMAND PID FD PROTO LOCAL FOREIGN; do

		FOREIGN=$(echo $FOREIGN | sed 's/:[0-9]*//g')
		route -n get "$FOREIGN" | grep "^destination: default$" > /dev/null

		if [ $? -eq 0 ]; then
			echo "$USER: $PID, connected to $FOREIGN"
		fi

	done
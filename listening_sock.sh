#!/bin/sh

# List the PID of all the sockets that are listening in IPv4.


netstat -4lnp | while read PROTO C2 C3 C4 C5 C6 C7; do

	if [ "$PROTO" = "tcp" ]; then
		echo "$C7" | sed 's/\/.*//g'
	elif [ "$PROTO" = "udp" ]; then
		echo "$C6" | sed 's/\/.*//g'
	fi

done
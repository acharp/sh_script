#!/bin/sh

# List all the PID of the processes that have a certain parent (here parent is process apache2).


_PIDS=$(ps ax -o pid,comm | grep ' apache2' | awk '{print $1}')

for PID in $_PIDS; do
	ps ax -o pid,ppid | grep " $PID\$" | awk '{print $1}'
done


# Other method : using pgrep (but it's non POSIX...)
# pgrep -P $(pgrep -d, apache2 | sed 's/,$//g')
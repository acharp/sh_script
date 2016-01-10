#!/bin/sh

# List all the socket opened by a given process (here chrome).


_PATH=$(netstat -lxp | grep -E ' [0-9]+\/chrome ' |\
	sed -E ' s/.* [0-9]+\/chrome *(\/.*)/\1/g')

echo $(ls -l "$_PATH" | awk '{print $3" "$4" "$1}') "$_PATH"
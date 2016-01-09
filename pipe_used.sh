#!/bin/sh

# Look for all the pipe actually used on the system and formate the result.


find / -type p | while read FILE; do
	_INFO=$(ls -al "$FILE" | awk '{print $3" "$4" "$1}')
	echo $_INFO $FILE
done
#!/bin/sh

# Count how many times each word appears in a file.


COUNT="-1"
FILE=/path/to/myfile

for WORD in $(cat "$FILE" | tr -cs 'a-zA-Z' '\n' | sort); do

	if [ "$COUNT" -eq -1 ]; then
		CACHED_WORD=$WORD
		COUNT=1
		continue
	fi

	if [ "$CACHED_WORD" = "$WORD" ]; then
		COUNT=$(($COUNT + 1))
	else
		echo "$CACHED_WORD : $COUNT"
		CACHED_WORD=$WORD
		COUNT=1
	fi

done
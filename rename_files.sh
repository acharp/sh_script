#!/bin/sh

# Rename a set of files in the current directory. Here we rename files with .htm extension by .html


find . -name '*.htm' -type f | while read LINE; do
	NNAME=$(echo $LINE | sed 's/\.htm$/.html/g')
	mv "$LINE" "$NNAME"
done
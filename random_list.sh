#!/bin/sh

# Sort a list aleatory.


trap '${TMPFILE:+rm -f "$TMPFILE"}' 0 INT TERM EXIT
TMPFILE=$(mktemp /tmp/random_list.XXXXXXX)

{ cat | grep -v '^ *#' ; } > "$TMPFILE" << EOF
#
# Put your list here
#
Dr Who
Michael Jordan
Homer Simpson
Zinedine Zidane
Kylo Ren
Gandalf TheWhite
#
EOF

MAX=$(wc -l < "$TMPFILE")
SEQ=:$(seq -s: 1 $MAX)

for ITER in $(seq $MAX 1); do
	IDX=$(expr $(jot -r 1 1 32768) % $ITER + 2)
	TIRAGE="$(echo "$SEQ" | cut -d: -f"$IDX")"
	SEQ=$(echo "$SEQ" | sed "s|:$TIRAGE:|:|")
	echo -n "$(expr 1 + $MAX - $ITER): " && sed -n "${TIRAGE}p" "$TMPFILE"
done

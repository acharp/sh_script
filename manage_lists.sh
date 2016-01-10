#!/bin/sh

# With two lists A and B, returns elements :
# contained by the two lists
# present in A but not in B
# present in B but not in A
#listA and listB must be two files in current dir


mkfifo listA.fifo listB.fifo
sort listA > listA.fifo &
sort listB > listB.fifo &
comm listA.fifo listB.fifo
rm listA.fifo listB.fifo

# In listB but not in listA
cat listA | grep -f - -v listB
# The opposite
cat listB | grep -f - -v listA
# In both
cat listA | grep -f - listB
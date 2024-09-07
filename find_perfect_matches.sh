#!/bin/sh
blastn\
	-query $1\
	-subject $2\
	-task blastn-short\
	-outfmt "6 std qlen " | awk '$3==100.000 && $4==$13' > $3
wc -l $3

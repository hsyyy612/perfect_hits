#!/bin/sh
blastn\
	-query $1\
	-subject $2\
	-task blastn-short\
	-outfmt "6 std qlen " | awk '$3==100.000 && $4==$13' > | awk '{print $1"\t"$9"\t"$10}' > temp.txt



# extract end and start as start and end of spacer sequence, and form output file .BED

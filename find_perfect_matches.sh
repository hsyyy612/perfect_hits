#!/bin/sh
blastn\
	-query $1\
	-subject $2\
	-task blastn-short\
	-outfmt "6 std qlen " | awk '$3==100.000 && $4==$13' | awk '{print $2"\t"$9"\t"$10}' > temp.txt

awk '
{
   spacer_start=prev_end+1 
   spacer_end=$2-1

   if (spacer_start<=spacer_end){
    print prev_chr"\t"spacer_start"\t"spacer_end
   }

   prev_chr=$1
   prev_end=$3

}
' temp.txt | awk 'NR>1' > temp2.bed


seqtk subseq $2 temp2.bed > $3
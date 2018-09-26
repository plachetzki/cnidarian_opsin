#! /bin/bash

#converts al alignments to phylip files using seqConverter.pl script
for fasta in ./align/*_ali
do
    seqConverter.pl -d$fasta -if -ope
done

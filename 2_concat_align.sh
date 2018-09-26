#! /bin/bash

# two positional arguments, blast queary seqs and the anchor seqs (more distantly realted outgroups)
baits=$1
anchors=$2

# remove special characters
perl -pi -e 's/\*//g' ./hits_fasta/*.fas

# run CD-HIT to remove seqs with 98% or higher seq similarity
# add baits and anchors into fastas, and align in MAFFT
for fasta in ./hits_fasta/*.fas 
do
    cdhit -i $fasta -o ${fasta%.}_cdhit -c 0.98 -n 5 
    cat $1 $2 ${fasta%.}_cdhit > ${fasta%.}_bts_ancrs                                                                                                                                     
    mafft ${fasta%.}_bts_ancrs > ${fasta%.}_ali                                                                                                                                           
done 

# new dir named align for all alignments and clean up temp files
mkdir align
mv ./hits_fasta/*ali ./align 
rm ./hits_fasta/*ancrs

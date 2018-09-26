#! /bin/bash

## Part1- BLASTp search
# first positional arg is fasta conataining blast queary seqs
fasta_query=$1

# iterate over the blastdb's and preform blast search with queary seqeunce file provided in first poisitional argument
for fasta in ./blastdb/*.fas
do
  	echo "BLASTING  $fasta ..."
        blastp -query $1 -db $fasta -out ${fasta%.}_ref_blastout -outfmt 6 -max_target_seqs 50 -evalue 0.00001
done

# all out files will be in new blastout directory 
mkdir blastout

mv ./blastdb/*blastout ./blastout/


## Part 2
# retrieve accession numbers from blast results
for i in ./blastout/*blastout
do
  echo "getting hit accessions  $i ..."
  cut -f2 $i > ${i%.}_hits
done

# all accession files sent to new dir called hit1_accession
mkdir hit1_accessions

mv ./blastout/*hits ./hit1_accessions


## Part 3
# retrieve seqeunces that coorespond to accession number for each taxa
# uses the perl selectSeqs.pl script which, given a list of acessions and the cooresponding fasta, retieves all sequence data for each accession provided
for hitfile in ./hit1_accessions/*_ref_blastout_hits
do
    perl -p -e 's/\>//g' $hitfile > temp
    filenamefull=${hitfile##*/}
    filename="${filenamefull%_ref_blastout_hits*}"
    echo "pull FASTA seqs from  $filename ..."
    selectSeqs.pl -f temp ./fastas/$filename >> $filename
    rm temp
done

# resulting fastas, which contain all blast hit seqs for each taxa, sent to new dir called hits_fasta
mkdir hits_fasta

mv *.fas ./hits_fasta

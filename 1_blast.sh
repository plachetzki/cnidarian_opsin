#! /bin/bash

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

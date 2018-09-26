# Phylogenetic Focusing Revelas the Evolution of Eumetazoan Opsins
Deep analyses of eumetazoan opsin phylogeny

See COMMANDLINE.md for list of commands and arguments used for analyses

## Scripts used for Phylogenetic Focusing

#### 0_makeblast.sh
Shell script for formatting fastas into blastable databases

#### 1_blast.sh
Shell script for BLASTp search against blast dbs with a fasta containing query seqs. Retrieves the sequence data back 

#### 2_concat_ali.sh
Shell script, runs CD-HIT to remove redundancy, adds bait and anchor seqs in, and aligns using MAFFT

#### 3_convert.sh
Shell script using the perl seqConverter.pl script to convert alignment files to phylip

#### 4_RAxML.sh
Shell script making ML trees using PROTGAMMAGTR model in RAxML. Must be executed in directory containing phylip files

#### 5_tree_editor.R
R script for first round of phylogenetic focusing. Filtering out distantly related sequences in a taxon specific manner

#### 6_pull_seqs.sh
(loop under construction). Shell script for retrieving sequence data for all the genes that were included in the trees export from tree_editor.R script

#### 7_total_ali_and_tree.sh
Shell script to concatenate all fastas together into the "total" dataset and aligns using MAFFT

#### selectSeqs.pl
Perl script: you provide file with the names of sequences wanted, the original fasta containing all the sequence data, and it outputs a fasta file containing the sequence data only from the names you provided

#### seqConverter.pl
Perl script for converting alignments into phylip files

#### name_change.py 
Python script for changing names back to original format after the alignment program PASTA strips capital letters and underscores

#### branch_trimmer.py
Python script for pruning branches that exceed a user defined branch length in a phylogeny

#### seqRemover.py
Python script: given a fasta file and the text file containing the headers of unwanted seqs, this script outputs a new file lacking the unwamted seqs specified in the text file

# Phylogenetic Focusing Revelas the Evolution of Eumetazoan Opsins
Deep analyses of eumetazoan opsin phylogeny

commandline.md with list of commands coming soon

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

##### 5_tree_editor.R
R script for first round of phylogenetic focusing. Filtering out distantly related sequences in a taxon specific manner

##### 6_pull_seqs.sh
(loop under construction). Shell script for retrieving sequence data for all the genes that were included in the trees export from tree_editor.R script

#### 7_total_ali.sh
Shell script to concatenate all fastas together into the "total" dataset and aligns using MAFFT

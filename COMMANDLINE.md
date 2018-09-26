# Commands and Parameters used in analyses
------

## A. Data prep
All data in protein space prior that start
A1. Format all seq headers into "Genus_#" with the # coorespoding to the seqeunce in the fasta file

```sh
awk '/^>/{print ">" ++i; next}{print}' <NAMEOFFASTAFILE> NAMEOFOUTFILE
perl -p -i -e 's/>/>GENUS_/g' NAMEOFOUTFILEFROMABOVE
```
It must be executed for each original fasta.


A2. Make blastable databases
All fasta files with correct seq headers located in a directory called 'fastas'

*Dependencies: BLAST (Altschul et al 1990)*
```sh
./0_blastdb.sh
```

## B. Initial Search and Taxon Specific filter

B1. Conduct blast search using a fasta file containing all query or bait sequences, pull accession numbers, retrieve seqeunces, and generate fastas containing blast hits for each taxa

*Dependencies: BLAST (Altschul et al 1990), CD-HIT v4.6 (Fu et al. 2012), and custom selectSeqs.pl script*
```sh
./1_blast_and_pull.sh BLASTQUERYFASTA
```

B2. Remove redudant sequences in each fasta, concatenate blast queary seqeunces and "anchor" seqeunces with fasta for every taxa, and align using MAFFT

*Dependencies: CD-HIT v4.6 (Fu et al. 2012) and MAFFT v7.305b (Katoh et al. 2013)*
```sh
./2_concat_align.sh BLASTQUERYFASTA ANCHORSEQFASTA
```

B3. Convert alignments to phylip files

*Dependencies: custom seqConverter.pl script*
```sh
./3_convert.sh
```

B4. Make maximum likelihood trees using the PROTGAMMALG model in RAxML for all phylip files. This script must be executed in the directory containing all phylip files (align)

*Dependencies: RAxML v8.2.10 (Stamatakis 2014)*
```sh
./4_RAxML.sh
```

B5. First round of Phylogenetic Focusing: Filter blast results in a taxon specific manner. tree_editor.R script is executed from local folder containing all the ML phylogenies from above. This that must be edited in the R script are the "root" and "outgroup" variable were root is the anchor sequences and outgroup is an acceptable outgroup to the gene family of interest. Output is a text file containing the names of the genes (Genus_accession#) that made it through for further analysis. 

```sh
5_tree_editor.R
```

B6. Retrieve sequence info for all the tips that made it through the tree_editor.R script. Note that this script is currently not looped and each taxa was indivdually added. This will be updated soon.

*Dependencies: custom selectSeqs.pl script*
```sh
./6_pull_seqs.sh
```

B7. Now that blast hits have been filtered in taxa specific manner, all the sequences are concatenated into one fasta were termed "total_opsin.fas". Make sure to include a copy of the fasta files containing the baits and anchors in this directory so they are included into the total_opsin.fas as well. This represents the first total dataset. It is aligned, converted to phylip, and a ML tree is built using the PROTGAMMAGTR model in RAxML. NOTE this will most likely take upwards of 24 hours depending on the amount of data

*Dependencies: MAFFT v7.305b (Katoh et al. 2013), custom seqConverter.pl script, and RAxML v8.2.10 (Stamatakis 2014)*
```sh
./7_total_ali_and_tree.sh
```


## C. Concatenated Tree analyses and filtering

C1. Identify the clade containing the genes of interest and the true outgroup (for our analyses that is the opsin + paraopsin clade). Prune this clade off, extract the names of all the tips, and retrieve sequence data for those tips. NOTE: you must also concatenate all the original fastas from the taxa together to make one "total_fasta.fa" file

```sh
./selectSeq.pl -f PATHTOTIPFILE PATHTOtotal_fasta.fa > NAMEOFOUTFILE
cat OUTFILE BAITFILE > FASTA1
```

C2. Begin filtering: First we align the 'fasta1' file using MAFFT, mask out gap sites in the alignment, and then remove any sequence that lacks enough informative data (we set the threshold to any seq with less than 150 AAs worth of data, done using the check_seqsLen.py script). Fasta file is output containing the seqeunces that pass the user defined length threshold.

*Dependencies: MAFFT v7.305b (Katoh et al. 2013) and trimAl v1.4 (Capella-Gutiérrez et al. 2009)*
```sh
mafft FASTA1 > FASTA1.ali
trimal -in FASTA1.ali -out FASTA1_TRIMMED.ali -gt 0.2
./check_seqsLen.py -i FASTA1TRIMMED.ali -t 150 -o FASTA2
```

C3. Align FASTA2, mask out gap sites, and remove spurious sequences using user defined thresholds in trimAl.

*Dependencies: MAFFT v7.305b (Katoh et al. 2013) and trimAl v1.4 (Capella-Gutiérrez et al. 2009)*
```sh
mafft FASTA2 > FASTA2.ali
trimal -in FASTA2.ali -out FASTA2_TRIMMED.ali -gt 0.2
trimal -in FASTA2.ali -out FASTA2_TRIMMED.ali -resoverlap 0.55 -seqoverlap 55
```

C4. Remove sequences with insertions greater than 25 AAs long that do not align to any data. These are most likely errors from assembly containing read throughs from pseudogenes or introns. These insertions must be identifed by finding them in SEAview and removed from the fasta file.

*Dependencies: MAFFT v7.305b (Katoh et al. 2013) and SEAveiw v4 (Gouy et al. 2010)*
```sh
mafft FASTA3 > FASTA3.ali
# FASTA3.ali is screened in SEAview for sequences with erroneous insertions. Names of seqs to be removed written to RemoveThese.txt
./seqRemover.py -i FASTA3 -o FASTA4 -r RemoveThese.txt
```

C5. With filtering complete, FASTA4 is aligned, converted to phylip format, and a ML tree is made

*Dependencies: MAFFT v7.305b (Katoh et al. 2013), custom seqConverter.pl script, and RAxML v8.2.10 (Stamatakis 2014)*
```sh
mafft FASTA4 > FASTA4.ali
./seqConverter.pl -d./FASTA4.ali -if -ope
raxmlHPC-PTHREADS -T 24 -s FASTA4.phylip -m PROTGAMMAGTR -p 12345 -n opsin_and_outgroup.tre
```

C6. The ML tree is viewed in FigTree, rooted with appropriate outgroup, and the clade of interest (the monophyletic opsin clade in our case) is pruned off and used for further analysis.

## D. Final analyses for the clade of interest

D1. With the final clade isolated more stringent methods of alignment and tree buliding can occur. First our final dataset was aligned with the progressive aligner PASTA, names were converted back to the original format using the name_change.py script, and we removed sequences that lacked the characteristic lysine in position 296 of opsin sequences by identifying them in SEAview making another RemoveThese.txt file with the headers of sequences lacking lysine 296. This final fasta is aligned using PASTA, names are converted back to normal, and the alignment is converted to phylip format.

*Dependencies: PASTA (Mirarab et al. 2015), custom name_change.py script, custom seqRemover.py script, SEAveiw v4 (Gouy et al. 2010), and custom seqConverter.pl script*
```sh
module load anaconda/colsa
source activate pasta-1.8.2
srun pasta -i opsinclade.fas -d protein -j opsinclade --num-cpus=24
# PASTA strips underscores and removes capitial letter, we put them back with the next step
./name_change.py -p opsinclade_temp_iteration_2_seq_alignment.txt -o opsinclade_fixed.ali
# from here we view the alignment in SEAview and note seqs lacking lysine 296 in the RemoveThese.txt file
./seqRemover.py -i opsinclade_fixed.ali -o opsinclade_musthaveK.fas -r RemoveThese.txt
srun pasta -i opsinclade_musthaveK.fas -d protein -j opsinclade_musthaveK --num-cpus=24
./name_change.py -p opsinclade_musthaveK_temp_iteration_2_seq_alignment.txt -o opsinclade_musthaveK_fixed.ali
./seqConverter.pl -d./opsinclade_musthaveK_fixed.ali -if -ope
```

D2. With the refined final opsin fasta, the final steps are depended on how many different tree building approaches and analyses the researcher wants to conduct. Below are the lines of code for all the phylogenies we generated using varrying models in RAxML, IQTree, and PhyloBayes MPI

*Dependencies: RAxML v8.2.10 (Stamatakis 2014)*
```sh
## the following are for the best fitting ML trees
raxmlHPC-PTHREADS -T 24 -s opsinclade_musthaveK_fixed.phylip -m PROTGAMMAGTR -# 20 -p 12345 -n final_opsinclade_gtr.tre
raxmlHPC-PTHREADS -T 24 -s opsinclade_musthaveK_fixed.phylip -m PROTGAMMAAUTO -# 20 -p 12345 -n final_opsinclade_auto.tre
## the following are for bootstraping
raxmlHPC-PTHREADS -T 24 -s opsinclade_musthaveK_fixed.phylip -m PROTGAMMAGTR -p 12345 -n final_opsinclade_gtr.tre -x 12345 -N 1000
raxmlHPC-PTHREADS -T 24 -s opsinclade_musthaveK_fixed.phylip -m PROTGAMMAAUTO -p 12345 -n final_opsinclade_auto.tre -x 12345 -N 1000
## the following are for consensus trees
raxmlHPC-PTHREADS -T 24 -f b -t RAxML_bestTree.final_opsinclade_gtr -m PROTGAMMAGTR -p 12345 -n consensus_opsinclade_gtr.tre -z RAxML_bootstrap.final_opsinclade_gtr.tre
raxmlHPC-PTHREADS -T 24 -f b -t RAxML_bestTree.final_opsinclade_auto -m PROTGAMMAAUTP -p 12345 -n consensus_opsinclade_auto.tre -z RAxML_bootstrap.final_opsinclade_auto.tre
```

*Dependencies: IQtree 1.6.0 (Wang et al. 2018)*
```sh
## the following are testing different versions of the GTR model, ending with ModelFinder implemented via IQTree to find the best fixed model
iqtree -s opsinclade_musthaveK_fixed.phylip -m "GTR20" -alrt 1000 -nt 24
iqtree -s opsinclade_musthaveK_fixed.phylip -m "GTR20+C20" -alrt 1000 -nt 24
iqtree -s opsinclade_musthaveK_fixed.phylip -m "GTR20+C60" -alrt 1000 -nt 24
iqtree -s opsinclade_musthaveK_fixed.phylip -m MFP -alrt 1000
```

*Dependencies: Phylobayes MPI (Lartillot et al. 2013)*
```sh
## the following sets up two bayesian chains in tree space
mpirun -np 24 pb_mpi -d opsinclade_musthaveK_fixed.phylip opsin_1 
mpirun -np 24 pb_mpi -d opsinclade_musthaveK_fixed.phylip opsin_2
## the following checks if/how close the chains are to converging
bpcomp -x 1000 10 opsin_1 opsin_2
```

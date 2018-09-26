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

B4. Make maximum likelihood trees using the PROTGAMMALG model in RAxML for all phylip files

*Dependencies: RAxML v8.2.10 (Stamatakis 2014)*
```sh
./4_RAxML.sh
```


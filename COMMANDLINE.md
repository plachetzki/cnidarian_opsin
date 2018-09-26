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

B1. Conduct blast search using a fasta file containing all queary or bait sequences, pull accession numbers, retrieve seqeunces, remove redundancy, and generate fastas containing non redundant blast hits for each taxa

*Dependencies: BLAST (Altschul et al 1990), CD-HIT v4.6 (Fu et al. 2012), and custom selectSeqs.pl script*

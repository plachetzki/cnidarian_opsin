#! /bin/bash

# This script must be executed in the same dir as where phylip files are located!!!
# forms maximum likelihood phylogenies for all phylips using the PROTGAMMALG model

for phylip in *phylip
do
    raxmlHPC-PTHREADS -T 15 -s $phylip -m PROTGAMMALGF -p 12345 -n ${phylip%._}.tre
done

# all output files sent to RAx_out
mkdir RAx_out
mv RAxML* RAx_out

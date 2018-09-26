# Commands and Parameters used in analyses
------

## A. Data prep
Format all seq headers into "Genus_#" with the # coorespoding to the seqeunce in the fasta file
Can be done two ways:

1.
```sh
$ awk '/^>/{print ">" ++i; next}{print}' <NAMEOFFASTAFILE> NAMEOFOUTFILE
$ perl -p -i -e 's/>/>GENUS_/g' NAMEOFOUTFILEFROMABOVE
```

2.
```sh
./name_change.py -p NAMEOFINFILE -o NAMEOFOUTFILE
```

Regardless of the method chosen, it must be executed for each original fasta

#! /bin/bash/env

# formatting blast databases from fasta dir

for i in ./fastas/*.fas
do
        echo "formating for BLAST  $i ..."
        makeblastdb -in $i -parse_seqids -dbtype prot
done

# move blastdbs to new dir
mkdir blastdb
cp ./fastas/* blastdb

# clean up fastas dir
rm ./fastas/*.fas.*

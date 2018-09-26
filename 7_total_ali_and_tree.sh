# concatenates all fastas together making the "total tree" dataset
mkdir concat 
cp tip_seqs/*.fas concat/
cp *.fa concat
cat concat/*.fa* > concat/total_opsin.fas
rm concat/*seqs.fas

# removes any special characters and aligns total fasta in MAFFT
perl -pi -e 's/\*//g' ./concat/total_opsin.fas
mafft concat/total_opsin.fas > concat/total_opsin.ali

# convert ali to phylip
./seqConverter.pl -d./concat/total_opsin.ali -if -ope

# Make ML tree
raxmlHPC-PTHREADS -T 24 -s ./concat/total_opsin.phylip -m PROTGAMMAGTR -p 12345 -o ./concat/total_opsin.tre

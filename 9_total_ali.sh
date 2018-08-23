mkdir concat 
cp tip_seqs/*.fas concat/
cp *.fa concat
cat concat/*.fa* > concat/total_opsin.fas
rm concat/*seqs.fas
perl -pi -e 's/\*//g' ./concat/total_opsin.fas
mafft concat/total_opsin.fas > concat/total_opsin.ali

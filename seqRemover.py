#! /usr/bin/env python3

import Bio.SeqIO
import argparse

parser = argparse.ArgumentParser(description = "script to remove unwanted seqs from fasta files")
parser.add_argument("-i", "--infile", required=True, help="input fastafile")
parser.add_argument("-r", "--remove", required=True, help = "txt file of seqs to be removed")
parser.add_argument("-o", "--out", required=True, help="name of out file")
args = parser.parse_args()

try:
    keep=[]
    remove=[]
    all_seqs={}
    for name in Bio.SeqIO.parse(args.remove, "fasta"):
        remove.append(name.id)
    for record in Bio.SeqIO.parse(args.infile, "fasta"):
        if record.id not in remove:
            keep.append(record)
    Bio.SeqIO.write(keep, args.out, "fasta")
except IOError:
    print("error")


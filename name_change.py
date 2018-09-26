#! /usr/bin/env python3

import argparse
import re
import Bio.SeqIO

## custom script to edit fasat headers output from PASTA. Capitilizes first letter and inserts '_' inbetween
## genus and accession number
## Exception for Hydra because mulitple hydra speceis were used in our analyses

parser = argparse.ArgumentParser(description = "format fasta headers")
parser.add_argument("-p", "--pasta", required = True, help = "input ali file to change names of")
parser.add_argument("-o", "--out", required = True, help = "name of out file")
args = parser.parse_args()


try:
    all_lines = []
    for record in Bio.SeqIO.parse("{0}".format(args.pasta), "fasta"):
        header = re.search("([a-z]+)([0-9]*)", record.id)
        species = header.group(1)
        acc = header.group(2)
        cap_species = species.capitalize()
        new_hydra = ""
        if cap_species.startswith("Hydra"):
            hydra_cap_species = cap_species[0:5]
            remaining = cap_species[5:]
            new_hydra = "{0}_{1}".format(hydra_cap_species, remaining)
        new_header = "{0}_{1}".format(new_hydra, acc) if len(new_hydra) > 0 else "{0}_{1}".format(cap_species, acc)
        current_record = Bio.SeqRecord.SeqRecord(id = new_header, seq = record.seq, description = "")
        all_lines.append(current_record)
    Bio.SeqIO.write(all_lines, "{0}".format(args.out), "fasta")
except IOError:
    print("IO Error")

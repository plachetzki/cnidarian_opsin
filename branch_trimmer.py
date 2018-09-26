#! /usr/bin/env python3
from Bio import Phylo
import Bio.SeqIO
import argparse
import numpy

# Python script to filter out long branches in a phylogeny that exceed a 
# certain user determined threshold away from the mean 


class BranchLen:
    def __init__(self, tree, type):
        self.tree = tree
        self.type = type
        self.fasta = fasta

    # Takes tree file and type. Reads in file, and finds the
    # MRCA of the specified outgroup(s) taxa(on). If -d arg
    # given, display tree. Set empty dict.
    # For each clade in tree, if clade has a name (terminal)
    # and is not already in dict, set name to key and value to
    # the distance from the tip to the outgroup clade.
    def pat_dis(self):
        tree = Phylo.read("{0}.tre".format(self.tree), self.type)
        if args.display:
            Phylo.draw_ascii(tree)
        pat_dict = {}
        for clade in tree.find_clades():
            if clade.name:
                if clade.name in pat_dict:
                    continue
                pat_dict[clade.name] = tree.distance(clade.name)
        return pat_dist


    # Starts with insatnce atribute of pat_dis function, so pat_dis
    # dictionary. Sets total len to 0 and an empty list to hold vals
    # for stdev calc. Add each value in dictionary to total len and array.
    # Calculate mean, stdev and mean +- stdev. Then make a new dic and search
    # for branches (user specified #) stdevs away from mean.
    def branch_finder(self):
        branch_dict = BranchLen("{0}.tre".format(self.tree), self.type)
        branch_dict = branch_dict.pat_dis()
        total_len = 0
        array = []
        for entry in pat_dict:
            array.append(pat_dict[entry])
            total_len += pat_dict[entry]
        mean = total_len/len(pat_dict)
        stdev = numpy.std(array)
        finder = (mean+stdev, mean-stdev)

        if args.stdev:
            finder = (mean+(args.stdev*stdev), mean-(args.stdev*stdev))
            bad_branches = {}
            for entry in pat_dict:
                if args.tree in entry:
                    if pat_dict[entry] > finder[0] or pat_dict[entry] < finder[1]:
                        bad_branches[entry] = pat_dict[entry]
        print("{0} has {1} branches to trim".format(self.tree, len(bad_branches)))
        return bad_branches

    # Starts with instance atribute of BranchLen.branch_finder()
    # and empty list to store seqs that made it through filter.
    # for each seq in the fasta file, if the seq name is not in the
    # bad branch dict, add it the the keep list. Write a new fasta
    # file containing seqs of branches that made it through filter
    def branch_trim(self):
        trim_these = BranchLen(self.tree, self.type, self.fasta)
        trim_these = trim_these.branch_finder()
        keep_these = []
        for record in Bio.SeqIO.parse("{0}.fas".format(self.tree), "fasta"):
            if record.name not in bad_branches:
                keep_these.append(record)
        Bio.SeqIO.write(keep_these, "{0}_good_branches.fas".format(self.tree), "fasta")
        return bad_branches


parser = argparse.ArgumentParser(description = "parse arguments for branch len function")
parser.add_argument("-t", "--tree", help = "path to tree file")
parser.add_argument("-s", "--schema", help = "file type of tree")
parser.add_argument("-f", "--fasta", help = "path to fasta file with all original seqs")
parser.add_argument("-d", "--display", action = 'store_true',  help = "if user wants tree drawn to stdout")
parser.add_argument("-v", "--stdev", type = float, help = "+- 1 or 2 stdevs away from mean")
args = parser.parse_args()

my_inst = BranchLen(args.tree, args.schema)

my_inst.pat_dis()
#print(my_inst.pat_dis())

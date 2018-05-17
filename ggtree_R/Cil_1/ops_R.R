#source("https://bioconductor.org/biocLite.R")
#biocLite("ggtree")
#source("https://bioconductor.org/biocLite.R")
#biocLite("Biostrings")

library("treeio")
library("ggtree")
library("Biostrings")

setwd("~/Desktop/ggtree_R")
system("ls")


fasta <- system.file("ciliary.fas", package="ggtree")
fasta
c_tree <- read.tree("ciliary.tre")
c_tree
msaplot(p=ggtree(c_tree), fasta="ciliary.fas", offset = 0, width = 1, color = NULL, window = c(657, 673)) + coord_polar(theta='y')
msaplot(p=ggtree(c_tree), fasta="ciliary.fas", offset = 0, width = 1, color = NULL, window = c(657, 673))





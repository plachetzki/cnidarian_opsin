#source("https://bioconductor.org/biocLite.R")
#biocLite("ggtree")
#source("https://bioconductor.org/biocLite.R")
#biocLite("Biostrings")

library("treeio")
library("ggtree")
library("Biostrings")

setwd("~/Desktop/ggtree_R/mel")
system("ls")

fasta <- system.file("mel_11_9.fas", package="ggtree")
fasta
mel_tree <- read.tree("RAxML_bestTree.mel_11_9_20.tre")
mel_tree
#msaplot(p=ggtree(mel_tree), fasta="mel_11_9.fas", offset = 0, width = 1, color = NULL, window = c(657, 673)) + coord_polar(theta='y')
msaplot(p=ggtree(mel_tree), fasta="mel_11_9.fas", offset = 0, width = 1, color = NULL)

ggtree(mel_tree) + geom_text2(aes(subset=!isTip, label=node), hjust=-.3) + geom_tiplab()
p2 <- ggtree(mel_tree)

p3 <- p2 + geom_cladelabel(119, "rodent", offset=0, barsize=1, angle=90, offset.text=0.01, hjust=0.5, fontsize=6) + 
  geom_cladelabel(450, "Ciliary", offset=0, barsize=1, angle=90, offset.text=0.01, hjust=0.5, fontsize=6) +
  geom_cladelabel(427, "Xenopsin", offset=0, barsize=1, angle=90, offset.text=0.01, hjust=0.5, fontsize=6) +
  geom_cladelabel(366, "Rhabdomeric", offset=0, barsize=1, angle=90, offset.text=0.01, hjust=0.5, fontsize=6) +
  geom_cladelabel(316, "Go coupled", offset=0, barsize=1, angle=90, offset.text=0.01, hjust=0.5, fontsize=6) 
plot(p3)

#source("https://bioconductor.org/biocLite.R")
#biocLite("ggtree")
#source("https://bioconductor.org/biocLite.R")
#biocLite("Biostrings")

library("treeio")
library("ggtree")
library("Biostrings")

setwd("~/Desktop/ggtree_R/Cil_1")
system("ls")


fasta <- system.file("ciliary.fas", package="ggtree")
fasta
c_tree <- read.tree("ciliary.tre")
c_tree 

ggtree(c_tree) + geom_text2(aes(subset=!isTip, label=node), hjust=-.3) + geom_tiplab()

flip(c_tree, 154, 126)


ggtree(c_tree +aes(color=branch.length)) + geom_tiplab(size=2, color="plum1")




msaplot(p=ggtree(c_tree), fasta="ciliary.fas", offset = 0, width = 1, color = NULL, window = c(657, 673)) + coord_polar(theta='y')
msaplot(p=ggtree(c_tree), fasta="ciliary.fas", offset = 0, width = 1, color = NULL, window = c(657, 673))




setwd("~/Desktop/ggtree_R/ops_gap")
system("ls")


fasta <- system.file("opsinclade_2ndFilter.ali", package="ggtree")
fasta
g_tree <- read.tree("ops_gaps.tre")
g_tree

ggtree(g_tree) + geom_text2(aes(subset=!isTip, label=node), hjust=-.3) + geom_tiplab()
p2 <- ggtree(g_tree)

p3 <- p2 + geom_cladelabel(529, "Cnidopsin", offset=0, barsize=1, angle=90, offset.text=0.01, hjust=0.5, fontsize=6) + 
  geom_cladelabel(450, "Ciliary", offset=0, barsize=1, angle=90, offset.text=0.01, hjust=0.5, fontsize=6) +
  geom_cladelabel(427, "Xenopsin", offset=0, barsize=1, angle=90, offset.text=0.01, hjust=0.5, fontsize=6) +
  geom_cladelabel(366, "Rhabdomeric", offset=0, barsize=1, angle=90, offset.text=0.01, hjust=0.5, fontsize=6) +
  geom_cladelabel(316, "Go coupled", offset=0, barsize=1, angle=90, offset.text=0.01, hjust=0.5, fontsize=6) 
plot(p3)

#msaplot(p=ggtree(c_tree), fasta="ciliary.fas", offset = 0, width = 1, color = NULL, window = c(657, 673)) + coord_polar(theta='y')
msaplot(p=ggtree(g_tree), fasta="opsinclade_2ndFilter.ali", offset = 0, width = 1, color = NULL)


setwd("~/Desktop/ggtree_R/ops_nogap")
system("ls")


fasta <- system.file("opsinclade_2ndFilter_M63.ali", package="ggtree")
fasta
ng_tree <- read.tree("ops_nogaps.tre")
ng_tree
#msaplot(p=ggtree(c_tree), fasta="ciliary.fas", offset = 0, width = 1, color = NULL, window = c(657, 673)) + coord_polar(theta='y')
msaplot(p=ggtree(ng_tree), fasta="opsinclade_2ndFilter_M63.ali", offset = 0, width = 1, color = NULL)

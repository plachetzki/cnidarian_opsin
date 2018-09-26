
### Custom function for phylogenetic focusing. Inputs all the ML gene trees, roots them with the MRCA of
### the anchor sequences specified by root. Next the clade containing the MRCA of the genes of interest (opsin)
### and their outgroup (melatonin receptors) if identified and pruned off for further analysis. This is done
### for each taxa


library(ape)
library(phytools)
#wrap functions to perfom on each tree into one big function
dostuff<-function(sometree ) {
  treename<-unlist(strsplit(sometree,split='.tre'))[1]
  mytree <- read.tree(sometree)
  
  #############################
  ######1. root with MRCA of dopamine and histamine 
  #############################
  # setting the mrca of anchors and using as root (this sets root as the node # of mrca)
  root <- findMRCA(mytree, tips = c("Homo_orexin_receptor_1", "Homo_neuropeptide_FF_receptor", "Homo_RFamide_receptor", "Homo_neurokinin_receptor", "Homo_somatostatin_receptor", "Homo_mu_opioid_receptor_variant", "Homo_galanin_receptor"), type = "node")
  
  # now root tree  
  rootedtree <- root(mytree, node = root)
  # look to check
  plot.phylo(rootedtree)
  title(paste(treename,': rooted'))
  
  #############################
  ######2. get node between melatonin and opsin
  #############################
  # this will work to get node number of MRCA for 2+ tips
  opsinclade0 <- findMRCA(rootedtree, tips = c('Homo_melatoninR', 'Platynereis_melatoninR', 'Homo_Encephalopsin'), type="node")
  
  # extract that clade and make a new tree
  opsintree <- extract.clade(rootedtree, opsinclade0)
  # visual check (still not sure which clade to pull)
  plot.phylo(opsintree)
  title(paste(treename,': opsin'))
  
  #####################
  #####3. get names of tips in the opsin tree 
  ####################
  write (opsintree$tip.label, file=paste(treename, "_tips.txt"))
  ## export each file with "GenusName_tips.txt"
  genera<-unlist(strsplit(opsintree$tip.label,split="_"))[1]
}

#specify location of trees
#mydir<-('~/Dropbox/Dave_Shared/cnidarian_trees/')
mydir<-('/Users/curtisprovencher/Dropbox/DaveShare/cnidarian_trees/premise')
getwd()

mytrees<-dir(mydir, pattern='.tre')

#run function on specified trees
for (t in 1:length(mytrees)) {
  dostuff(sometree=mytrees[t])
}

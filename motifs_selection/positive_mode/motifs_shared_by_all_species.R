Motif_MN_network_pos_nodetable <- read.csv("Motif_MN_network_pos_nodetable.csv")
library(dplyr)
data_nodes<- as.data.frame(Motif_MN_network_pos_nodetable)
data_nodes<- data_nodes %>% select(componentindex, G1,G2,G3,G4,G5,G6)

#transform all non_zero values to 1
data_nodes[-1] <- as.integer(data_nodes[-1] != 0)

#keep component indexes that has at least one from all species 
data_filter<- filter(data_nodes, G1=='1' & G2=='1'& G3=='1'& G4=='1'& G5=='1'& G6=='1')
datafilter_c <- data_filter$componentindex
data_f<- data_nodes[which(data_nodes$componentindex %in% datafilter_c),]

#count nodes and select families with more than 4 nodes
u<- count(data_f, componentindex)
fam_four<- filter(u,n>=4)
data_imp<-data_f[which(data_f$componentindex %in% fam_four$componentindex),]


#import edge table
Motif_MN_pos_edgetable <- read.csv("Motif_MN_pos_edgetable.csv")
data_edges<- as.data.frame(Motif_MN_pos_edgetable)
dataset_edge<- data_edges %>% select(ComponentIndex,TopSharedMotifs)
dataset_edge <- dataset_edge[-which(dataset_edge$TopSharedMotifs==''),]

data_new<-dataset_edge[which(dataset_edge$ComponentIndex %in% data_imp$componentindex),]
names(data_new)[names(data_new) == "ComponentIndex"] <- "Molecular Family"
names(data_new)[names(data_new) == "TopSharedMotifs"] <- "Motifs"
data_imp_un<- unique(data_new)
write.csv(as_tibble(data_imp_un), file = "topmotifs_in_all_species_positive.csv")



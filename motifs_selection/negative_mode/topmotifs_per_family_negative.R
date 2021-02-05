MS2LDA_MN_negative_node_table_integrated <- read.csv("~/Desktop/BioInfo/internship_01/data/gnps output/negative/MS2LDA_updated/ProteoSAFe-MS2LDA_MOTIFDB-313db2ab-download_cytoscape_data/MS2LDA_MN_negative_node_table_integrated.csv")

dataset<- as.data.frame(MS2LDA_MN_negative_node_table_integrated)

library(dplyr)
data_nodes<- dataset %>% select(componentindex, G1,G2,G3,G4,G5,G6)
#transform all non_zero values to 1
data_nodes[-1] <- as.integer(data_nodes[-1] != 0)

#select column G1
data_nodes_G1<- data_nodes %>% select(componentindex, G1)

data_filter<- filter(data_nodes_G1, G1=='0')
datafilter_c <- data_filter$componentindex
data_G1<- data_nodes[which(!data_nodes_G1$componentindex %in% datafilter_c),]

#count nodes and select families with more than 4 nodes
dataset_c<- count(data_G1, componentindex)
fam_four<- filter(dataset_c,n>=4)
fam_four<-data_G1[which(data_G1$componentindex %in% fam_four$componentindex),]

#insert edge table
MS2LDA_MN_negative_edge_table <- read.csv("~/Desktop/BioInfo/internship_01/data/gnps output/negative/MS2LDA_updated/ProteoSAFe-MS2LDA_MOTIFDB-313db2ab-download_cytoscape_data/MS2LDA_MN_negative_edge_table.csv")
data_edges<- as.data.frame(MS2LDA_MN_negative_edge_table)
dataset_edge<- data_edges %>% select(ComponentIndex,TopSharedMotifs)
dataset_edge <- dataset_edge[-which(dataset_edge$TopSharedMotifs==''),]

data_imp<-dataset_edge[which(dataset_edge$ComponentIndex %in% fam_four$componentindex),]
family_G1<- unique(data_imp)
write.csv(as_tibble(family_G1), file = "BLB_negative_topmotifs.csv")

#select column G2
data_nodes_G2<- data_nodes %>% select(componentindex, G2)

data_filter<- filter(data_nodes_G2, G2=='0')
datafilter_c <- data_filter$componentindex
data_G2<- data_nodes[which(!data_nodes$componentindex %in% datafilter_c),]

#count nodes and select families with more than 4 nodes
dataset_c<- count(data_G2, componentindex)
fam_four<- filter(dataset_c,n>=4)
fam_four<-data_G2[which(data_G2$componentindex %in% fam_four$componentindex),]

data_imp<-dataset_edge[which(dataset_edge$ComponentIndex %in% fam_four$componentindex),]
family_G2<- unique(data_imp)
write.csv(as_tibble(family_G2), file = "HJT_negative_topmotifs.csv")

#select column G3
data_nodes_G3<- data_nodes %>% select(componentindex, G3)

data_filter<- filter(data_nodes_G3, G3=='0')
datafilter_c <- data_filter$componentindex
data_G3<- data_nodes[which(!data_nodes$componentindex %in% datafilter_c),]

#count nodes and select families with more than 4 nodes
dataset_c<- count(data_G3, componentindex)
fam_four<- filter(dataset_c,n>=4)
fam_four<-data_G3[which(data_G3$componentindex %in% fam_four$componentindex),]

data_imp<-dataset_edge[which(dataset_edge$ComponentIndex %in% fam_four$componentindex),]
family_G3<- unique(data_imp)
write.csv(as_tibble(family_G3), file = "JAM_negative_topmotifs.csv")

#select column G4
data_nodes_G4<- data_nodes %>% select(componentindex, G4)

data_filter<- filter(data_nodes_G4, G4=='0')
datafilter_c <- data_filter$componentindex
data_G4<- data_nodes[which(!data_nodes$componentindex %in% datafilter_c),]

#count nodes and select families with more than 4 nodes
dataset_c<- count(data_G4, componentindex)
fam_four<- filter(dataset_c,n>=4)
fam_four<-data_G4[which(data_G4$componentindex %in% fam_four$componentindex),]

data_imp<-dataset_edge[which(dataset_edge$ComponentIndex %in% fam_four$componentindex),]
family_G4<- unique(data_imp)
write.csv(as_tibble(family_G4), file = "VER_negative_topmotifs.csv")

#select column G5
data_nodes_G5<- data_nodes %>% select(componentindex, G5)

data_filter<- filter(data_nodes_G5, G5=='0')
datafilter_c <- data_filter$componentindex
data_G5<- data_nodes[which(!data_nodes$componentindex %in% datafilter_c),]

#count nodes and select families with more than 4 nodes
dataset_c<- count(data_G5, componentindex)
fam_four<- filter(dataset_c,n>=4)
fam_four<-data_G5[which(data_G5$componentindex %in% fam_four$componentindex),]

data_imp<-dataset_edge[which(dataset_edge$ComponentIndex %in% fam_four$componentindex),]
family_G5<- unique(data_imp)
write.csv(as_tibble(family_G5), file = "STO_negative_topmotifs.csv")

#select column G6
data_nodes_G6<- data_nodes %>% select(componentindex, G6)

data_filter<- filter(data_nodes_G6, G6=='0')
datafilter_c <- data_filter$componentindex
data_G6<- data_nodes[which(!data_nodes$componentindex %in% datafilter_c),]

#count nodes and select families with more than 4 nodes
dataset_c<- count(data_G6, componentindex)
fam_four<- filter(dataset_c,n>=4)
fam_four<-data_G6[which(data_G6$componentindex %in% fam_four$componentindex),]

data_imp<-dataset_edge[which(dataset_edge$ComponentIndex %in% fam_four$componentindex),]
family_G6<- unique(data_imp)
write.csv(as_tibble(family_G6), file = "Innovator_negative_topmotifs.csv")




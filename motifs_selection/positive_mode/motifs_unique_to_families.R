library(dplyr)
library(tidyr)
Motif_MN_pos_edgetable <- read.csv("Motif_MN_pos_edgetable.csv")

edges<-as.data.frame(Motif_MN_pos_edgetable)
dataset_edge<- edges %>% select(ComponentIndex,TopSharedMotifs)
dataset_edge <- dataset_edge[-which(dataset_edge$TopSharedMotifs==''),]

#count nodes and select families with more than 4 nodes
dataset_c<- count(dataset_edge, ComponentIndex)
fam_four<- filter(dataset_c,n>=4)
data_imp<-dataset_edge[which(dataset_edge$ComponentIndex %in% fam_four$ComponentIndex),]


#move motifs after comma in different rows
u<- separate(data_imp, TopSharedMotifs, into=c('A','B'), sep = ',', extra = "drop", fill = "right")
u_A<- u%>% select(ComponentIndex,A)
names(u_A)[names(u_A) == "A"] <- "Motifs"
u_B<- u%>% select(ComponentIndex,B)
names(u_B)[names(u_B) == "B"] <- "Motifs"
u_join<- rbind(u_A,u_B)

#filter unique motifs based on families
data_unique<- u_join %>% group_by(ComponentIndex) %>% distinct(Motifs)
data_unique<- data_unique[complete.cases(data_unique), ]
data_unique<- data_unique[!(duplicated(data_unique[,2]) | duplicated(data_unique[,2], fromLast = TRUE)), ]

#change column names
names(data_unique)[names(data_unique) == "ComponentIndex"] <- "Molecular Family"

#save table
write.csv(as_tibble(data_unique), file = "unique_motifs_positive.csv")







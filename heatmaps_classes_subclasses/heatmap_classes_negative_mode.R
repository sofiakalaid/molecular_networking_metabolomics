molnetenhancer_negative_table <- read.csv("MolNetEnhancer_negative_table.csv")
data_neg<- as.data.frame(molnetenhancer_negative_table)
library(dplyr)

data_2<- data_neg %>% select(CF_class, G1,G2,G3,G4,G5,G6) 
data_2<- data_2 %>% group_by(CF_class) %>% summarise_all(list(sum))
names(data_2)[names(data_2) == "G1"] <- "BLB"
names(data_2)[names(data_2) == "G2"] <- "HJT"
names(data_2)[names(data_2) == "G3"] <- "JAM"
names(data_2)[names(data_2) == "G4"] <- "VER"
names(data_2)[names(data_2) == "G5"] <- "STO"
names(data_2)[names(data_2) == "G6"] <- "Innovator"
data_2
ungroup(data_2)
data_m<- as.matrix(data_2[,-1])
logdata<- log(1+data_m)
datamean<- rowMeans(logdata)
datatr = apply(logdata,1,sd)
data_trans = sweep(logdata,1,datamean,FUN = "-")
data_t = sweep(data_trans,1,sqrt(datatr),FUN = "/")

rownames(data_t) <- data_2$CF_class

library(ComplexHeatmap)
png(filename='heatmap_classes_enrichment_negative_mode.png',width = 980, height = 980)

Heatmap(data_t, row_names_gp  = gpar(fontsize = 13), column_names_gp  = gpar(fontsize = 20)) # Text size for row names

dev.off()



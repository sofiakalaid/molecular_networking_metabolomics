Molnetenhancer_table_centroided <- read.csv("MolNetEnhancer_positive_table.csv")
data_pos<- as.data.frame(Molnetenhancer_table_centroided)
library(dplyr)
data_2<- data_pos %>% select(CF_subclass, G1,G2,G3,G4,G5,G6) 
data_2<- data_2 %>% group_by(CF_subclass) %>% summarise_all(list(sum))
names(data_2)[names(data_2) == "G1"] <- "BLB"
names(data_2)[names(data_2) == "G2"] <- "HJT"
names(data_2)[names(data_2) == "G3"] <- "JAM"
names(data_2)[names(data_2) == "G4"] <- "VER"
names(data_2)[names(data_2) == "G5"] <- "STO"
names(data_2)[names(data_2) == "G6"] <- "Innovator"
ungroup(data_2)
data_m<- as.matrix(data_2[,-1])
logdata<- log(1+data_m)
datamean<- rowMeans(logdata)
datatr = apply(logdata,1,sd)
data_trans = sweep(logdata,1,datamean,FUN = "-")
data_t = sweep(data_trans,1,sqrt(datatr),FUN = "/")

rownames(data_t) <- data_2$CF_subclass
data_t <- na.omit(data_t)
library(ComplexHeatmap)
png(filename='heatmap_subclasses_enrichment_positive_mode.png',width = 800, height = 800)

Heatmap(data_t,na_col = 'black' ,row_names_gp  = gpar(fontsize = 8), column_names_gp  = gpar(fontsize = 20)) # Text size for row names

dev.off()


### Group BY ###
library(biomaRt)
library(dplyr)
setwd('C:/Jessica_Shea_Lab/Processed_Data/New_Analysis_03282022/')
### Before this step, load into MATLAB/or strip the columns to just contain gene name and gene count
genes_sample_83 <- read.csv('sample83_preprocessed.csv')
gene_sample_36 <- read.csv('sample36_preprocessed.csv')
gene_sample_37 <- read.csv('sample37_preprocessed.csv')
gene_sample_78 <- read.csv('sample78_preprocessed.csv')
gene_sample_79 <- read.csv('sample79_preprocessed.csv')
gene_sample_81 <- read.csv('sample81_preprocessed.csv')
################################################################################
write.csv(genes_sample_83,"gene_count_matrix_sample_83.csv")## Load this into MATLAB "Gene Counts"
write.csv(gene_sample_36,"gene_count_matrix_sample_36.csv")## Load this into MATLAB "Gene Counts"
write.csv(gene_sample_37,"gene_count_matrix_sample_37.csv")## Load this into MATLAB "Gene Counts"
write.csv(gene_sample_78,"gene_count_matrix_sample_78.csv")## Load this into MATLAB "Gene Counts"
write.csv(gene_sample_79,"gene_count_matrix_sample_79.csv")## Load this into MATLAB "Gene Counts"
write.csv(gene_sample_81,"gene_count_matrix_sample_81.csv")## Load this into MATLAB "Gene Counts"

################################################################################
#gene_counts_sample <- aggregate(x=genes_sample$Counts,
               by = list(genes_sample$external_gene_name),
               FUN = sum)
#idx <- gene_counts_sample$x > 0
################################################################################

################################################################################

### biomaRt ####################################################################
View(listAttributes(mart))
mart= useMart(biomart="ensembl",dataset="hsapiens_gene_ensembl")
genes_36<- as.character(gene_sample_36[,1])
genes_37<- as.character(gene_sample_37[,1])
genes_78<- as.character(gene_sample_78[,1])
genes_79<- as.character(gene_sample_79[,1])
genes_81<- as.character(gene_sample_81[,1])
genes_83<- as.character(genes_sample_83[,1])

View(genes)
gene_positions_36<-getBM(attributes=c('start_position','end_position',
                                   'external_gene_name'),
      filters = "external_gene_name",
      values = genes_36,
      mart = mart)

####
gene_positions_37<-getBM(attributes=c('start_position','end_position',
                                      'external_gene_name'),
                         filters = "external_gene_name",
                         values = genes_37,
                         mart = mart)
###
gene_positions_36<-getBM(attributes=c('start_position','end_position',
                                      'external_gene_name'),
                         filters = "external_gene_name",
                         values = genes_78,
                         mart = mart)
###
gene_positions_78<-getBM(attributes=c('start_position','end_position',
                                      'external_gene_name'),
                         filters = "external_gene_name",
                         values = genes_78,
                         mart = mart)
###
gene_positions_79<-getBM(attributes=c('start_position','end_position',
                                      'external_gene_name'),
                         filters = "external_gene_name",
                         values = genes_79,
                         mart = mart)
gene_positions_81<-getBM(attributes=c('start_position','end_position',
                                      'external_gene_name'),
                         filters = "external_gene_name",
                         values = genes_81,
                         mart = mart)
gene_positions_83<-getBM(attributes=c('start_position','end_position',
                                      'external_gene_name'),
                         filters = "external_gene_name",
                         values = genes_83,
                         mart = mart)
################################################################################
View(gene_positions_36)
gene_positions_36[,4] <- gene_positions_36[,2] - gene_positions_36[,1]
gene_positions_37[,4] <- gene_positions_37[,2] - gene_positions_37[,1]
gene_positions_78[,4] <- gene_positions_78[,2] - gene_positions_78[,1]
gene_positions_79[,4] <- gene_positions_79[,2] - gene_positions_79[,1]
gene_positions_81[,4] <- gene_positions_81[,2] - gene_positions_81[,1]
gene_positions_83[,4] <- gene_positions_83[,2] - gene_positions_83[,1]



View(gene_positions)
################################################################################

write.csv(gene_positions_36,'Sample36_with_GeneLength.csv') ### Load this into MATLAB "Gene Positions"
write.csv(gene_positions_37,'Sample37_with_GeneLength.csv') ### Load this into MATLAB "Gene Positions"
write.csv(gene_positions_78,'Sample78_with_GeneLength.csv') ### Load this into MATLAB "Gene Positions"
write.csv(gene_positions_79,'Sample79_with_GeneLength.csv') ### Load this into MATLAB "Gene Positions"
write.csv(gene_positions_81,'Sample81_with_GeneLength.csv') ### Load this into MATLAB "Gene Positions"
write.csv(gene_positions_83,'Sample83_with_GeneLength.csv') ### Load this into MATLAB "Gene Positions"


################################################################################


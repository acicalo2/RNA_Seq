### Processed Data
setwd('C:/Jessica_Shea_Lab/Processed_Data/New_Analysis_03282022/pre_tpm_calc/')
sample83 <- read.csv('Sample83_genecount_matrix_length.csv')
View(sample79)
sample83_counts <- sample83$Counts
sample83_geneLength<-sample83$Gene_Length
# Create a TPM matrix by dividing each column of the counts matrix by estimate of gene length

x<- sample83_counts/ sample83_geneLength
x<-as.matrix(x)

tpm <- t (t(x)*1e6 / colSums(x))

sample83$tpm <- tpm
View(sample79)
write.csv(sample83,'sample83_w_TPM.csv')

library("biomaRt")
library("writexl")
Transcripts_IDs_Versions <- c(IR_ID)
Transcripts_IDs <- c(Transcript_ID_Versions_BJSAMPLE1)

Transcripts <- as.list(Transcripts_IDs_Versions)

ensembl <- useEnsembl(biomart = "ensembl",dataset="hsapiens_gene_ensembl",mirror="useast")

t = getBM(attributes = c('ensembl_transcript_id_version','ensembl_gene_id',"external_gene_name"),
      filters = 'ensembl_transcript_id_version',
      values = Transcripts,
      mart = ensembl)

write_xlsx(t,"RNA_Seq_IR.xlsx")
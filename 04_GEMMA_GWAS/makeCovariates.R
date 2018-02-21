library(data.table)
PCA <- fread("/home/angela/px_his_chol/QC/16_smartpca_input.evec", sep = " ") #smartPCA evec file
  #Warning message:
  #In fread("/home/angela/px_his_chol/QC/16_smartpca_input.evec", sep = " ") :
  #Starting data input on line 2 and discarding line 1 because it has too few or too many items to be column names or data:            #eigvals:   292.510   139.941    29.627    10.342     9.919     7.679     7.085     6.257     5.846     5.589 
PCA$V1 <- gsub(".*:", "", PCA$V1)
  #Removes the FID, which is before the :
PCA$V12 <- NULL
samples <- fread("/home/angela/px_his_chol/GEMMA/BIMBAM/samples.txt", header = F) #PrediXcan dosages samples.txt file
colnames(samples) <- c("FID", "IID")
colnames(PCA) <- c("IID", "PCA1", "PCA2", "PCA3", "PCA4", "PCA5", "PCA6", "PCA7", "PCA8", "PCA9", "PCA10")
PCA_ordered <- left_join(samples, PCA)
PCA_ordered$FID <- 1
  #"must contain a column of 1's if one wants to include an intercept
PCA_ordered$IID <- NULL
fwrite(PCA_ordered, "/home/angela/px_his_chol/GEMMA/covariates.txt", col.names = F, row.names = F, sep = " ")

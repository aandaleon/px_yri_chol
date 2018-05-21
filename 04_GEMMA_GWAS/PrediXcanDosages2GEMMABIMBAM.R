#converts PrediXcan dosage format to GEMMA BIMBAM input format
"%&%" = function(a,b) paste(a,b,sep="")
library(data.table)

for(i in 1:22){
  geno <- read.table('zcat /home/angela/px_his_chol/Imputation/UMich/UMich_dosages/chr' %&% i %&% '.maf0.01.r20.8.dosage.txt.gz')
  geno$V1 <- NULL
  geno$V3 <- NULL
  geno$V6 <- NULL #column for MAF
  geno$V4 <- substr(geno$V4, 0, 1) #only one allele for minor and major
  geno$V5 <- substr(geno$V5, 0, 1)
  
  #for(j in 4:(length(geno))){ #if any value is above 2 or below 0, replace value w/ NA (which was apparently not the problem)
  #  geno[[j]] <- ifelse(geno[[j]] > 2 | geno[[j]] < 0, "NA", geno[[j]])
  #}

  fwrite(geno, '/home/angela/px_his_chol/GEMMA/BIMBAM/chr' %&% i %&% '.txt', row.names = F, col.names = F, quote = F, sep = " ")
  zip <- 'gzip /home/angela/px_his_chol/GEMMA/BIMBAM/chr' %&% i %&% '.txt'
  system(zip)
}

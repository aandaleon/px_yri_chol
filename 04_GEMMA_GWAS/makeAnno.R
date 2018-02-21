"%&%" = function(a,b) paste(a,b,sep="")
library(data.table)
  #throws "Error in fread(dosage) : mmap'd region has EOF at the end" so must use read.table

for(i in 1:22){
  dosage <- "/home/angela/px_his_chol/Imputation/UMich/UMich_dosages/chr" %&% i %&% ".maf0.01.r20.8.dosage.txt.gz"
  getDosage <- read.table(dosage)
  getDosage$V1 <- i
  keepAnno <- getDosage[,c("V2", "V3", "V1")]
  keepAnnoPath <- "/home/angela/px_his_chol/GEMMA/anno/anno" %&% i %&% ".txt"
  fwrite(keepAnno, keepAnnoPath, row.names = F, quote = F, col.names = F, sep = "\t")
}

#concat <- ("cat /home/angela/px_his_chol/GEMMA/anno/anno1.txt /home/angela/px_his_chol/GEMMA/anno/anno2.txt /home/angela/px_his_chol/GEMMA/anno/anno3.txt /home/angela/px_his_chol/GEMMA/anno/anno4.txt /home/angela/px_his_chol/GEMMA/anno/anno5.txt /home/angela/px_his_chol/GEMMA/anno/anno6.txt /home/angela/px_his_chol/GEMMA/anno/anno7.txt /home/angela/px_his_chol/GEMMA/anno/anno8.txt /home/angela/px_his_chol/GEMMA/anno/anno9.txt /home/angela/px_his_chol/GEMMA/anno/anno10.txt /home/angela/px_his_chol/GEMMA/anno/anno11.txt /home/angela/px_his_chol/GEMMA/anno/anno12.txt /home/angela/px_his_chol/GEMMA/anno/anno13.txt /home/angela/px_his_chol/GEMMA/anno/anno14.txt /home/angela/px_his_chol/GEMMA/anno/anno15.txt /home/angela/px_his_chol/GEMMA/anno/anno16.txt /home/angela/px_his_chol/GEMMA/anno/anno17.txt /home/angela/px_his_chol/GEMMA/anno/anno18.txt /home/angela/px_his_chol/GEMMA/anno/anno19.txt /home/angela/px_his_chol/GEMMA/anno/anno20.txt /home/angela/px_his_chol/GEMMA/anno/anno21.txt /home/angela/px_his_chol/GEMMA/anno/anno22.txt > /home/angela/px_his_chol/GEMMA/anno/fullAnno.txt")
#system(concat)

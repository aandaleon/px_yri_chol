#NOTE: EDIT FILE NAMES PATHS SO THEY ARE CURRENTLY ACCURATE

#QCStep0:
plink --bfile /home/wheelerlab1/Data/dbGaP_YRI_CHOL_height/CIDR_Dementia_AA_Yoruba_Top_subject_level_filtered --check-sex --out QCStep0
  ##Creates a .sexcheck file with F values (0 = female, 1 = male), resulting in 4 either inconclusive or missing altogether
  ###2379855 variants loaded from .bim file.
  ###1264 people (446 males, 818 females) loaded from .fam.
  ###Warning: 2330 het. haploid genotypes present
  ###Total genotyping rate is 0.991948.
  ###2379855 variants and 1264 people pass filters and QC.
  ###--check-sex: 35847 Xchr and 0 Ychr variant(s) scanned, 4 problems detected.
  ###Report written to QCStep0.sexcheck
  
#QCStep1:
plink --bfile /home/wheelerlab1/Data/dbGaP_YRI_CHOL_height/CIDR_Dementia_AA_Yoruba_Top_subject_level_filtered.chr1-22.noNAfrq --missing --out /home/angela/QCStep1 --check-sex
  ##Creates two files: .imiss (individual) and .lmiss (SNP/locus) that details missingness in data

#QCStep2:
plink --bfile /home/wheelerlab1/Data/dbGaP_YRI_CHOL_height/CIDR_Dementia_AA_Yoruba_Top_subject_level_filtered.chr1-22.noNAfrq --geno 0.01 --make-bed --out QCStep2

#QCStep3:
plink --bfile home/angela/QCStep2 --missing --out QCStep3

#QCStep4:
plink --bfile QCStep2 --hardy --out /home/angela/QCStep4/QCStep4

#QCStep5a:
plink --bfile QCStep2 --indep-pairwise 50 5 0.3 --out /home/angela/QCStep5/QCStep5

#QCStep5b:
plink --bfile /home/angela/QCStep2/QCStep2 --extract /home/angela/QCStep5/QCStep5a/QCStep5.prune.in --genome --min 0.05 --out /home/angela/QCStep5/QCStep5b

#At this point, create plots as instructed in https://github.com/WheelerLab/GWAS_QC/blob/master/example_pipelines/TCS_GWAS_QC/03_GWAS_QC_plots.html

#QCStep5c: (due to high relatedness in the population, exclude people with >0.25 relatedness)
plink --bfile /home/angela/QCStep2/QCStep2 --indep-pairwise 50 5 0.125 --out /home/angela/QCStep5/QCStep5c/QCStep5c

#QCStep5d:
plink --bfile /home/angela/QCStep2/QCStep2 --remove /home/angela/related.to.remove.txt --make-bed --out /home/angela/QCStep5/QCStep5d/QCStep5d

#QCStep5e:
plink --bfile /home/angela/QCStep5/QCStep5d/QCStep5d --het --extract /home/angela/QCStep5/QCStep5c/QCStep5c.prune.in --remove /home/angela/QCStep5/QCStep5d/related.to.remove.txt --out /home/angela/QCStep5/QCStep5e/QCStep5e

#At this point, continue to run analyses from https://github.com/WheelerLab/GWAS_QC/blob/master/example_pipelines/TCS_GWAS_QC/03_GWAS_QC_plots.html

#QCStep5f: make a new set of bfiles w/o >0.25 relatedness or +/-3 SD outliers
plink --bfile /home/angela/QCStep5/QCStep5d/QCStep5d --extract /home/angela/QCStep5/QCStep5c/QCStep5c.prune.in --remove /home/angela/QCStep5/QCStep5e/QCStep5e.txt --make-bed --out /home/angela/QCStep5/QCStep5f/QCStep5f

#NOTE: LOOK AT LOG FILES AND COPE RESULTS CAUSE YOU DIDN'T WRITE THIS DOWN ORIGINALLY

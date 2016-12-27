#NOTE: EDIT FILE NAMES PATHS SO THEY ARE CURRENTLY ACCURATE
  
#QCStep1:
plink --bfile /home/wheelerlab1/Data/dbGaP_YRI_CHOL_height/CIDR_Dementia_AA_Yoruba_Top_subject_level_filtered.chr1-22.noNAfrq --missing --out /home/angela/QC/QCStep1/QCStep1
  ##Creates two files: .imiss (individual) and .lmiss (SNP/locus) that details missingness in data
  ###1581500 variants loaded from .bim file.
  ###1264 people (446 males, 818 females) loaded from .fam.
  ###Total genotyping rate is 0.998341
  ###--missing: Sample missing data report written to /home/angela/QCStep1.imiss, and variant-based missing data report written to /home/angela/QCStep1.lmiss.
  ###1581500 variants and 1264 people pass filters and QC.

#QCStep2a:
plink --bfile /home/wheelerlab1/Data/dbGaP_YRI_CHOL_height/CIDR_Dementia_AA_Yoruba_Top_subject_level_filtered.chr1-22.noNAfrq --geno 0.01 --make-bed --out bfile /home/angela/QC/QCStep2/QCStep2a
  ##Recalculates individual call rates after removing SNPs with call rates <99% and creates new set of binary files
  ###1522836 variants loaded from .bim file.
  ###1264 people (446 males, 818 females) loaded from .fam.
  ###58664 variants removed due to missing genoype data (--geno).
  ###--make-bed to QCStep2.bed + QCStep2.bim + QCStep2.fam ... done
  ###1522836 variants and 1264 people pass filters and QC.

#QCStep2b:
plink --bfile /home/angela/QC/QCStep2/QCStep2a --recode --out /home/angela/QC/QCStep2/QCStep2b 
  ##Creates .map and .ped files of data
  ###1522836 variants loaded from .bim file.
  ###1264 people (446 males, 818 females) loaded from .fam.
  ###Total genotyping rate is 0.999244
  ###1522836 variants and 1264 people pass filters and QC.

#QCStep3:
plink --bfile /home/angela/QCStep2/QCStep2a --missing --out /home/angela/QC/QCStep3/QCStep3
  ##Creates two files: .imiss (individual) and .lmiss (SNP/locus) that details missingness in data
  ###1522836 variants loaded from .bim file.
  ###1264 people (446 males, 818 females) loaded from .fam.
  ###Total genotyping rate is 0.999244.
  ###--missing: Sample missing data report written to QCStep3.imiss, and variant-based missing data report written to QCStep3.lmiss.

#QCStep4:
plink --bfile /home/angela/QC/QCStep2/QCStep2a --hardy  --out /home/angela/QC/QCStep4/QCStep4
  ##Calculates Hardy-Weinberg statistics for each SNP using founders (in this cohort, only 9 are available) in a .hwe file.
  ##No SNP in .hwe reached Bonferroni significance
  ###1522836 variants loaded from .bim file.
  ###1264 people (446 males, 818 females) loaded from .fam.
  ###Total genotyping rate is 0.999244.
  ###--hardy: Writing Hardy-Weinberg report (founders only) to /home/angela/QCStep4/QCStep4.hwe ... done.

#QCStep5a:
plink --bfile /home/angela/QC/QCStep2/QCStep2a --indep-pairwise 50 5 0.3 --out /home/angela/QC/QCStep5/QCStep5a/QCStep5a
  ##Creates a pruned list of SNP IDs for plotting on a principal components analysis
  ##Linkage disequilibrium set to 0.3 instead of 0.2 because of African cohort
  ###1522836 variants loaded from .bim file.
  ###1264 people (446 males, 818 females) loaded from .fam.
  ###Total genotyping rate is 0.999244.
  ###Pruned 109556 variants from chromosome 1, leaving 9958.
  ###Pruned 116601 variants from chromosome 2, leaving 10340.
  ###Pruned 98545 variants from chromosome 3, leaving 8677.
  ###Pruned 92595 variants from chromosome 4, leaving 8293.
  ###Pruned 87304 variants from chromosome 5, leaving 7834.
  ###Pruned 92736 variants from chromosome 6, leaving 8267.
  ###Pruned 77928 variants from chromosome 7, leaving 6997.
  ###Pruned 76304 variants from chromosome 8, leaving 6820.
  ###Pruned 63075 variants from chromosome 9, leaving 5726.
  ###Pruned 71511 variants from chromosome 10, leaving 6536.
  ###Pruned 69699 variants from chromosome 11, leaving 6329.
  ###Pruned 66934 variants from chromosome 12, leaving 6126.
  ###Pruned 51034 variants from chromosome 13, leaving 4684.
  ###Pruned 46613 variants from chromosome 14, leaving 4237.
  ###Pruned 44148 variants from chromosome 15, leaving 4072.
  ###Pruned 46250 variants from chromosome 16, leaving 4332.
  ###Pruned 39306 variants from chromosome 17, leaving 3761.
  ###Pruned 43133 variants from chromosome 18, leaving 4027.
  ###Pruned 27304 variants from chromosome 19, leaving 2693.
  ###Pruned 34960 variants from chromosome 20, leaving 3272.
  ###Pruned 20072 variants from chromosome 21, leaving 1918.
  ###Pruned 20401 variants from chromosome 22, leaving 1928.
  ###Pruning complete.  1396009 of 1522836 variants removed.
  ###1522836 variants and 1264 people pass filters and QC.
  ###Marker lists written to /home/angela/QC/QCStep5/QCStep5.prune.in and /home/angela/QC/QCStep5/QCStep5.prune.out

#QCStep5b:
plink --bfile /home/angela/QC/QCStep2/QCStep2 --extract /home/angela/QC/QCStep5/QCStep5a/QCStep5a.prune.in --genome --min 0.25 --out /home/angela/QC/QCStep5/QCStep5b/QCStep5b
  ##Extracts the SNPs from QCStep5a into a .genome file using an identity-by-descent threshold of 0.25 relatedness for plotting
  ##0.25 was used due to the high degree of relatedness within the cohort.
  ##Also, create a list of individuals to remove due to relatedness
  ###1522836 variants loaded from .bim file.
  ###1264 people (446 males, 818 females) loaded from .fam.
  ###--extract: 126827 variants remaining.
  ###Total genotyping rate is 0.999174.
  ###126827 variants and 1264 people pass filters and QC.
  ###IBD calculations complete.
  ###Finished writing /home/angela/QC/QCStep5/QCStep5b/QCStep5b.genome .

#At this point, create plots as instructed in https://github.com/WheelerLab/GWAS_QC/blob/master/example_pipelines/TCS_GWAS_QC/03_GWAS_QC_plots.html

#QCStep5c:
plink --bfile /home/angela/QC/QCStep2/QCStep2a --het --out /home/angela/QC/QCStep5/QCStep5c/QCStep5c
  ##Creates .het file of inbreeding coefficients for plotting
  ###1522836 variants loaded from .bim file.
  ###1264 people (446 males, 818 females) loaded from .fam.
  ###Total genotyping rate is 0.999244.
  ###1522836 variants and 1264 people pass filters and QC.
  ###--het: 1522836 variants scanned, report written to /home/angela/QCStep5/QCStep5c/.het .

#QCStep5d:
plink --bfile /home/angela/QC/QCStep2/QCStep2a --remove /home/angela/QC/QCStep5/QCStep5d/related.to.remove.txt --make-bed --out /home/angela/QC/QCStep5/QCStep5d/QCStep5d
  ##Removes individuals with >0.25 relatedness and creates new binary files without them
  ###1522836 variants loaded from .bim file.
  ###1264 people (446 males, 818 females) loaded from .fam.
  ###--remove: 1189 people remaining.
  ###Total genotyping rate in remaining samples is 0.999246.
  ###1522836 variants and 1189 people pass filters and QC.
  ###--make-bed to /home/angela/QC/QCStep5/QCStep5d/QCStep5d.bed + /home/angela/QC/QCStep5/QCStep5d/QCStep5d.bim + /home/angela/QC/QCStep5/QCStep5d/QCStep5d.fam ... done.

#QCStep5e:
plink --bfile /home/angela/QC/QCStep5/QCStep5d/QCStep5d --extract /home/angela/QC/QCStep5/QCStep5a/QCStep5a.prune.in --remove /home/angela/QC/QCStep5/QCStep5d/related.to.remove.txt --out /home/angela/QC/QCStep5/QCStep5e/QCStep5e
  ##Combines the last few steps and checks heterozygosity
  ##Create a list of individuals with more than 3 standard deviations from the mean
  ###1522836 variants loaded from .bim file.
  ##1189 people (408 males, 781 females) loaded from .fam.
  ###--extract: 126827 variants remaining.
  ###Total genotyping rate is 0.999137.
  ###126827 variants and 1189 people pass filters and QC.
  ###--het: 126827 variants scanned, report written to /home/angela/QCStep5/QCStep5e/QCStep5e.het .

#At this point, continue to run analyses from https://github.com/WheelerLab/GWAS_QC/blob/master/example_pipelines/TCS_GWAS_QC/03_GWAS_QC_plots.html

#QCStep5f: 
plink --bfile /home/angela/QC/QCStep5/QCStep5d/QCStep5d --extract /home/angela/QC/QCStep5/QCStep5a/QCStep5a.prune.in --remove /home/angela/QC/QCStep5/QCStep5d/3SD.txt --make-bed --out /home/angela/QC/QCStep5/QCStep5f/QCStep5f
  ##Makes a new set of bfiles w/o >0.25 relatedness or +/-3 SD outliers
  ###1522836 variants loaded from .bim file.
  ###1189 people (408 males, 781 females) loaded from .fam.
  ###--extract: 52694 variants remaining.
  ###--remove: 1184 people remaining.
  ###Total genotyping rate is 0.999137.
  ###126827 variants and 1184 people pass filters and QC.
  ###--make-bed to /home/angela/QCStep5/QCStep5f/QCStep5f.bed + /home/angela/QCStep5/QCStep5f/QCStep5f.bim + /home/angela/QCStep5/QCStep5f/QCStep5f.fam ... done.

#NOTE: LOOK AT LOG FILES AND COPY RESULTS CAUSE YOU DIDN'T WRITE THIS DOWN ORIGINALLY



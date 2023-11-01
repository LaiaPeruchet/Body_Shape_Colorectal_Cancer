
# Mendelian Randomization Analysis - Body Shape Phenotypes -> Colorectal cancer

## Load the file with summary data for the body shape phenotype and colorectal cancer
### In this, there are 
### Genetic variants that surpass the 10^-8 threshold for each body shape and their match in GECCO consortium summary statistics


## Selection of columns of interest: Genetic variant ID, effect and reference alleles, effect sizes and standard errors
data <- MR_file[,c("SNP", "A1", "A0", "BETA", "SE", "ALT", "REF", "ES", "SE_2")]

## We create a variable of the effect size of the outcome to harmonize the alleles
data$Beta.cor <-data$BETA

## Harmonize effect and non-effect alleles

sign <- function(){ 
  for (i in 1:length(data$A1)){
    if (data$A1[i] != data$ALT[i])
      data$Beta.cor[i]<-data$ES[i]*(-1)
  }
  return(data)
}

MR_FINAL<-sign()


## MR

library(MendelianRandomization)

bx.all <- as.vector(MR_FINAL$BETA)
bxse.all <- as.vector(MR_FINAL$SE)
by.all <- as.vector(MR_FINAL$Beta.cor)
byse.all <- as.vector(MR_FINAL$SE_2)

MRObject = mr_input(bx=bx.all, bxse = bxse.all, by=by.all, byse=byse.all)
mr_allmethods(MRObject)

### By formula

mr_ivw(MRObject, model = "random")
mr_egger(MRObject)
mr_median(MRObject)

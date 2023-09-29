
#This code has been adapted from the BOLT-LMM v2.4.1 User Manual available at: https://alkesgroup.broadinstitute.org/BOLT-LMM/BOLT-LMM_manual.html

/home/BOLT-LMM_v2.3.5/bolt \
    --bed=ukb_chr{1:22}.bed \
    --bim=ukb_chr{1:22}.bim \
    --fam=ukb_fam_file.fam \
    --phenoFile=Phenotypes_BOLT.txt \
    --phenoCol=PC1 \
    --covarFile=covariates.txt \
    --covarCol=sex \
    --covarCol=batch \
    --covarMaxLevels=108 \
    --qCovarCol=age \
    --qCovarCol=age_sq \
    --qCovarCol=PC{1:10} \
    --lmm \
    --numLeaveOutChunks 2 \
    --LDscoresFile=tables/LDSCORE.1000G_EUR.tab.gz \
    --numThreads=8 \
    --bgenMinMAF=0.01 \
    --bgenMinINFO=0.1 \
    --statsFile=Body_shape_1.stats.gz \
    --bgenFile=ukb_imp_chr{1:22}.bgen \
    --sampleFile=sample_file.sample \
    --statsFileBgenSnps=Body_shape_1.bgen.stats.gz \
    --verboseStats \

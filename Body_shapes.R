
# Body Shape Phenotypes

## Load data and select the variables of interest
pheno_data <- data[,c("id", "age_rec", "sex", "centre", "Height", "Weight", "BMI", "Waist", "Hip", "WHR")]
pheno_data_na <- na.omit(pheno_data) #Remove missing values

## Principal component analysis (PCA)
pca1 <- select(pheno_data_na, Height, Weight, BMI, age_rec, sex, centre, id)
pca2 <- select(pheno_data_na, Hip, Waist, WHR, age_rec, sex, centre, id)
pca2 <- pca2[complete.cases(pca2),]

## Obtain stansardized residuals
height <- lm(Height ~ age_rec + sex + centre, data = pca1)
pca1$res.height <- rstandard(height)

weight <- lm(Weight ~ age_rec + sex + centre, data = pca1)
pca1$res.weight <- rstandard(weight)

bmi <- lm(BMI ~ age_rec + sex + centre, data = pca1)
pca1$res.bmi <- rstandard(bmi)

hip <- lm(Hip ~ age_rec + sex + centre, data = pca2)
pca2$res.hip <- rstandard(hip)

waist <- lm(Waist ~ age_rec + sex + centre, data = pca2)
pca2$res.waist <- rstandard(waist)

whr <- lm(WHR ~ age_rec + sex + centre, data = pca2)
pca2$res.whr <- rstandard(whr)

## Left join of pc1 and pc2
pca <- left_join(pca1, pca2[c("id", "res.hip", "res.waist", "res.whr", "Hip", "Waist", "WHR")], by="id")
summary(pca$res.bmi)

## Complete case PCA
pca_complete <- pca[complete.cases(pca),]
results <- prcomp(pca_complete[,8:13], scale. = T, center = T)

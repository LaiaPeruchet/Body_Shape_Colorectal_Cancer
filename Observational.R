# Observational Analysis - Body Shape Phenotypes -> Colorectal cancer

## Load the file with the information on colorectal cancer cases

table(cc_data_crc$colorectal)

dd <- datadist(cc_data_crc)
options(datadist='dd')

## Example of Cox regression
### Model was adjusted by socio-demographic and lifestyle factors as well as medication, 
###family history of colorectal cancer and bowel cancer screening

a <- cph(Surv(age, age_exit, colorectal) ~ PC1_win + ethnic6 + townsend_deprivation_index + nsaid +
           educat4 + smoke_stat + METminweekTotal + SBTotal + score_diet +  alc_int_freq + milk_intake +
           hormone_therapy + family_hist_crc +
           bowel_cancer_screening + 
           strat(center) + strat(age_5ygr) + strat(sex), cc_data_crc, x=T, y=T)

pred_a <- Predict(a, PC1_win, fun=exp)
anova(a)
zph <- cox.zph(a)  

summary(a, PC1_win=c(0, 1))

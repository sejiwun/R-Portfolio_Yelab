#' ---
#' title: "APOE4 Project"
#' output:
#'   html_document:
#'     keep_md: yes
#' ---

install.packages(c("survival", "survminer"))
library("survival")
library("survminer")


df <- readRDS("C:/Users/ejiwu/OneDrive/Desktop/Ye Lab/APOE4xFO/dementia_pheno_APOE4_model1_357631_masked.rds")

summary(df)
#head(df)
#tail(df)


#METHODS
#Association btw FO and each type of Dementia adjusted by age, sex and 10PC

ACD_cox <- coxph(Surv(as.integer(df$deltatime_allcause), as.integer(df$alltype_dementia)) ~ 
                   Fish_oil_baseline + age + sex + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + 
                   PC8 + PC9 + PC10, data = df)
summary(ACD_cox)

AD_cox <- coxph(Surv(as.integer(df$deltatime_ad), as.integer(df$ad_dementia)) ~ 
                  Fish_oil_baseline + age + sex + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + 
                  PC8 + PC9 + PC10, data = df)
summary(AD_cox)

VD_cox <- coxph(Surv(as.integer(df$deltatime_vd), as.integer(df$vascular_dementia)) ~ 
                  Fish_oil_baseline + age + sex + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + 
                  PC8 + PC9 + PC10, data = df)
summary(VD_cox)


#interaction analysis
ACD_int <- coxph(Surv(as.integer(df$deltatime_allcause), as.integer(df$alltype_dementia)) ~ 
                   Fish_oil_baseline * APOE4 + age + sex + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + 
                   PC8 + PC9 + PC10, data = df)
summary(ACD_int)

AD_int <- coxph(Surv(as.integer(df$deltatime_ad), as.integer(df$ad_dementia)) ~ 
                  Fish_oil_baseline * APOE4 + age + sex + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + 
                  PC8 + PC9 + PC10, data = df)


VD_int <- coxph(Surv(as.integer(df$deltatime_vd), as.integer(df$vascular_dementia)) ~ 
                  Fish_oil_baseline * APOE4 + age + sex + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + 
                  PC8 + PC9 + PC10, data = df)

#stratified analysis in fish oil users
df_usesFO <- df[df$Fish_oil_baseline == 1, ]
#summary(df_usesFO)

ACD_usesFO <- coxph(Surv(as.integer(df_usesFO$deltatime_allcause), as.integer(df_usesFO$alltype_dementia)) ~ 
                  APOE4 + age + sex + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + 
                   PC8 + PC9 + PC10, data = df_usesFO)
summary(ACD_usesFO)


AD_usesFO <- coxph(Surv(as.integer(df_usesFO$deltatime_ad), as.integer(df_usesFO$ad_dementia)) ~ 
                  APOE4 + age + sex + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + 
                  PC8 + PC9 + PC10, data = df_usesFO)

VD_usesFO <- coxph(Surv(as.integer(df_usesFO$deltatime_vd), as.integer(df_usesFO$vascular_dementia)) ~ 
                  APOE4 + age + sex + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + 
                  PC8 + PC9 + PC10, data = df_usesFO)

#stratifies analysis in non fish oil users
df_nonFO <- df[df$Fish_oil_baseline == 0, ]
#summary(df_nonFO)

ACD_nonFO <- coxph(Surv(as.integer(df_nonFO$deltatime_allcause), as.integer(df_nonFO$alltype_dementia)) ~ 
                      APOE4 + age + sex + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + 
                      PC8 + PC9 + PC10, data = df_nonFO)
summary(ACD_nonFO)


AD_nonFO <- coxph(Surv(as.integer(df_nonFO$deltatime_ad), as.integer(df_nonFO$ad_dementia)) ~ 
                     APOE4 + age + sex + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + 
                     PC8 + PC9 + PC10, data = df_nonFO)

VD_nonFO <- coxph(Surv(as.integer(df_nonFO$deltatime_vd), as.integer(df_nonFO$vascular_dementia)) ~ 
                     APOE4 + age + sex + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + 
                     PC8 + PC9 + PC10, data = df_nonFO)



#RESULTS
#Forest Plot 1a

#ACD
summary(ACD_nonFO)
summary(ACD_usesFO)
summary(ACD_int)

#AD
summary(AD_nonFO)
summary(AD_usesFO)
summary(AD_int)

#VD
summary(VD_nonFO)
summary(VD_usesFO)
summary(VD_int)



#Forest plot 1b
#ACD
ACD_A0 <- coxph(Surv(as.integer(deltatime_allcause), as.integer(alltype_dementia)) ~ 
                     Fish_oil_baseline + age + sex + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + 
                     PC8 + PC9 + PC10, data = df[df$APOE4 == 0, ])
ACD_A1 <- coxph(Surv(as.integer(deltatime_allcause), as.integer(alltype_dementia)) ~ 
                  Fish_oil_baseline + age + sex + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + 
                  PC8 + PC9 + PC10, data = df[df$APOE4 == 1, ])
ACD_A2 <- coxph(Surv(as.integer(deltatime_allcause), as.integer(alltype_dementia)) ~ 
                  Fish_oil_baseline + age + sex + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + 
                  PC8 + PC9 + PC10, data = df[df$APOE4 == 2, ])

summary(ACD_A0)
summary(ACD_A1)
summary(ACD_A2)


#AD 
AD_A0 <- coxph(Surv(as.integer(deltatime_ad), as.integer(ad_dementia)) ~ 
                  Fish_oil_baseline + age + sex + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + 
                  PC8 + PC9 + PC10, data = df[df$APOE4 == 0, ])
AD_A1 <- coxph(Surv(as.integer(deltatime_ad), as.integer(ad_dementia)) ~ 
                  Fish_oil_baseline + age + sex + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + 
                  PC8 + PC9 + PC10, data = df[df$APOE4 == 1, ])
AD_A2 <- coxph(Surv(as.integer(deltatime_ad), as.integer(ad_dementia)) ~ 
                  Fish_oil_baseline + age + sex + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + 
                  PC8 + PC9 + PC10, data = df[df$APOE4 == 2, ])

summary(AD_A0)
summary(AD_A1)
summary(AD_A2)


#VD
VD_A0 <- coxph(Surv(as.integer(deltatime_vd), as.integer(vascular_dementia)) ~ 
                 Fish_oil_baseline + age + sex + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + 
                 PC8 + PC9 + PC10, data = df[df$APOE4 == 0, ])
VD_A1 <- coxph(Surv(as.integer(deltatime_vd), as.integer(vascular_dementia)) ~ 
                 Fish_oil_baseline + age + sex + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + 
                 PC8 + PC9 + PC10, data = df[df$APOE4 == 1, ])
VD_A2 <- coxph(Surv(as.integer(deltatime_vd), as.integer(vascular_dementia)) ~ 
                 Fish_oil_baseline + age + sex + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + 
                 PC8 + PC9 + PC10, data = df[df$APOE4 == 2, ])

summary(VD_A0)
summary(VD_A1)
summary(VD_A2)



#Table 1 p-values

summary(df[df$APOE4 == 0, ])

#?wilcox.test()
wilcox.test(df_nonFO$age, df_usesFO$age)

#?chisq.test()

table(df$sex, df$Fish_oil_baseline)
chisq.test(table(df$sex, df$Fish_oil_baseline))

chisq.test(table(df$alltype_dementia, df$Fish_oil_baseline))
chisq.test(table(df$ad_dementia, df$Fish_oil_baseline))
chisq.test(table(df$vascular_dementia, df$Fish_oil_baseline))





#KM plots
ACD_KM_fit <- survfit(Surv(as.integer(deltatime_allcause), as.integer(alltype_dementia)) 
              ~ APOE4, data = df)
AD_KM_fit <- survfit(Surv(as.integer(deltatime_ad),as.integer(ad_dementia))
                     ~ APOE4, data = df)
VD_KM_fit <- survfit(Surv(as.integer(deltatime_vd), as.integer(vascular_dementia))
                     ~ APOE4, data = df)


VD_KM_plot <- ggsurvplot(VD_KM_fit,
          data = df,
          pval = TRUE, 
          conf.int = TRUE,
          risk.table = TRUE, # Add risk table
          risk.table.col = "strata", # Change risk table color by groups
          linetype = "strata", # Change line type by groups
          surv.median.line = "hv", # Specify median survival
          ggtheme = theme_bw(), # Change ggplot2 theme
          palette = c("#E7B800", "#2E9FDF", "green"),
          ylim = c(0.96, 1),
          risk.table.fontsize = 2.5,
          pval.coord = c(1, 0.98),
          risk.table.height = 0.3,
          conf.int.style = "step")
?ggsurvplot


ACD_KM_plot <- ggsurvplot(ACD_KM_fit,
           data = df,
           pval = TRUE, 
           conf.int = TRUE,
           risk.table = TRUE, # Add risk table
           risk.table.col = "strata", # Change risk table color by groups
           linetype = "strata", # Change line type by groups
           surv.median.line = "hv", # Specify median survival
           ggtheme = theme_bw(), # Change ggplot2 theme
           palette = c("#E7B800", "#2E9FDF", "green"),
           ylim = c(0.96, 1),
           risk.table.fontsize = 2.5,
           pval.coord = c(1, 0.98),
           risk.table.height = 0.3,
           conf.int.style = "step")

AD_KM_plot <- ggsurvplot(AD_KM_fit,
           data = df,
           pval = TRUE, 
           conf.int = TRUE,
           risk.table = TRUE, # Add risk table
           risk.table.col = "strata", # Change risk table color by groups
           linetype = "strata", # Change line type by groups
           surv.median.line = "hv", # Specify median survival
           ggtheme = theme_bw(), # Change ggplot2 theme
           palette = c("#E7B800", "#2E9FDF", "green"),
           ylim = c(0.96, 1),
           risk.table.fontsize = 2.5,
           pval.coord = c(1, 0.98),
           risk.table.height = 0.3,
           conf.int.style = "step")



#trying to combine APOE4 and FO

require("survival")

fit <- survfit( Surv(as.integer(deltatime_allcause), as.integer(alltype_dementia)) 
                ~ APOE4 + Fish_oil_baseline,
                data = df )

ggsurv <- ggsurvplot(fit, 
                     conf.int = TRUE,
                     ggtheme = theme_bw(),
                     ylim = c(0.80, 1)) 


ggsurv$plot +theme_bw() + 
  theme (legend.position = "right")



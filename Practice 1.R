#' ---
#' title: "Practice 1"
#' output:
#'   html_document:
#'     keep_md: yes
#' ---


# install.packages("NHANES")
library(NHANES)
data(NHANES)

#1) What is the type of the loaded data named “NHANES”, data frame or matrix?
typeof(NHANES)

#2) How many rows and columns are in “NHANES”?
nrow(NHANES)
ncol(NHANES)  #or
dim(NHANES)

#For #1 and #2, this works too:
str(NHANES)

#3) How many individuals are included in “NHANES” (each individual has a unique ID)?
head(NHANES)
length(unique(NHANES$ID))

#4)
#?duplicated() 

NHANES.nodup <- NHANES[!duplicated(NHANES),]
nrow(NHANES.nodup)
length(unique(NHANES.nodup$ID))

#5)
library(dplyr)
df1 <- NHANES.nodup %>% select("ID", "SurveyYr", "Gender", "Age", 
                                "Education", "MaritalStatus", "Weight", 
                                "Height", "BMI", "BMI_WHO", "Pulse", 
                                "BPSysAve", "BPDiaAve", "TotChol", "Diabetes")

#6)
str(df1)


#7)
colSums(is.na(df1))
df1.nona <- na.omit(df1)                               


#8)
df2 <- NHANES.nodup %>% select("ID", "SleepHrsNight", "PhysActive", 
                                "Alcohol12PlusYr", "SmokeNow")
#?merge()
df <- merge(df1.nona, df2, by = "ID")                               
head(df)       #note to self: why does df have NA values?


#9)
#?rename()
df <- df %>% rename(SBP = BPSysAve, DBP = BPDiaAve)
head(df)


#10)
df <- df %>% 
  mutate("Age_group" = ifelse(Age < 35, "<35", "≥35"),
         "Sleep_group" = ifelse(SleepHrsNight<5, "<5",
                                ifelse(SleepHrsNight>=5 & SleepHrsNight<6, "5-<6",
                                       ifelse(SleepHrsNight>=6 & SleepHrsNight<7, "6-<7",
                                              ifelse(SleepHrsNight>=7 & SleepHrsNight<8, "7-<8",
                                                     ifelse(SleepHrsNight>=8, "≥8", NA)))))
         )


head(df)
df %>% count(Age_group)
df %>% count(Sleep_group)



#11)
df <- df %>% 
  mutate("Hypertention" = ifelse(SBP > 140 | DBP > 90, "Yes", "No"))

df %>% count(Hypertention)


#12)
getwd()

saveRDS(df, file = "C:/Users/ejiwu/OneDrive/Desktop/Ye Lab/Practice 1 and 2/R_Practice1.rds")

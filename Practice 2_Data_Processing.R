#' ---
#' title: "Practice 2"
#' output:
#'   html_document:
#'     keep_md: yes
#' ---

library(dplyr)
library(tidyr)
library(ggplot2)

#1)
df <- readRDS("C:/Users/ejiwu/OneDrive/Desktop/Ye Lab/Practice 1 and 2/R_Practice1.rds")
head(df)


#2)
#na.fail(df$SleepHrsNight)    
colSums(is.na(df))

#?replace_na()
mean_SHN <- as.integer(mean(df$SleepHrsNight, na.rm = TRUE))
mean_SHN

df <- df %>% 
  mutate("SleepHrsNight_imp" = replace_na(SleepHrsNight, mean_SHN))

summary(df)

#3)
df <- df %>% 
  mutate("Delta_BP" = SBP - DBP)
head(df)


#4a)
ggplot(df, aes(x = Age)) +
  geom_density() +
  labs(
    title = "Age Distribution"
  )

ggplot(df, aes(x = "", fill = Gender)) +
  geom_bar(stat = "count") +         #stat = count counts each gender
  coord_polar(theta = "y") +
  labs (
    title = "Gender Distribution"
  )

ggplot(df, aes(x = Education)) +
  geom_bar() +
  labs (
    title = "Education Distribution"
  )


#4b)
ggplot(df, aes(x = Age, y = BMI)) +
  geom_point() +
  labs (
    title = "Relationship Between Age and BMI"
  )


#4c)
ggplot(df) +
  geom_density(aes(x = DBP, fill = PhysActive, alpha = 0.5)) +
  geom_text(x = 72, y = 0.04, label = "DBP") +
  geom_density(aes(x = SBP, fill = PhysActive, alpha = 0.5)) +
  geom_text(x = 120, y = 0.032, label = "SBP") +
  labs(
    title = "Distribution of SBP and DBP by PhysActive",
    x = "BP by Phisically Active"
  )


#4d)
ggplot(df, aes(x = Sleep_group, fill = Hypertention)) +
  geom_bar()


#5)
summary(df$Hypertention)

head(df$Hypertention)

df$Hypertention <- as.factor(df$Hypertention)
summary(df$Hypertention)



#6)
model <- glm(Hypertention ~ TotChol + Age + Gender + Education + BMI + SmokeNow, 
             data = df, 
             family = binomial())
summary(model)
#TotChol is significantly associated with Hypertension (p < 0.001)

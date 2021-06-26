library(readxl)
BJ <- read_excel("Track_Data.xlsx", 
                         sheet = "Bilateral")
View(BJ)
attach(BJ)

##Regression model
model <- lm(Accel30 ~ Distance, data = BJ)
model
summary(model)

library(ggplot2)
library(ggpubr)

ggplot(BJ, aes(y = Accel30, x = Distance)) +  
  labs(x = "Acceleration 30-meter time (s)", y = "Distance (m)") +
  geom_point() + theme_classic() +
  stat_smooth(method = "lm") +
  stat_regline_equation(label.x = 270, label.y = 5.5,
      aes(label =  paste(..eq.label.., ..adj.rr.label.., sep = "~~~~")))
ggsave("BJ_Distance.png")

##BOMBT data
library(readxl)
BOMBT <- read_excel("Track_Data.xlsx", 
                         sheet = "BOMBT")
View(BOMBT)
attach(BOMBT)

##Regression model 2, not a significant model for BOMBT using distance
model2 <- lm(Accel30 ~ Distance, data = BOMBT)
model2
summary(model2)

ggplot(BOMBT, aes(y = Accel30, x = Distance)) +  
  labs(y = "Acceleration 30-meter completion time (s)", x = "Distance (m)") +
  geom_point() + theme_classic() +
  stat_smooth(method = "lm") +
  stat_regline_equation(label.x = 14, label.y = 5.5,
      aes(label =  paste(..eq.label.., ..adj.rr.label.., sep = "~~~~")))
ggsave("BOMBT_Distance.png")

##Model 3, good model for BOMBT using peak force (PF)
model3 <- lm(Accel30 ~ PF, data = BOMBT)
model3
summary(model3)

ggplot(BOMBT, aes(y = Accel30, x = PF)) +  
  labs(y = "Acceleration 30-meter time (s)", x = "Peak Force (n/kg)") +
  geom_point() + theme_classic() +
  stat_smooth(method = "lm") +
  stat_regline_equation(label.x = 2.3, label.y = 5.5,
        aes(label =  paste(..eq.label.., ..adj.rr.label.., sep = "~~~~")))
ggsave("BOMBT_PeakForce.png")

##Subject descriptives
library(psych)
library(dplyr)

## Change Height to meters / 100 and then obtain BMI (Kg/m2)
BJ <- mutate(BJ, Height = Height/100) %>% 
  mutate(BJ, BMI = Weight / (Height^2))

##describe all subjects mean and sd
BJ %>% describe()
##describe subjects by sex
BJ %>% describeBy(Gender)
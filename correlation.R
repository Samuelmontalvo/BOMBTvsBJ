library(readxl)
BJ <- read_excel("BJ.xlsx")
View(BJ)
attach(BJ)

# Normality test p<0.05 = not normally distributed
shapiro.test(Peak_velocity)

#pearsons correlation
cor(Distance,Peak_velocity)

#spearman correlation
cor(Distance,Peak_Power, method = c("spearman"))

#Scatter Plot
library(ggplot2)

Peak_velocity
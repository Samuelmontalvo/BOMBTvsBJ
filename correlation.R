library(readxl)
BJ <- read_excel("BJ.xlsx")
View(BJ)
attach(BJ)

# Normality test p<0.05 = not normally distributed
shapiro.test(Peak_Power)

#pearsons correlation
cor(Distance,Peak_Power)

#spearman correlation
cor(Distance,Peak_Power, method = c("spearman"))


cor(Distance,Peak_Power, use = "everything",
    method = c("spearman"))


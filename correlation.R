library(readxl)
BJ <- read_excel("BJ.xlsx")
View(BJ)
attach(BJ)

cor(Distance, Contact_time)
library(readxl)
BJ <- read_excel("BJ.xlsx")
View(BJ)
attach(BJ)

##Regression model
model <- lm(Accel ~ Distance, data = BJ)
model
summary(model)

library(ggplot2)
library(ggpubr)

ggplot(BJ, aes(Accel, Distance)) +  
  labs(x = "Acceleration 30-meter time (s)", y = "Distance (m)") +
  geom_point() + theme_classic() +
  stat_smooth(method = lm) +
  geom_label(aes(x = 5, y = 300), hjust = 0, 
             label = paste("Adj R2 = ",signif(summary(model)$adj.r.squared, 5),
                           "\nIntercept =",signif(model$coef[[1]],5 ),
                           " \nSlope =",signif(model$coef[[2]], 5),
                           " \nP =",signif(summary(model)$coef[2,4], 5)))

library(dplyr)
library(ggplot2)
#setwd('C:/Users/holly/Projects/cecs450')
sleepefficency <- read.csv("./Sleep_Efficiency.csv")

sleepcol <- colnames(sleepefficency)
sleepcol
time <- data.frame(sleepefficency)
time %>% select(c("Age","Bedtime"))

  
time
p <- ggplot(time,aes(x="gender",y="Age")) + geom_bar(stat="identity")
p

print("testing")

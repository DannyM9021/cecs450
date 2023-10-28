library(dplyr)
library(ggplot2)
library(fs)

# Below is to find where the file is located no matter what OS
# Used https://www.rdocumentation.org/packages/fs/versions/1.6.3/topics/dir_ls
# as reference
l <- fs::dir_ls(recurse=TRUE, glob="**/Sleep_Efficiency*csv")
sleepefficency <- read.csv(l)

sleepcol <- colnames(sleepefficency)
sleepcol
time <- data.frame(sleepefficency)
time %>% select(c("Age","Bedtime"))

  
time
p <- ggplot(time,aes(x="gender",y="Age")) + geom_bar(stat="identity")
p

print("testing")

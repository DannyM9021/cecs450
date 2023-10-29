library(dplyr)
library(ggplot2)
library(fs)

# Below is to find where the file is located no matter what OS
# Used https://www.rdocumentation.org/packages/fs/versions/1.6.3/topics/dir_ls
# as reference
sleep_efficiency_data <- fs::dir_ls(recurse=TRUE, glob="**/Sleep_Efficiency*csv")
sleepefficency <- read.csv(sleep_efficiency_data)

# Defining a data frame from read from the csv data file
sleep_efficiency_data_frame <- data.frame(sleepefficency)
sleep_columns <- colnames(sleepefficency)
sleep_columns

# Creating a visualization for bedtime vs age
time <- sleep_efficiency_data_frame %>% select(c("Age","Bedtime"))
time
time_graph <- ggplot(time,aes(x="gender",y="Age")) + geom_bar(stat="identity")
time_graph
time_graph2 <- ggplot(time,aes(Bedtime)) +
  geom_line(aes(y = Age, colour = "Age",group=1))
time_graph2

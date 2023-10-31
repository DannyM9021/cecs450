library(dplyr)
library(ggplot2)
library(fs)
# library for 3D pie chart
library(plotrix)
# library for color sets
# source: http://www.sthda.com/english/wiki/colors-in-r 
library("RColorBrewer")

# Below is to find where the file is located no matter what OS
# Used https://www.rdocumentation.org/packages/fs/versions/1.6.3/topics/dir_ls
# as reference
sleep_efficiency_data <- fs::dir_ls(recurse=TRUE, glob="**/Sleep_Efficiency*csv")
sleepefficency <- read.csv(sleep_efficiency_data)

# Defining a data frame from read from the csv data file
sleep_efficiency_data_frame <- data.frame(sleepefficency)
sleep_columns <- colnames(sleepefficency)
sleep_columns

# Bar Graph of Age Count
age_count <- sleep_efficiency_data_frame %>% select(c("Age"))
barplot(table(age_count), main = "Age Count", xlab = "Age", ylab = "Count", 
        border = "aquamarine2", col = "aquamarine2") #can change color later

# Pie Graph of Gender 
gender <- sleep_efficiency_data_frame %>% select(c("Gender"))
gender_count <- table(gender)
gen_label <- c("Female", "Male") #F: 224 M: 228
percent <- round(gender_count/ sum(gender_count)*100)
gen_label <- paste(gen_label, percent)
gen_label < paste(gen_label,"%", sep="")
pie(gender_count, labels = gen_label, main = "Female vs. Male") 
#can change color by adding col = "color value" later 

#or can be visualized as a bar graph 
gender_count <- sleep_efficiency_data_frame %>% select(c("Gender"))
barplot(table(gender_count), main = "Gender Count", xlab = "Gender", ylab = "Count", 
        border = "lavender", col = "lavender") #can change color later


# Creating a visualization for bedtime vs age
time <- sleep_efficiency_data_frame %>% select(c("Age","Bedtime"))
time
time_graph <- ggplot(time,aes(x="gender",y="Age")) + geom_bar(stat="identity")
time_graph
time_graph2 <- ggplot(time,aes(Bedtime)) +
  geom_line(aes(y = Age, colour = "Age",group=1))
time_graph2 


# REM Sleep Percentage Pie Chart (still need to fix values)
rem_sleep <- sleep_efficiency_data_frame %>% select(c("REM.sleep.percentage"))
rem_count <- table(rem_sleep)
#gen_label <- c("Female", "Male") #F: 224 M: 228
percent <- round(rem_count/ sum(rem_count)*100)
#gen_label <- paste(gen_label, percent)
#rem_label < paste(gen_label,"%", sep="")
pie(rem_count, main = "REM Sleep Percentage") 


# Deep Sleep Percentage (still need to fix values) 
deep_sleep <- sleep_efficiency_data_frame %>% select(c("Deep.sleep.percentage"))
deep_count <- table(deep_sleep)
#gen_label <- c("Female", "Male") #F: 224 M: 228
percent <- round(deep_count/ sum(deep_count)*100)
#gen_label <- paste(gen_label, percent)
#rem_label < paste(gen_label,"%", sep="")
pie(deep_count, col= brewer.pal(n = 12, name="Set3"), main = "Deep Sleep Percentage") 

# Light Sleep Percentage (still need to fix vlaues)
light_sleep <- sleep_efficiency_data_frame %>% select(c("Light.sleep.percentage"))
light_count <- table(rem_sleep)
#gen_label <- c("Female", "Male") #F: 224 M: 228
percent <- round(light_count/ sum(light_count)*100)
#gen_label <- paste(gen_label, percent)
#rem_label < paste(gen_label,"%", sep="")
pie(light_count, col= brewer.pal(n = 12, name="Set3"), main = "Light Sleep Percentage") 

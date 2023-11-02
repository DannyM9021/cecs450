library(dplyr)
library(ggplot2)
# library for 3D pie chart
library(plotrix)
# library for color sets
# source: http://www.sthda.com/english/wiki/colors-in-r 
library("RColorBrewer")

path <- getwd()
sleepefficency <- read.csv(list.files(path, pattern = "Sleep_Efficiency.csv", full.names = TRUE, recursive = TRUE))
lifestyle <- read.csv(list.files(path, pattern = "Sleep_health_and_lifestyle_dataset.csv", full.names = TRUE, recursive = TRUE))

# Defining a data frame from read from the csv data file
sleep_efficiency_data_frame <- data.frame(sleepefficency)
sleep_columns <- colnames(sleepefficency)
sleep_columns

lifestyle_data_frame <- data.frame(lifestyle)
lifestyle_columns <- colnames(lifestyle)

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
#rem_sleep <- sleep_efficiency_data_frame %>% select(c("REM.sleep.percentage"))
#rem_count <- table(rem_sleep)
#rem_count #just checking
#rem_label <- c("REM.sleep.percentage")
#percent <- round(rem_count/ sum(rem_count)*100)
#rem_label <- paste(rem_label, percent)
#rem_label < paste(rem_label,"%", sep="")
#pie(rem_count, main = "REM Sleep Percentage") 

# Scatter Plot Between Age and REM Sleep Percentage
x <- sleep_efficiency_data_frame$REM.sleep.percentage 
y <- sleep_efficiency_data_frame$Age

plot(x, y, main = "Does Age Effect REM Sleep?",
     xlab = "age", ylab = "REM Sleep (%)",
     pch = 19, frame = FALSE)
# Add regression line
plot(x, y, main = "Does Age Effect REM Sleep?",
     xlab = "age", ylab = "REM Sleep (%)",
     pch = 19, frame = FALSE)
abline(lm(y ~ x, data = sleep_efficiency_data_frame), col = "blue")


# Deep Sleep Percentage (still need to fix values) 
#deep_sleep <- sleep_efficiency_data_frame %>% select(c("Deep.sleep.percentage"))
#deep_count <- table(deep_sleep)
#gen_label <- c("Female", "Male") #F: 224 M: 228
#percent <- round(deep_count/ sum(deep_count)*100)
#gen_label <- paste(gen_label, percent)
#rem_label < paste(gen_label,"%", sep="")
#pie(deep_count, col= brewer.pal(n = 12, name="Set3"), main = "Deep Sleep Percentage") 

# Scatter Plot Between Age and Deep Sleep Percentage
x <- sleep_efficiency_data_frame$Deep.sleep.percentage 
y <- sleep_efficiency_data_frame$Age

plot(x, y, main = "Does Age Effect Deep Sleep?",
     xlab = "age", ylab = "Deep Sleep (%)",
     pch = 19, frame = FALSE)
# Add regression line
plot(x, y, main = "Does Age Effect Deep Sleep?",
     xlab = "age", ylab = "Deep Sleep (%)",
     pch = 19, frame = FALSE)
abline(lm(y ~ x, data = sleep_efficiency_data_frame), col = "blue")


# Light Sleep Percentage (still need to fix values)
#light_sleep <- sleep_efficiency_data_frame %>% select(c("Light.sleep.percentage"))
#light_count <- table(rem_sleep)
#gen_label <- c("Female", "Male") #F: 224 M: 228
#percent <- round(light_count/ sum(light_count)*100)
#gen_label <- paste(gen_label, percent)
#rem_label < paste(gen_label,"%", sep="")
#pie(light_count, col= brewer.pal(n = 12, name="Set3"), main = "Light Sleep Percentage") 

# Scatter Plot Between Age and REM Sleep Percentage
x <- sleep_efficiency_data_frame$Light.sleep.percentage 
y <- sleep_efficiency_data_frame$Age

plot(x, y, main = "Does Age Effect Light Sleep?",
     xlab = "age", ylab = "Light Sleep (%)",
     pch = 19, frame = FALSE)
# Add regression line
plot(x, y, main = "Does Age Effect Light Sleep?",
     xlab = "age", ylab = "Light Sleep (%)",
     pch = 19, frame = FALSE)
abline(lm(y ~ x, data = sleep_efficiency_data_frame), col = "blue")



#trying to find the correlation between caffeine consumption and sleep duration
caffeine <- sleep_efficiency_data_frame %>% select(c("Age","Caffeine.consumption","Sleep.duration"))
caffeine <- na.omit(caffeine)
caffeine %>% group_by(Age) %>%summarise_at(vars(Caffeine.consumption,Sleep.duration), list(name = mean))
# Value used to transform the data
coeff <- 20
ggplot(caffeine, aes(x=Age)) +
  geom_line( aes(y=Sleep.duration),color="blue") + 
  geom_line( aes(y=Caffeine.consumption / coeff),color="chocolate4") + # Divide by 10 to get the same range than the temperature
  scale_y_continuous(
    # Features of the first axis
    name = "Sleep.duration",
    # Add a second axis and specify its features
    sec.axis = sec_axis(~.*coeff, name="Caffeine.consumption")
  )

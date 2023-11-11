library(dplyr)
library(ggplot2)
# library for 3D pie chart
library(plotrix)
# library for color sets
# source: http://www.sthda.com/english/wiki/colors-in-r 
library("RColorBrewer")

# Finds data sets on the user's computer (data sets are in the repository)
path <- getwd()
sleepefficency <- read.csv(list.files(path, pattern = "Sleep_Efficiency.csv", full.names = TRUE, recursive = TRUE))
lifestyle <- read.csv(list.files(path, pattern = "Sleep_health_and_lifestyle_dataset.csv", full.names = TRUE, recursive = TRUE))

# Defining a data frame from read from the csv data file
sleep_efficiency_data_frame <- data.frame(sleepefficency)
sleep_columns <- colnames(sleepefficency)
sleep_columns

# Defining data frames using the data sets to create graphs for visualization
lifestyle_data_frame <- data.frame(lifestyle)
lifestyle_columns <- colnames(lifestyle)

#------------------------- Sleep Efficiency Data set----------------------------
# Bar Graph of Age Count
age_count <- sleep_efficiency_data_frame %>% select(c("Age"))
barplot(table(age_count), main = "Age Count", xlab = "Age", ylab = "Count", 
        border = "aquamarine2", col = "aquamarine2") #can change color later

# Pie Graph of Gender 
gender <- sleep_efficiency_data_frame %>% select(c("Gender"))
gender_count <- table(gender)
gen_label <- c("Female", "Male") #F: 224 M: 228
percent <- round(gender_count/ sum(gender_count)*100)
gen_label <- paste(gen_label, percent, "%")
#gen_label < paste(gen_label,"%", sep="")
pie(gender_count, labels = gen_label, main = "Female vs. Male") 
# can change color by adding col = "color value" later 

# or can be visualized as a bar graph 
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

# another version 
rem <- sleep_efficiency_data_frame %>% select(c("Age","REM.sleep.percentage"))
rem
#rem_graph <- ggplot(time,aes(x="Age",y="REM Sleep (%)")) + geom_bar(stat="identity")
#rem_graph
rem_graph <- ggplot(rem,aes(x= Age)) + 
  geom_line(aes(y = REM.sleep.percentage))
rem_graph


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



#Caffeine.consumption by age 
caffeine <- sleep_efficiency_data_frame %>% select(c("Caffeine.consumption","Sleep.efficiency","Age"))
caffeine <- na.omit(caffeine) #omit NA rows
caffeine_count <- xyTable(caffeine$Age,caffeine$Caffeine.consumption)
names(caffeine_count) <- c('Age','Caffeine.consumption','Count')
ggplot(caffeine,aes(x=Age,y=Caffeine.consumption))+geom_point()
plot(caffeine_count$Age , caffeine_count$Caffeine.consumption  , cex=caffeine_count$Count*0.5 , pch=16 , col=rgb(0,0,1,0.5) , xlab= "Age" , ylab="Caffeine consumption" , xlim=c(0,70) , ylim=c(0,200) )

# Scatter plot with caffeine consumption and sleep duration
ggplot(caffeine, aes(x = Caffeine.consumption, y = Sleep.efficiency)) +
  geom_boxplot(aes(group = Caffeine.consumption),fill="gray") +
  labs(x = "Caffeine Consumption", y = "Sleep Efficiency") +
  stat_summary(fun.y=mean, geom="point", shape=20, size=4, color="red", fill="red") +
  theme_minimal()

#the correlation between alcohol consumption and sleep efficiency
alcohol <- sleep_efficiency_data_frame %>% select(c("Alcohol.consumption","Sleep.efficiency"))
alcohol <- na.omit(alcohol) #omit NA rows
#alcohol["age_group"] = cut(alcohol$Age, c(0, 10, 15, 20, 25, 30,35, 40, 45, 50, 55, 60, 65, Inf), c("<10", "11-15", "16-20","21-25", "26-30", "31-35","36-40","41-45", "46-50", "51-55","56-60","61-65",  ">66"), include.lowest=TRUE)
# Scatter plot with color-coded points by age group
ggplot(alcohol, aes(x = Alcohol.consumption, y = Sleep.efficiency)) +
  geom_boxplot(aes(group = Alcohol.consumption),fill="gray") +
  stat_summary(fun.y=mean, geom="point", shape=20, size=4, color="red", fill="red") +
  labs(x = "Alcohol Consumption", y = "Sleep Efficiency") +
  theme_minimal()


# Visualization of Smoking Status 
smoking <- sleep_efficiency_data_frame %>% select(c("Smoking.status"))
barplot(table(smoking), main = "Smoking Status", xlab = "Status (Yes/No)", ylab = "Count", 
        border = "lightblue", col = "lightblue") #can change color later

# Visualization of the effects of smoking on sleep efficiency 
smoke_n_sleep <- sleep_efficiency_data_frame %>% select(c("Smoking.status","Sleep.efficiency"))
smoke_n_sleep
#rem_graph <- ggplot(time,aes(x="Age",y="REM Sleep (%)")) + geom_bar(stat="identity")
#rem_graph
#ss_graph <- ggplot(rem,aes(x= Smoking.status)) + 
 # geom_line(aes(y = Sleep.efficiency))
#ss_graph

ggplot(smoke_n_sleep, aes(x = Smoking.status, y = Sleep.efficiency)) +
  geom_boxplot(aes(group = Smoking.status),fill="gray") +
  labs(x = "Smoking Status", y = "Sleep Efficiency") +
  stat_summary(fun.y=mean, geom="point", shape=20, size=4, color="red", fill="red") +
  theme_minimal()




# -------------------------------Life Style Data set----------------------------
# Pie Chart of Occupation 
job <- lifestyle %>% select(c("Occupation"))
job_count <- table(job)
job_count
percent <- round(job_count/ sum(job_count)*100)
job_label <- paste(job_label, percent, "%")
#job_label <- paste(job_label,"%", sep="")
pie(job_count, col= brewer.pal(n = 12, name="Set3"), main = "Occupation Count") 



# Bar Graph of Occupation 
#job_count <- lifestyle %>% select(c("Occupation"))
#barplot(table(job_count), main = "Occupation Count", xlab = "Occupations", ylab = "Count", 
 #       border = "grey", col = "grey") #can change color later

# Scatter plot of physical activity compared to stress level
physical_activity_vs_stress <- lifestyle %>% select(c("Physical.Activity.Level","Stress.Level"))
ggplot(physical_activity_vs_stress, aes(x=Physical.Activity.Level, y=Stress.Level)) + 
  geom_point() + 
  labs(title = "Physical Activity Level vs Stress Level") +
  xlab("Physical Activity Level") +
  ylab("Stress Level") +
  theme(plot.title = element_text(hjust = 0.5))

# Graph for Sleep Disorder 
disorder <- lifestyle %>% select(c("Sleep.Disorder"))
disorder_count <- table(disorder)
disorder_count
percent <- round(disorder_count/ sum(disorder_count)*100)
#job_label <- paste(job_label, percent)
#job_label <- paste(job_label,"%", sep="")
pie(disorder_count, col= brewer.pal(n = 12, name="Set3"),main = "Sleep Disorder Count")

# Bar Graph of Sleep Disorder
disorder_count <- lifestyle %>% select(c("Sleep.Disorder"))
barplot(table(disorder_count), main = "Sleep Disorder Count", xlab = "Sleep Disorder", ylab = "Count", 
       border = "grey", col = "grey") #can change color later

# Graph to find correlation between sleep disorder and sleep duration
sleep <- lifestyle %>% select(c("Sleep.Disorder","Sleep.Duration"))
ggplot(sleep, aes(x = Sleep.Disorder, y = Sleep.Duration)) +
  geom_boxplot(aes(group = Sleep.Disorder),fill="gray") +
  labs(x = "Sleep Disorder", y = "Sleep Duration") +
  stat_summary(fun.y=mean, geom="point", shape=20, size=4, color="red", fill="red") +
  theme_minimal()

# Graph to find correlation between sleep disorder and quality of sleep
sleep <- lifestyle %>% select(c("Sleep.Disorder","Quality.of.Sleep"))
ggplot(sleep, aes(x = Sleep.Disorder, y = Quality.of.Sleep)) +
  geom_boxplot(aes(group = Sleep.Disorder),fill="gray") +
  labs(x = "Sleep Disorder", y = "Quality of Sleep") +
  stat_summary(fun.y=mean, geom="point", shape=20, size=4, color="red", fill="red") +
  theme_minimal()



library(dplyr)
library(ggplot2)
# library for 3D pie chart
library(plotrix)
# library for color sets
# source: http://www.sthda.com/english/wiki/colors-in-r 
library("RColorBrewer")
library(ggridges)
library(forcats)
library(grid)
# library to help calculate with the correlation coefficient between to numeric value?
# have functions for creating and customizing ggplot2
library(ggpubr)

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
percent <- round(gender_count/ sum(gender_count)*100, 1)
gen_label <- paste(gen_label, percent, "%")
#gen_label < paste(gen_label,"%", sep="")
pie(gender_count, labels = gen_label, main = "Female vs. Male") 
# can change color by adding col = "color value" later 

# or can be visualized as a bar graph 
# F: 224 M: 228
gender_count <- sleep_efficiency_data_frame %>% select(c("Gender"))
barplot(table(gender_count), main = "Gender Count", xlab = "Gender", ylab = "Count", 
        border = "lavender", col = "lavender") #can change color later


# Creating a visualization for bedtime vs age
time <- sleep_efficiency_data_frame %>% select(c("Age","Bedtime"))
time$Bedtime <- as.Date(time$Bedtime)
time
#time_graph2 <- ggplot(time,aes(Bedtime) +
#  geom_point(aes(y = Age, colour = "Age",group=1)) +
#  scale_x_date(date_labels = "%m-%d"))
#time_graph2 


# Scatter Plot Between Age and REM Sleep Percentage
x <- sleep_efficiency_data_frame$Age 
y <- sleep_efficiency_data_frame$REM.sleep.percentage

plot(x, y, main = "Does Age Affect REM Sleep?",
     xlab = "age", ylab = "REM Sleep (%)",
     pch = 19, frame = FALSE, xlim= c(7,70), ylim= c(10, 35))
# Add regression line
plot(x, y, main = "Does Age Affect REM Sleep?",
     xlab = "age", ylab = "REM Sleep (%)",
     pch = 19, frame = FALSE, xlim= c(7,70), ylim= c(10, 35))
abline(lm(y ~ x, data = sleep_efficiency_data_frame), col = "blue")

# another scatter plot with calculated correlation coefficient 
#read file
sleep_data <- sleep_efficiency_data_frame #%>% select(c("Age", "REM.sleep.percentage"))
#plot the data as points and calculate 
#correlation coefficient with pearson correlation formula
ggscatter(sleep_data, x = "Age", y = "REM.sleep.percentage", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Age", ylab = "REM Sleep (%)", xlim= c(7,70), ylim= c(10, 35))


# Scatter Plot Between Age and Deep Sleep Percentage
x <- sleep_efficiency_data_frame$Age 
y <- sleep_efficiency_data_frame$Deep.sleep.percentage

plot(x, y, main = "Does Age Affect Deep Sleep?",
     xlab = "age", ylab = "Deep Sleep (%)",
     pch = 19, frame = FALSE, xlim= c(7,70), ylim= c(15, 80))
# Add regression line
plot(x, y, main = "Does Age Affect Deep Sleep?",
     xlab = "age", ylab = "Deep Sleep (%)",
     pch = 19, frame = FALSE, xlim= c(7,70), ylim= c(15, 80))
abline(lm(y ~ x, data = sleep_efficiency_data_frame), col = "blue")

# another scatter plot with calculated correlation coefficient 
#read file
sleep_data <- sleep_efficiency_data_frame #%>% select(c("Age", "REM.sleep.percentage"))
#plot the data as points and calculate 
#correlation coefficient with pearson correlation formula
ggscatter(sleep_data, x = "Age", y = "Deep.sleep.percentage", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Age", ylab = "Deep Sleep (%)", xlim= c(7,70), ylim= c(15, 80))


# Scatter Plot Between Age and Light Sleep Percentage
x <- sleep_efficiency_data_frame$Age
y <- sleep_efficiency_data_frame$Light.sleep.percentage

plot(x, y, main = "Does Age Affect Light Sleep?",
     xlab = "age", ylab = "Light Sleep (%)",
     pch = 19, frame = FALSE, xlim= c(7,70), ylim= c(5, 70))
# Add regression line
plot(x, y, main = "Does Age Affect Light Sleep?",
     xlab = "age", ylab = "Light Sleep (%)",
     pch = 19, frame = FALSE, xlim= c(7,70), ylim= c(5, 70))
abline(lm(y ~ x, data = sleep_efficiency_data_frame), col = "blue")

# another scatter plot with calculated correlation coefficient 
#read file
sleep_data <- sleep_efficiency_data_frame #%>% select(c("Age", "REM.sleep.percentage"))
#plot the data as points and calculate 
#correlation coefficient with pearson correlation formula
ggscatter(sleep_data, x = "Age", y = "Light.sleep.percentage", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Age", ylab = "Light Sleep (%)", xlim= c(7,70), ylim= c(5, 70))


#Caffeine.consumption by age 
caffeine <- sleep_efficiency_data_frame %>% select(c("Caffeine.consumption","Sleep.efficiency","Age"))
caffeine <- na.omit(caffeine) #omit NA rows
caffeine_count <- xyTable(caffeine$Age,caffeine$Caffeine.consumption)
names(caffeine_count) <- c('Age','Caffeine.consumption','Count')
ggplot(caffeine,aes(x=Age,y=Caffeine.consumption))+geom_point()
plot(caffeine_count$Age , caffeine_count$Caffeine.consumption  , cex=caffeine_count$Count*0.5 , pch=16 , col=rgb(0,0,1,0.5) , xlab= "Age" , ylab="Caffeine consumption" , xlim=c(0,70) , ylim=c(0,200) )
legend('topleft',inset=0.05,"Count",lty=0,col='blue',lwd=2,pch=16)

# box plot with caffeine consumption and sleep duration
ggplot(caffeine, aes(x = Caffeine.consumption, y = Sleep.efficiency)) +
  geom_boxplot(aes(group = Caffeine.consumption),fill="darkgoldenrod") +
  labs(x = "Caffeine Consumption", y = "Sleep Efficiency") +
  stat_summary(fun.y=mean, geom="point", shape=20, size=4, color="red", fill="red") +
  theme_minimal()

#Alcohol consumption by age 
Alcohol <- sleep_efficiency_data_frame %>% select(c("Alcohol.consumption","Sleep.efficiency","Age"))
Alcohol <- na.omit(Alcohol) #omit NA rows
Alcohol_count <- xyTable(Alcohol$Age,Alcohol$Alcohol.consumption)
names(Alcohol_count) <- c('Age','Alcohol.consumption','Count')
ggplot(Alcohol,aes(x=Age,y=Alcohol.consumption))+geom_point()
plot(Alcohol_count$Age , Alcohol_count$Alcohol.consumption  , cex=Alcohol_count$Count*0.5 , pch=16 , col=rgb(0,0,1,0.5) , xlab= "Age" , ylab="Alcohol Consumption" , xlim=c(0,70) , ylim=c(0,6) )
legend('topleft',inset=0.05,"Count",lty=1,col='blue',lwd=4)

#the correlation between alcohol consumption and sleep efficiency
alcohol <- sleep_efficiency_data_frame %>% select(c("Alcohol.consumption","Sleep.efficiency"))
alcohol <- na.omit(alcohol) #omit NA rows
#alcohol["age_group"] = cut(alcohol$Age, c(0, 10, 15, 20, 25, 30,35, 40, 45, 50, 55, 60, 65, Inf), c("<10", "11-15", "16-20","21-25", "26-30", "31-35","36-40","41-45", "46-50", "51-55","56-60","61-65",  ">66"), include.lowest=TRUE)
# Scatter plot with color-coded points by age group
ggplot(alcohol, aes(x = Alcohol.consumption, y = Sleep.efficiency)) +
  geom_boxplot(aes(group = Alcohol.consumption),fill="darkgoldenrod") +
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
#job_count # just to check values
percent <- round(job_count/ sum(job_count)*100, 1)
job_label <- paste(percent, "%")
# Adjust margins
par(mar=c(2,0,2,2))
pie(job_count, labels = job_label, col= brewer.pal(n = 12, name="Set3"), main = "Occupation Count", radius = .6, clockwise = TRUE) 
# create legend 
legend(x= 1, y= 1, c("Account", "Doctor", "Engineer", "Lawyer", "Manager",
                    "Nurse", "Sales Rep.", "Salesperson", "Scientist", "Software Engr.",
                   "Engineer"), fill = brewer.pal(n = 12, name="Set3"))


annotation <- textGrob("*Manager and Sales Representative have been \nremoved due to lack of data", gp=gpar(fontsize=8, fontface="italic"))
#Comparing Sleep.Duration with differnt occupation
job_compare_sd <- lifestyle %>% select(c("Occupation","Sleep.Duration"))
#omit manager and sales Representative because theres not enough data
job_compare_sd <- job_compare_sd %>% filter(Occupation!="Manager"&Occupation!="Sales Representative")
#used fct_reorder to reorder the rows by median in the graph
job_compare_sd %>% mutate(class = fct_reorder(Occupation, Sleep.Duration, .fun='median')) %>%
  ggplot(aes(x = Sleep.Duration, y = reorder(Occupation, Sleep.Duration), fill = Occupation)) +
  geom_density_ridges(alpha=0.8) +
  #geom_density_ridges(alpha=0.6, stat="binline", bins=6) +
  theme_ridges() +
  theme(
    legend.position="none",
    panel.spacing = unit(0.1, "lines"),
    strip.text.x = element_text(size = 8)
  )+
  coord_cartesian(clip = "off")+ #turn off cliping so annotation can be outside of graph
  annotation_custom(annotation,xmin=1,ymin=-2.2, ymax=1) + #add annotation
  xlab("Sleep.Duration") +
  ylab("Occupation")


annotation <- textGrob("*Manager and Sales Representative have been \nremoved due to lack of data", gp=gpar(fontsize=8, fontface="italic"))
#Comparing quailty of sleep with differnt occupation
job_compare_qs <- lifestyle %>% select(c("Occupation","Quality.of.Sleep"))
#omit manager and sales Representative because theres not enough data
job_compare_qs <- job_compare_qs %>% filter(Occupation!="Manager"&Occupation!="Sales Representative")
#used fct_reorder to reorder the rows by median in the graph
job_compare_qs %>% mutate(class = fct_reorder(Occupation, Quality.of.Sleep, .fun='median')) %>%
  ggplot(aes(x = Quality.of.Sleep, y = reorder(Occupation, Quality.of.Sleep), fill = Occupation)) +
  geom_density_ridges(alpha=0.8) +
  #geom_density_ridges(alpha=0.6, stat="binline", bins=6) +
  theme_ridges() +
  theme(
    legend.position="none",
    panel.spacing = unit(0.1, "lines"),
    strip.text.x = element_text(size = 8)
  )+  
  coord_cartesian(clip = "off")+ #turn off cliping so annotation can be outside of graph
  annotation_custom(annotation,xmin=-7,ymin=-2.5, ymax=1) + #add annotation
  xlab("Quality.of.Sleep") +
  ylab("Occupation")

annotation <- textGrob("*Manager and Sales Representative have been \nremoved due to lack of data", gp=gpar(fontsize=8, fontface="italic"))
#Comparing quailty of sleep with differnt occupation
job_compare_stress <- lifestyle %>% select(c("Occupation","Stress.Level"))
#omit manager and sales Representative because theres not enough data
job_compare_stress <- job_compare_stress %>% filter(Occupation!="Manager"&Occupation!="Sales Representative")
#used fct_reorder to reorder the rows by median in the graph
job_compare_stress %>% mutate(class = fct_reorder(Occupation, Stress.Level, .fun='median')) %>%
  ggplot(aes(x = Stress.Level, y = reorder(Occupation, Stress.Level), fill = Occupation)) +
  geom_density_ridges(alpha=0.8) +
  #geom_density_ridges(alpha=0.6, stat="binline", bins=6) +
  theme_ridges() +
  theme(
    legend.position="none",
    panel.spacing = unit(0.1, "lines"),
    strip.text.x = element_text(size = 8),
  )+  
  coord_cartesian(clip = "off")+ #turn off cliping so annotation can be outside of graph
  annotation_custom(annotation,xmin=-7,ymin=-2.5, ymax=1) + #add annotation
  xlab("Stress Level") +
  ylab("Occupation")

# Scatter plot of physical activity compared to stress level
physical_activity_vs_stress <- lifestyle %>% select(c("Physical.Activity.Level","Stress.Level"))
ggplot(physical_activity_vs_stress, aes(x=Physical.Activity.Level, y=Stress.Level)) + 
  geom_point() + 
  labs(title = "Physical Activity Level vs Stress Level") +
  xlab("Physical Activity Level") +
  ylab("Stress Level") +
  theme(plot.title = element_text(hjust = 0.5))

# Bubble plot of Heart.Rate compared to quality of sleep
Heart.RatevsQuality.of.Sleep <- lifestyle %>% select(c("Quality.of.Sleep","Heart.Rate"))
Heart.RatevsQuality.of.Sleep <- rename(count(Heart.RatevsQuality.of.Sleep, Quality.of.Sleep, Heart.Rate), freq = n)
ggplot(Heart.RatevsQuality.of.Sleep, aes(x=Heart.Rate, y=Quality.of.Sleep, size=freq )) + 
  geom_point(color = "blue",alpha=0.5) + 
  labs(title = "Heart.Rate vs Quality of Sleep") +
  xlab("Heart.Rate") +
  ylab("Quality.of.Sleepl") +
  theme_minimal() +
  scale_size(range = c(1, 25), name="Frequency")
  

# Pie Graph for Sleep Disorder 
disorder <- lifestyle %>% select(c("Sleep.Disorder"))
disorder_count <- table(disorder)
#disorder_count # to check values
disorder_label<- c("None", "Insomnia", "Sleep Apnea")
percent <- round(disorder_count/ sum(disorder_count)*100, 1)
disorder_label <- paste(disorder_label, percent, "%")

# Adjust margins
par(mar=c(2,2,2,2))
pie(disorder_count, labels = disorder_label, col= brewer.pal(n = 12, name="Set3"), main = "Sleep Disorder Count", radius = 1, clockwise = TRUE) 


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



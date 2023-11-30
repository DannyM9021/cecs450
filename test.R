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
sleep_eff_age_graph <- barplot(table(age_count), main = "Age Count", xlab = "Age", ylab = "Count", 
        border = "blue", col = "lightblue1",ylim = c(0, 25), legend.text = "Age",
        args.legend=list(cex=1,x="topright"),
        space = 0.1)

abline(h=0)
text(x = sleep_eff_age_graph,
     y = table(age_count),
     labels = as.data.frame(table(age_count))[[2]],
     pos = 3)

# Pie Graph of Gender-----------------------------------------------------------
#gender <- sleep_efficiency_data_frame %>% select(c("Gender"))
#gender_count <- table(gender)
#gen_label <- c("Female", "Male") #F: 224 M: 228
#percent <- round(gender_count/ sum(gender_count)*100, 1)
#gen_label <- paste(gen_label, percent, "%")
#pie(gender_count, labels = gen_label, main = "Female vs. Male") 
# can change color by adding col = "color value" later 

# or can be visualized as a bar graph-------------------------------------------
# F: 224 M: 228
gender_count <- sleep_efficiency_data_frame %>% select(c("Gender"))
sleep_eff_gender_graph <- barplot(table(gender_count), main = "Gender Count", xlab = "Gender", ylab = "Count", 
        border = c("red", "blue"), col = c("lightpink2", "lightblue"), ylim = c(0,254),
        legend.text = c("Female","Male"), args.legend=list(cex=1,x= 2.3, y= 300), space = 0.1 )

abline(h=0)
text(x = sleep_eff_gender_graph,
     y = table(gender_count),
     labels = as.data.frame(table(gender_count))[[2]],
     pos = 3)


# Creating a visualization for bedtime vs age-----------------------------------
time <- sleep_efficiency_data_frame %>% select(c("Age","Bedtime"))
time$Bedtime <- as.Date(time$Bedtime)
time

# Scatter Plot Between Age and REM Sleep Percentage-----------------------------
x <- sleep_efficiency_data_frame$Age 
y <- sleep_efficiency_data_frame$REM.sleep.percentage

plot(x, y, main = "Does Age Affect REM Sleep?",
     xlab = "age", ylab = "REM Sleep (%)",
     pch = 19, frame = FALSE, xlim= c(7,70), ylim= c(10, 35))
# Add regression line
#plot(x, y, main = "Does Age Affect REM Sleep?",
#     xlab = "age", ylab = "REM Sleep (%)",
#     pch = 19, frame = FALSE, xlim= c(7,70), ylim= c(10, 35))
#abline(lm(y ~ x, data = sleep_efficiency_data_frame), col = "blue")

# another scatter plot with calculated correlation coefficient------------------
#read file
sleep_data <- sleep_efficiency_data_frame #%>% select(c("Age", "REM.sleep.percentage"))
# plot the data as points and calculate 
# correlation coefficient with pearson correlation formula
ggscatter(sleep_data, x = "Age", y = "REM.sleep.percentage", main = "Does Age Affect REM Sleep?", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Age", ylab = "REM Sleep (%)", xlim= c(7,70), ylim= c(10, 35))


# Scatter Plot Between Age and Deep Sleep Percentage----------------------------
x <- sleep_efficiency_data_frame$Age 
y <- sleep_efficiency_data_frame$Deep.sleep.percentage

plot(x, y, main = "Does Age Affect Deep Sleep?",
     xlab = "age", ylab = "Deep Sleep (%)",
     pch = 19, frame = FALSE, xlim= c(7,70), ylim= c(15, 80))
# Add regression line
#plot(x, y, main = "Does Age Affect Deep Sleep?",
#     xlab = "age", ylab = "Deep Sleep (%)",
#     pch = 19, frame = FALSE, xlim= c(7,70), ylim= c(15, 80))
#abline(lm(y ~ x, data = sleep_efficiency_data_frame), col = "blue")

# another scatter plot with calculated correlation coefficient 
# read file
sleep_data <- sleep_efficiency_data_frame #%>% select(c("Age", "REM.sleep.percentage"))
#plot the data as points and calculate 
#correlation coefficient with pearson correlation formula
ggscatter(sleep_data, x = "Age", y = "Deep.sleep.percentage", main = "Does Age Affect Deep Sleep?", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Age", ylab = "Deep Sleep (%)", xlim= c(7,70), ylim= c(15, 80))


# Scatter Plot Between Age and Light Sleep Percentage---------------------------
x <- sleep_efficiency_data_frame$Age
y <- sleep_efficiency_data_frame$Light.sleep.percentage

plot(x, y, main = "Does Age Affect Light Sleep?",
     xlab = "age", ylab = "Light Sleep (%)",
     pch = 19, frame = FALSE, xlim= c(7,70), ylim= c(5, 70))
# Add regression line
#plot(x, y, main = "Does Age Affect Light Sleep?",
#     xlab = "age", ylab = "Light Sleep (%)",
#     pch = 19, frame = FALSE, xlim= c(7,70), ylim= c(5, 70))
#abline(lm(y ~ x, data = sleep_efficiency_data_frame), col = "blue")

# another scatter plot with calculated correlation coefficient 
# read file
sleep_data <- sleep_efficiency_data_frame #%>% select(c("Age", "REM.sleep.percentage"))
# plot the data as points and calculate 
# correlation coefficient with pearson correlation formula
ggscatter(sleep_data, x = "Age", y = "Light.sleep.percentage",main = "Does Age Affect Light Sleep?", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Age", ylab = "Light Sleep (%)", xlim= c(7,70), ylim= c(5, 70))


# Bubble plot of # Caffeine.consumption by age---------------------------------------------------
caffeine <- sleep_efficiency_data_frame %>% select(c("Caffeine.consumption","Age"))
caffeine <- na.omit(caffeine) #omit NA rows
caffeine <- rename(count(caffeine, Caffeine.consumption, Age), freq = n)
ggplot(caffeine, aes(x=Age, y=Caffeine.consumption, size=freq )) + 
  geom_point(color = "blue",alpha=0.5) + 
  labs(title = "Caffeine Consumption by Age") +
  xlab("Age") +
  ylab("Caffeine.consumption") +
  theme_minimal() +
  scale_size(range = c(1, 10), name="Frequency")

# box plot with caffeine consumption and sleep efficiency-----------------------
caffeine <- sleep_efficiency_data_frame %>% select(c("Caffeine.consumption","Sleep.efficiency"))
caffeine <- na.omit(caffeine) #omit NA rows
ggplot(caffeine, aes(x = Caffeine.consumption, y = Sleep.efficiency)) +
  geom_boxplot(aes(group = Caffeine.consumption),fill="darkgoldenrod") +
  labs(x = "Caffeine Consumption", y = "Sleep Efficiency") +
  stat_summary(fun.y=mean, geom="point", shape=20, size=4, color="red", fill="red") +
  theme_minimal() + 
  labs(title = "Caffeine Consumption vs Sleep Efficiency")

# Alcohol consumption by age----------------------------------------------------
Alcohol <- sleep_efficiency_data_frame %>% select(c("Alcohol.consumption","Sleep.efficiency","Age"))
Alcohol <- na.omit(Alcohol) #omit NA rows
Alcohol <- rename(count(Alcohol, Alcohol.consumption, Age), freq = n)
ggplot(Alcohol, aes(x=Age, y=Alcohol.consumption, size=freq )) + 
  geom_point(color = "blue",alpha=0.5) + 
  labs(title = "Alcohol Consumption by Age") +
  xlab("Age") +
  ylab("Alcohol.consumption") +
  theme_minimal() +
  scale_size(range = c(1, 10), name="Frequency")

# the correlation between alcohol consumption and sleep efficiency--------------
alcohol <- sleep_efficiency_data_frame %>% select(c("Alcohol.consumption","Sleep.efficiency"))
alcohol <- na.omit(alcohol) #omit NA rows
# Scatter plot with color-coded points by age group
ggplot(alcohol, aes(x = Alcohol.consumption, y = Sleep.efficiency)) +
  geom_boxplot(aes(group = Alcohol.consumption),fill="darkgoldenrod") +
  stat_summary(fun.y=mean, geom="point", shape=20, size=4, color="red", fill="red") +
  labs(x = "Alcohol Consumption", y = "Sleep Efficiency") +
  theme_minimal() + 
  labs(title = "Alcohol Consumption vs Sleep Efficiency")


# Visualization of Smoking Status-----------------------------------------------
smoking_count <- sleep_efficiency_data_frame %>% select(c("Smoking.status"))
smoking_graph <- barplot(table(smoking_count), main = "Smoking Status", xlab = "Status", ylab = "Count", 
                         border = c("blue", "red"), col = c("lightblue", "lightpink2"), ylim = c(0,350),
                         legend.text = c("No","Yes"), args.legend=list(cex=1, x= 2.3, y= 320), space = 0.1 ) 

abline(h=0)
text(x = smoking_graph,
     y = table(smoking_count),
     labels = as.data.frame(table(smoking_count))[[2]],
     pos = 3)


# Visualization of the effects of smoking on sleep efficiency-------------------
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

# Graph to show gender count----------------------------------------------------
lifestyle_gender_count <- lifestyle %>% select(c("Gender"))
lifestyle_gender_graph <- barplot(table(lifestyle_gender_count),
        main = "Gender Count",
        xlab = "Gender",
        ylab = "Count",
        border = c("red", "blue"),
        col = c("lightpink2","lightblue"),
        ylim = c(0,250),
        legend.text = c("Male","Female"), #maybe fix switch legend label to c("Female", "Male")
        args.legend=list(cex=1,x="topright"),
        space = 0.1)
abline(h=0)
text(x = lifestyle_gender_graph,
     y = table(lifestyle_gender_count),
     labels = as.data.frame(table(lifestyle_gender_count))[[2]],
     pos = 3)

# Graph to show age count-------------------------------------------------------
lifestyle_age_count <- lifestyle %>% select(c("Age"))
lifestyle_age_graph <- barplot(table(lifestyle_age_count),
                                  main = "Age Count",
                                  xlab = "Age",
                                  ylab = "Count",
                                  border = "blue",
                                  col = "lightblue1",
                                  ylim = c(0,40),
                                  legend.text = "Age",
                                  args.legend=list(cex=1,x="topright"),
                                  space = 0.1)
abline(h=0)
text(x = lifestyle_age_graph,
     y = table(lifestyle_age_count),
     labels = as.data.frame(table(lifestyle_age_count))[[2]],
     pos = 3)

# Graph to show age vs gender for this new data set-----------------------------
# Pie Chart of Occupation-------------------------------------------------------
job <- lifestyle %>% select(c("Occupation"))
job_count <- table(job)
# job_count # just to check values
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
# Comparing Sleep.Duration with different occupation
job_compare_sd <- lifestyle %>% select(c("Occupation","Sleep.Duration"))
# omit manager and sales Representative because theres not enough data
job_compare_sd <- job_compare_sd %>% filter(Occupation!="Manager"&Occupation!="Sales Representative")
# used fct_reorder to reorder the rows by median in the graph
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
  ylab("Occupation") + 
  labs(title = "Sleep Duration with Differnt Cccupation")

annotation <- textGrob("*Manager and Sales Representative have been \nremoved due to lack of data", gp=gpar(fontsize=8, fontface="italic"))

# Comparing quailty of sleep with different occupation--------------------------
job_compare_qs <- lifestyle %>% select(c("Occupation","Quality.of.Sleep"))
# omit manager and sales Representative because theres not enough data
job_compare_qs <- job_compare_qs %>% filter(Occupation!="Manager"&Occupation!="Sales Representative")
# used fct_reorder to reorder the rows by median in the graph
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
  ylab("Occupation")+ 
  labs(title = "Quality of Sleep with Differnt Cccupation")

annotation <- textGrob("*Manager and Sales Representative have been \nremoved due to lack of data", gp=gpar(fontsize=8, fontface="italic"))

# Comparing quailty of sleep with differnt occupation---------------------------
job_compare_stress <- lifestyle %>% select(c("Occupation","Stress.Level"))
# omit manager and sales Representative because theres not enough data
job_compare_stress <- job_compare_stress %>% filter(Occupation!="Manager"&Occupation!="Sales Representative")
# used fct_reorder to reorder the rows by median in the graph
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

# Scatter plot of physical activity compared to stress level--------------------
physical_activity_vs_stress <- lifestyle %>% select(c("Physical.Activity.Level","Stress.Level"))
ggplot(physical_activity_vs_stress, aes(x=Physical.Activity.Level, y=Stress.Level)) + 
  geom_point() + 
  labs(title = "Physical Activity Level vs Stress Level") +
  xlab("Physical Activity Level") +
  ylab("Stress Level") +
  theme(plot.title = element_text(hjust = 0.5))

# Bubble plot of Heart.Rate compared to quality of sleep------------------------
Heart.RatevsQuality.of.Sleep <- lifestyle %>% select(c("Quality.of.Sleep","Heart.Rate"))
Heart.RatevsQuality.of.Sleep <- rename(count(Heart.RatevsQuality.of.Sleep, Quality.of.Sleep, Heart.Rate), freq = n)
ggplot(Heart.RatevsQuality.of.Sleep, aes(x=Heart.Rate, y=Quality.of.Sleep, size=freq )) + 
  geom_point(color = "brown2",alpha=0.5) + 
  labs(title = "Heart.Rate vs Quality of Sleep") +
  xlab("Heart.Rate") +
  ylab("Quality.of.Sleepl") +
  theme_minimal() +
  scale_size(range = c(1, 25), name="Frequency")
  

# Pie Graph for Sleep Disorder--------------------------------------------------
disorder <- lifestyle %>% select(c("Sleep.Disorder"))
disorder_count <- table(disorder)
# disorder_count # to check values
disorder_label<- c("None", "Insomnia", "Sleep Apnea")
percent <- round(disorder_count/ sum(disorder_count)*100, 1)
disorder_label <- paste(disorder_label, percent, "%")

# Adjust margins
par(mar=c(2,2,2,2))
pie(disorder_count, labels = disorder_label, col= brewer.pal(n = 12, name="Set3"), main = "Sleep Disorder Count", radius = 1, clockwise = TRUE) 


# Graph to find correlation between sleep disorder and sleep duration-----------
sleep <- lifestyle %>% select(c("Sleep.Disorder","Sleep.Duration"))
ggplot(sleep, aes(x = Sleep.Disorder, y = Sleep.Duration)) +
  geom_boxplot(aes(group = Sleep.Disorder, fill= Sleep.Disorder)) +
  labs(x = "Sleep Disorder", y = "Sleep Duration") +
  stat_summary(fun.y=mean, geom="point", shape=20, size=4, color="red", fill="red") +
  theme_minimal()

# Graph to find correlation between sleep disorder and quality of sleep---------
sleep <- lifestyle %>% select(c("Sleep.Disorder","Quality.of.Sleep"))
ggplot(sleep, aes(x = Sleep.Disorder, y = Quality.of.Sleep)) +
  geom_boxplot(aes(group = Sleep.Disorder,fill= Sleep.Disorder)) +
  labs(x = "Sleep Disorder", y = "Quality of Sleep") +
  stat_summary(fun.y=mean, geom="point", shape=20, size=4, color="red", fill="red") +
  theme_minimal()

# Graph to find correlation between BMI and sleep quality-----------------------
sleep <- lifestyle %>% select(c("BMI.Category","Quality.of.Sleep"))
ggplot(sleep, aes(x=BMI.Category, y = Quality.of.Sleep)) +
  geom_boxplot(aes(group = BMI.Category, fill = BMI.Category)) +
  labs(x = "BMI Category", y = "Quality of Sleep") +
  stat_summary(fun.y=mean, geom="point", shape=20, size=4, color="red", fill ="red") +
  theme_minimal()

# Graph to find correlation between BMI and sleep duration----------------------
sleep <- lifestyle %>% select(c("BMI.Category","Sleep.Duration"))
ggplot(sleep, aes(x=BMI.Category, y = Sleep.Duration)) +
  geom_boxplot(aes(group = BMI.Category)) +
  scale_fill_manual(values=c("blue","green","red","cyan"))+
  labs(x = "BMI Category", y = "Quality of Sleep") +
  stat_summary(fun.y=mean, geom="point", shape=20, size=4, col="red", fill ="red") +
  theme_minimal()

# CECS 450 - Semester Project 
Project Contributors: Holly Lee, Ivy Ly, Daniel Moreno

## Table of Contents
- [Project Goal](#project-goal)
- [Technology Used](#technology-used)
- [Datasets](#datasets)
- [Definitions](#definitions)
- [Findings](#findings)
- [Conclusion](#conclusion)

## Project Goal
For our semester project, we decided to take a look into the world of sleep! We are trying to find correlations between how different factors contribute to the quality of sleep people experience.
Our goal is to find the factors that greatly contribute to the greatest amount and quality of sleep so everyone can enjoy a good night's rest.

## Introduction

## Technology Used
- [R Language](https://cran.rstudio.com/)
- [RStudio](https://posit.co/download/rstudio-desktop/)
- [GitHub](https://github.com/)

## Datasets
We used the following datasets that can be found on Kaggle:

- [Sleep Efficiency](https://www.kaggle.com/datasets/equilibriumm/sleep-efficiency)
- [Sleep Health and Lifestyle](https://www.kaggle.com/datasets/uom190346a/sleep-health-and-lifestyle-dataset)

## Definitions
- REM sleep- a kind of sleep that occurs at intervals characterized by rapid eye movements, more dreaming, bodily movement, and faster pulse and breathing. 

- NREM (Non- REM) sleep- 

## Findings

### The Affect of Age on Sleep Cycle
Understanding the sleep cycle helps explain how certain sleep disorders can impact a person's sleep and health. In a typical night, a person goes through 4- 6 sleep cycles (not all the same length, avg. 90 minutes each). The first cycle is often the shortest, ranging from 70- 100 minutes, while later cycles tend to fall between 90- 120 minutes. Sleep cycles can vary from person to person and from night to night based on a wide range of factors. There are 4 sleep stages: 3 Non-REM (NREM) sleep and REM sleep.

**Does Age Affect REM Sleep?**
In graph [], display a scatter plot relationship between a person's age and REM sleep measured in percentage. We are trying to test whether or not age affects the duration a person would spend in REM sleep. As we can see, the age varies from 9- 69 years old, and the majority spend between 15- 30% in REM sleep.

In graph [] includes the calculated correlation coefficient using the pearson correlation formula. Based on correlation coefficient calculation standards, the null hypothesis would be age doesn't effect REM sleep, while the alternative hypothesis would be age does effect REM sleep. From the calculation, the value of R is 0.042 which indicates it a weak, positive linear relationship between age and REM sleep percentage.The p- value is 0.37 meaning that we accept the null hypothesis. In other words, we accept the fact that age has no effect on REM sleep. 

On average, an adult would spend 25% in total in REM sleep. According to the graph, the average is ~22.6% in REM sleep.

**Does Age Affect Deep Sleep?**
In graph [], display a scatter plot relationship between a person's age and Deep sleep measured in percentage. We are trying to test whether or not age affects the duration a person would spend in Deep sleep. As we can see, the age varies from 9- 69 years old. Majority of the people would ~50- 78% in this stage, minority would ~20- 40%, and no one ~40-50%.

In graph [] includes the calculated correlation coefficient using the pearson correlation formula. Based on correlation coefficient calculation standards, the null hypothesis would be that age doesn't effect Deep sleep, while the alternative hypothesis would be that age does effect Deep sleep. From the calculation, the value of R is 0.022 which indicates it a weak, positive linear relationship between age and Deep sleep percentage.The p- value is 0.64 meaning that we accept the null hypothesis. In other words, we accept the fact that age has no effect on Deep sleep. 
On average, an adult would spend between 15-25% in total in Deep sleep. However, according to the graph, the average deep sleep is ~52.8%, which differs from the information stated above.

**Does Age Affect Light Sleep?**
In graph [], display a scatter plot relationship between a person's age and Light sleep measured in percentage. We are trying to test whether or not age affects the duration a person would spend in Light sleep. As we can see, the age varies from 9- 69 years old. Majority of the people would ~10- 27% in this stage, minority would ~40- 60%, and rarely no one ~30- 40% (one outlier).

In graph [] includes the calculated correlation coefficient using the pearson correlation formula. Based on correlation coefficient calculation standards, the null hypothesis would be that age doesn't effect Light sleep, while the alternative hypothesis would be that age does effect Light sleep. The value of R is -0.032 which indicates it a weak, negative linear relationship between age and Light sleep percentage.The p- value is 0.5 meaning that we accept the null hypothesis. In other words, we accept the fact that age has no effect on Light sleep. 

On average, an adult would spend ~50% in total in Light sleep. However, according the graph, the average light sleep is ~24.6%, which differs from the information stated above.

As mentioned earlier, there are a variety of factors that can influence a person's sleep cycle, so difficult to draw a reliable conclusion whether or not age affect on sleep efficiency given the limitation of the data.


###  Caffeine Consumption
In graph [1], we can see that although the majority of respondent does not drink coffee or any caffeine at all. People at age 25 - 40 drank 25mg to 75mg 24 hours prior to bed time. Lets see if caffeine consumption affect sleep efficiency

Although caffeine consumption is believed to worsen sleep quality, our dataset shows differently. In graph [], the median of sleep efficiency decreased slightly from 0.82 to 0.80 at 0mg to 50mg caffeine consumption. At 75 to 200mg caffeine consumption, the median of sleep efficiency goes up to 0.8 - 0.9. However, as shown in graph [1], the data for caffeine consumption above 100 mg is relatively small, so it's difficult to draw firm conclusions about the relationship between caffeine consumption and sleep efficiency at these higher levels.
Therefore, given the limitations of the data, it is not possible to say definitively whether caffeine consumption has a positive or negative impact on sleep efficiency. 

### Alcohol Consumption



## Conclusion


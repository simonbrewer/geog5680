# setwd("~/GEOG 5680/Final")
require(tidyverse)
clouds <- read_csv("clouds.csv")
clouds <- clouds %>% 
  mutate(echomotion_factor = factor(echomotion)) %>%
  mutate(seeding_factor = factor(seeding))



#Explore the difference in rainfall between seeding and non-seeding experiments
#by looking at the statistical characteristics (mean, sd, etc) of the experiments and by using visualization.
#Use a t-test to see whether there is a significant difference.

#give statistical characteristics of non-seeding (no) and seeding (yes) experiments

#make a summary df of statistical properties for different cloud types
summary_df <- clouds %>%
  group_by(seeding) %>%
  summarize(mean = mean(rainfall),
            sd = sd(rainfall),
            min = min(rainfall),
            max = max(rainfall),
            n = n()) %>%
  ungroup()

#create a vector for yes seeding
seeding_yes <- clouds %>% filter(seeding =="yes") %>% select(rainfall)

#create a vector for no seeding
seeding_no <- clouds %>% filter(seeding =="no") %>% select(rainfall)

#Use a t-test to see whether there is a significant difference (using vectors)
t.test(seeding_yes[[1]], seeding_no[[1]])

#from the t-test the difference in the mean of seeding clouds (X= 4.634) and non-seeding (y= 4.171) 
#is not statistically significant (based on p-value of 72.44%)

#plot of mean differences of seeding and non-seeding (not super useful plots)
ggplot(summary_df, aes(x= seeding, y= mean)) + geom_point()
ggplot(summary_df, aes(x= seeding, y= sd)) + geom_point()

#boxplot utilizing original data
boxplot(rainfall~seeding, clouds)

ggplot(clouds, aes(x= seeding, y= rainfall)) + geom_boxplot() + ggtitle("Rainfall of Seeding Vs. Non-seeding Clouds")


#Build a multiple linear regression model to model the effects of seeding on rainfall.
#Include cloudcover, prewetness, echomotion and 'sne' as independent variables.
#Explore the model using the summary() and anova() functions. 
#Which variables appear to influence rainfall the most?

#Linear model of seeding effects on rainfall
lm1 <- lm(rainfall ~ cloudcover + prewetness + echomotion + sne + seeding, data=clouds)

#get coefficients and model summary
summary(lm1)
#none of these variables were particularly significant 

#confirm with ANOVA sum of squares
anova(lm1)
#at the significance level of 0.1 sne is the only vaiable in a regression model that explains significant variance 
#echomotion and sne account for more of the varience than any other variable 
#based on the sum of squares (28.1 and 24.3 respectively)

###check the variables individually
plot(clouds$cloudcover, clouds$rainfall)
plot(clouds$prewetness, clouds$rainfall)
#ggplot(clouds, aes(x= rainfall, fill= echomotion)) + geom_histogram()
plot(clouds$sne, clouds$rainfall)


#As the suitability index (sne) appears to have a relationship with rainfall, 
#build two new models relating this variable to rainfall, 
#one for the seeding experiments, one for the non-seeding experiments.
#Compare the coefficients for the two models, and produce a figure showing the two models. 
#What does the difference in slope suggest?

no_seeding <- filter(clouds, seeding == "no")
yes_seeding <- filter(clouds, seeding == "yes")

#create a linear model for no seeding
lm2_no <- lm(rainfall ~ sne, no_seeding)
summary(lm2_no)
#no significant results 
#with no seeding, less tahn 10% of the variance was explained ny the model 
#For non-seeding clouds, there was a 1.046 decrease in the units of average rainfall for each one unit increase in suitability criteria 


#create a linear mdoel for yes seeding
lm2_yes <- lm(rainfall ~ sne, yes_seeding)
summary(lm2_yes)
#significant effect of sne
#sne explained 0.32 percent of overall variation in rainrainfall (R^2 model )

#For seeding clouds, there was a 2.218 decrease in the units of average rainfall for each one unit increase in suitability criteria 
lm3 <- lm(rainfall ~ seeding * sne, clouds)
summary(lm3)

#Create a figure showing the two models 
require("Hmisc")
ggplot(clouds, aes(sne, rainfall, color = seeding_factor)) +
  geom_smooth( method ='lm', se=FALSE)








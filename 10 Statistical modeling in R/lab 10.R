#Zachary Higgins
#Lab 10

#Read in the data
enroll=read.csv("enrollmentForecast.csv")

#Look at the data structure
str(enroll)
dim(enroll)
head(enroll)
summary(enroll)

#Make scatterplots of ROLL against the other variables
library(ggplot2)

roll.scat=ggplot(enroll, aes(y=ROLL))

plot1=roll.scat + geom_point(aes(x=YEAR))
plot2=roll.scat + geom_point(aes(x=HGRAD))
plot3=roll.scat + geom_point(aes(x=UNEM))
plot4=roll.scat + geom_point(aes(x=INC))

library(gridExtra)
grid.arrange(plot1,plot2,plot3,plot4,ncol=2)

#Build a linear model using the unemployment rate (UNEM) and number of spring high school graduates (HGRAD) to predict the fall enrollment (ROLL), i.e.
roll.mod=lm(ROLL ~ UNEM + HGRAD, data=enroll)
    #checking collinearity between UNEM/HGRAD  
cor(enroll$UNEM,enroll$HGRAD, method = "pearson")


#Use the summary() and anova() functions to investigate the model
summary(roll.mod)
anova(roll.mod)

     #Which variable is the most closely related to enrollment?
        ### HGRAD is more closely related, it has a smaller pvalue

#Make a residual plot and check for any bias in the model
 #Model diagnostics 
par(mfrow=c(2,2))
plot(roll.mod)

#Use the predict() function to estimate the expected fall enrollment, if the current year's unemployment rate is 9% and the size of the spring high school graduating class is 25,000 students
newUNEM=rep.int(9,29)
newHGRAD=rep.int(25000,29)
UNEM=enroll$UNEM
HGRAD=enroll$HGRAD
new.UNEM = data.frame(UNEM = newUNEM)
new.HGRAD = data.frame(HGRAD = newHGRAD)
predict(roll.mod, new.UNEM, new.HGRAD, interval = "prediction")


new.df = data.frame(UNEM = newUNEM, HGRAD = newHGRAD)
predict(roll.mod, new.df, interval = "prediction")

new.df = data.frame(UNEM = 9, HGRAD = 25000)
predict(roll.mod, new.df, interval = "prediction")

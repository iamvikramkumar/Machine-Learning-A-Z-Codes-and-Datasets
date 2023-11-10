#Predict Profit based on RD Spend, 
#Administration and
#Marking Spend.
#Whatever we are predicting is the dependent variable.
d1=read.csv("50_Startups.csv")
View(d1)
#eliminating State column
d1=d1[-4]
#renaming column names
colnames(d1)=c("RD_Spend","Administration",
               "Marketing_Spend","Profit")
#checking for missing values
sum(is.na(d1))
#checking the correlation between the dependent 
#with each independent variable individually
cor(d1$Profit,d1$RD_Spend)
cor(d1$Profit,d1$Administration)
cor(d1$Profit,d1$Marketing_Spend)

#splitting dataset
library(caTools)
split=sample.split(d1$Profit,SplitRatio = 0.8)
train=subset(d1,split==TRUE)
test=subset(d1,split==FALSE)

#Scaling the multiple independent variables
train[-4]=scale(train[-4])
test[-4]=scale(test[-4])

"""
Building the Regression Model
---The model which is trained to predict the 
continuous variable is known as Regressor.
---The model which is trained to predict the 
categorical variable is known as classifier
"""
regressor1=lm(formula=Profit~RD_Spend+Marketing_Spend, data=train)
y1=predict(regressor1,test[-4])
library(ModelMetrics)
rmse(y1,test$Profit)
summary(regressor1)



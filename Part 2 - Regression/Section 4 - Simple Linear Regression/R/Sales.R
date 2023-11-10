#Simple Linear Regression
# y=mx+c
#Load the dataset, Sales.csv
d1=read.csv(file.choose())
View(d1)
#Excuding unnecessary variables
d1=d1[-1]
#Re-labelling Variables
colnames(d1)=c("Sales","DollarsSpent")
#Correlation between dependent and independent variables
cor(d1$Sales,d1$DollarsSpent)
#missing values
sum(is.na(d1))
#splitting dataset
library(caTools)
split=sample.split(d1$DollarsSpent,SplitRatio = 0.75)
train=subset(d1,split==TRUE)
test=subset(d1,split==FALSE)
#Model implementation
regressor=lm(formula=DollarsSpent~Sales,data=train)
summary(regressor)
#predicting the test set results
pred=predict(regressor,test[1])
#evaluating the model
library(ModelMetrics)
rmse(test$DollarsSpent,pred)
d2=data.frame("Sales"=1000)
y1=predict(regressor,d2)
y1

"""Predict the depression_severity based on 
choice of predictors
"""
#Load the dataset
d1=read.csv(file.choose())
View(d1)
#Choose the dependent and independent variables
#depression_severity--dependent variable
d1=d1[c("age","bmi","phq_score","gad_score",
        "epworth_score","depression_severity")]
lapply(d1,summary)
table(d1$depression_severity)
sum(is.na(d1$depression_severity))
"""
Never replace missing values (NA) with mean in 
case of dependent variable. here we will remove the 
rows with NA in dependent column.
"""
d1=d1[complete.cases(d1[6]),]
sum(is.na(d1$depression_severity))
"""
Handle the missing values in epworth_score 
column using mean method
"""
lapply(d1,summary)
d1$epworth_score=ifelse(is.na(d1$epworth_score),
                        mean(d1$epworth_score,na.rm=T),
                        d1$epworth_score)
lapply(d1,summary)
"""
checking the datatype of dependent column--
it need to be factor,if not, 
we will convert it into factor
"""
table(d1$depression_severity)
class(d1$depression_severity)
d1$depression_severity=factor(d1$depression_severity,
                              levels=c("none","None-minimal","Mild",
                                       "Moderate","Moderately severe",
                                       "Severe"),
                              labels=c(0,1,2,3,4,5))
#no scaling bcz values range between 0 to 52 in independent columns
#splitting dataset
library(caTools)
split=sample.split(d1$depression_severity,SplitRatio = 0.75)
train=subset(d1,split==T)
test=subset(d1,split==F)
#Model1--knn
library(class)
classifier1=knn(train,test,cl=train$depression_severity,k=9)
library(caret)
confusionMatrix(classifier1,test$depression_severity)
#accuracy==90.21%
#Model2--Naive Bayes
library(e1071)
classifier2=naiveBayes(x=train[-6],y=train$depression_severity)
y2=predict(classifier2,test[-6])
library(caret)
confusionMatrix(y2,test$depression_severity)
#accuracy=96.39
#model3--decision tree
library(rpart)
classifier3=rpart(formula=depression_severity~.,data=train)
y3=predict(classifier3,test[-6],type='class')
confusionMatrix(y3,test$depression_severity)
#Accuracy=100%
d2=data.frame("age"=18,"bmi"=22.10029,"phq_score"=7,"gad_score"=12,"epworth_score"=9)
y0=predict(classifier3,d2,type='class')
y0
#model4--RandomForest
library(randomForest)
classifier4=randomForest(formula=depression_severity~.,data=train,ntrees=50)
y4=predict(classifier4,test[-6],type='class')
confusionMatrix(y4,test$depression_severity)
#Accuracy-100%
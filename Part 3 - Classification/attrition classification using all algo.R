"""
Implement 
--KNN
--Naive Bayes
--Decision Tree
--Random Forest
on IBM.CSV

Predict Attrition using
hourlyrate, monthlyincome and monthly rate
"""
d1=read.csv(file.choose())
View(d1)
d1=d1[c("Attrition","MonthlyIncome","MonthlyRate","HourlyRate")]
lapply(d1,summary)
sum(is.na(d1))
#scaling
d1[-1]=scale(d1[-1])
class(d1$Attrition)
d1$Attrition=factor(d1$Attrition,
                    levels=c("Yes","No"),
                    labels=c(1,0))
#splitting dataset
library(caTools)
t1=sample.split(d1$Attrition,SplitRatio = 0.75)
train1=subset(d1,t1==TRUE)
test1=subset(d1,t1==FALSE)
#Model1-KNN
library(class)
cl1=knn(train1[-1],test1[-1],k=22,cl=train1$Attrition)
library(caret)
confusionMatrix(cl1,test1$Attrition)

#Model2--Naive bayes
library(e1071)
cl2=naiveBayes(x=train1[-1],y=train1[1])
y1=predict(cl2,test1[-1])
library(caret)
confusionMatrix(y1,test1$Attrition)

#Model3--decision tree
library(rpart)
cl3=rpart(formula=Attrition~.,data=train1,
          method='class')
y2=predict(cl3,test1[-1],type='class')
confusionMatrix(y2,test1$Attrition)
#Model4--Random Forest
library(randomForest)
cl4=randomForest(formula=Attrition~.,data=train1)
y3=predict(cl4,test1[-1],type='class')
confusionMatrix(y3,test1$Attrition)

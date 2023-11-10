#You are provided with Age=38 and Estimated Salary=89000
#and you need to predict if the person will purchase the car or not.

#Load the dataset "Social_Network_Ads.csv"
d1=read.csv(file.choose())
View(d1)
str(d1)
d1=d1[3:5]
table(d1$Age)
table(d1$EstimatedSalary)
table(d1$Purchased)
class(d1$Purchased)
d1$Purchased=factor(d1$Purchased,levels=c(0,1))
class(d1$Purchased)
d1[-3]=scale(d1[-3])
summary(d1)
library(caTools)
set.seed(86)
split=sample.split(d1$Purchased,SplitRatio = 0.8)
split
train=subset(d1,split==TRUE)
test=subset(d1,split==FALSE)
View(train)
View(test)

library(e1071)
classifier=naiveBayes(x=train[-3],y=train[,3])
pred=predict(classifier,test[-3])


library(caret)
confusionMatrix(test[,3],pred)

d2=data.frame("Age"=38,"EstimatedSalary"=89000)
d2
p1=predict(classifier,d2)
p1










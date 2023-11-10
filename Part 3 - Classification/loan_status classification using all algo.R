d1=read.csv(file.choose())
View(d1)
"""
Problem: 
Predict the Loan Status based on Annual Income,
Loan amount, Loan term and CIBIL score.
"""
table(d1$loan_status)
sum(is.na(d1))
"""
only One dependent variable will be there.
The column or variable name given to be predicted
is the dependent variable.

Independent variable--1 or more than 1 column 
names given in problem statement used to 
predict a variable are termed as independent variable(s).

Choice of Algorithm:

1.using table(d1$dependent_variable), check if the 
dependent vaiable has classes or not.
2. If classes are there-- classification algo. 
to be used.
3. If table function result is multiple values 
with lesser frequency of occurence, then Regression 
algorithm should be used.
"""

class(d1$loan_status)
head(d1$loan_status)

#Encode the dependent variable to make it factor 
d1$loan_status=factor(d1$loan_status,
                levels=c(" Approved"," Rejected"),
                      labels=c(1,0))
colnames(d1)
#removing unecessary columns or variables
d1=d1[c("loan_status","income_annum",
        "loan_amount","loan_term","cibil_score")]
sum(is.na(d1))
View(d1)
#Splitting dataset
library(caTools)
split=sample.split(d1$loan_status,SplitRatio = 0.75)
train=subset(d1,split==TRUE)
test=subset(d1,split==FALSE)

#scaling independent variables
train[-1]=scale(train[-1])
test[-1]=scale(test[-1])

#Model Building--knn, naive bayes, decision tree
library(class)
classifier1=knn(train=train,test=test,k=9,cl=train$loan_status)
library(caret)
confusionMatrix(classifier1,test$loan_status)

library(e1071)
classifier2=naiveBayes(x=train[-1],y=train$loan_status)
y2=predict(classifier2,test[-1])
library(caret)
confusionMatrix(y2,test$loan_status)

library(rpart)
classifier3=rpart(formula=loan_status~.,data=train)
library(randomForest)

#ensemble algorithm-combining multiple algorithms-
#Random forest is combination of multiple decision trees
classifier4=randomForest(x=train[-1],y=train$loan_status,
                         ntrees=100)
y3=predict(classifier4,test[-1])
library(caret)
confusionMatrix(y3,test$loan_status)

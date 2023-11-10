"""
Predict the Loan Amount using Annual Income,
cibil score and loan term.
"""
d1=read.csv(file.choose())
View(d1)
#Eliminating unnecessary columns
d1=d1[c("income_annum","loan_amount","loan_term","cibil_score")]
#renaming columns
colnames(d1)[1]="annual_income"
#checking the missing values
sum(is.na(d1))
cor(d1$loan_amount,d1$annual_income)
cor(d1$loan_amount,d1$loan_term)
cor(d1$loan_amount,d1$cibil_score)
d1=d1[-3]
#splitting dataset
library(caTools)
t1=sample.split(d1$loan_amount,SplitRatio = 0.75)
train3=subset(d1,t1==TRUE)
test3=subset(d1,t1==FALSE)

View(d1)
#scaling
train3[-2]=scale(train3[-2])
test3[-2]=scale(test3[-2])
#Multiple Linear regression
r1=lm(formula=loan_amount~.,data=train3)
y1=predict(r1,test3[-2])
library(ModelMetrics)
rmse(y1,test3$loan_amount)
d2=data.frame("annual_income"=960000,
              "cibil_score"=875)
y2=predict(r1,d2)
y2

#polynomial regression
d1$x2=d1$annual_income^2
d1$x3=d1$annual_income^3
cor(d1$loan_amount,d1$x2)
cor(d1$loan_amount,d1$x3)
#scaling again
d1[-2]=scale(d1[-2])
#splitting dataset again
library(caTools)
t2=sample.split(d1$loan_amount,SplitRatio = 0.75)
train4=subset(d1,t2==T)
test4=subset(d1,t2==F)
View(test4)
r2=lm(formula=loan_amount~annual_income+x2+x3,
      data=train4)
y2=predict(r2,test4[c(-2,-3)])
library(ModelMetrics)
rmse(y2,test4$loan_amount)
d2=data.frame("annual_income"=960000,
              "x2"=960000^2,"x3"=960000^3)
y3=predict(r2,d2)
y3



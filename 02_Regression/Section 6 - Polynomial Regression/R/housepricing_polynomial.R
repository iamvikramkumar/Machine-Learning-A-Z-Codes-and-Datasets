d2=read.csv(file.choose())
View(d2)
d2=d2[c("SalePrice","LotFrontage","GarageArea")]
View(d2)
sum(is.na(d2))
missing=d2[!complete.cases(d2),]
View(missing)
d2$LotFrontage=ifelse(is.na(d2$LotFrontage),
                      mean(d2$LotFrontage,na.rm=TRUE),
                      d2$LotFrontage)
#splitting dataset
library(caTools)
split=sample.split(d2$SalePrice,SplitRatio=2/3)
train2=subset(d2,split==TRUE)
test2=subset(d2,split==FALSE)
#scaling
train2[-1]=scale(train2[-1])
test2[-1]=scale(test2[-1])
View(train2)
View(test2)
#Building MLR multiple linear regression
regressor1=lm(formula=SalePrice~.,data=train2)
summary(regressor1)
ypred1=predict(regressor1,test2[-1])

#applying Polynomial regression

d2$LotFrontage2=d2$LotFrontage^2
d2$LotFrontage3=d2$LotFrontage^3
d2$LotFrontage4=d2$LotFrontage^4
View(d2)
#splitting dataset
library(caTools)
split=sample.split(d2$SalePrice,SplitRatio=2/3)
train3=subset(d2,split==TRUE)
test3=subset(d2,split==FALSE)
#scaling
train3[-1]=scale(train3[-1])
test3[-1]=scale(test3[-1])
View(train3)
View(test3)
regressor2=lm(formula=SalePrice~.,data=train3)
ypred2=predict(regressor2,test3[-1])
summary(regressor1)
summary(regressor2)

library(ModelMetrics)
rmse(ypred1,test2$SalePrice)
rmse(ypred2,test3$SalePrice)

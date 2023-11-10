d2=read.csv(file.choose())
View(d2)
#Dataset- housepricing.csv
#Predict the SalePrice of a house if LotFrontage,
#LotArea,GarageArea and OverallCond are known to you
d2=d2[c("SalePrice","LotFrontage","GarageArea")]
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
#Building MLR multiple linear regression
regressor=lm(formula=SalePrice~.,data=train2)
summary(regressor)
ypred=predict(regressor,test2)
library(ModelMetrics)
rmse(ypred,test2$SalePrice)

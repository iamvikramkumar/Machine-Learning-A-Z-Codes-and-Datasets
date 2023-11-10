# Naive Bayes

# Importing the dataset
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]
View(dataset)
# Encoding the target feature as factor
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

View(training_set)
View(test_set)

# install.packages('e1071')
library(e1071)
classifier = naiveBayes(x = training_set[-3],
                        y = training_set$Purchased)

pred=predict(classifier,test_set[-3])
pred

d1=data.frame("Age"=27,"EstimatedSalary"=137000)
pred1=predict(classifier,d1)
pred1


# Making the Confusion Matrix
library(caret)
confusionMatrix(test_set[,3],pred)

dataitem=data.frame("Age"=35,"EstimatedSalary"=67950)
ypred=predict(classifier,newdata = dataitem)
ypred
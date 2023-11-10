# Support Vector Machine (SVM)

# Importing the dataset
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]
View(dataset)
sum(is.na(dataset))
colnames(dataset)
class(dataset$Purchased)
# Encoding the target feature as factor
dataset$Purchased = factor(dataset$Purchased, 
                           levels = c(0, 1))
#Scaling
dataset[-3]=scale(dataset[-3])

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

# Fitting SVM to the Training set
#knn
library(class)
cl1=knn(training_set,test_set,cl=training_set$Purchased,k=70)
library(caret)
confusionMatrix(cl1,test_set$Purchased)
#naive bayes
library(e1071)
Nb=naiveBayes(x=training_set[-3],y=training_set[3])
y1=predict(Nb,test_set[-3])
library(caret)
confusionMatrix(y1,test_set$Purchased)


library(e1071)
classifier = svm(formula = Purchased ~ .,
                 data = training_set,
                 type = 'C-classification', 
                 kernel='linear')
 
# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-3])
confusionMatrix(y_pred,test_set$Purchased)

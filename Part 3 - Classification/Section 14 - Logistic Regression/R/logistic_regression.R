# Logistic Regression

# Importing the dataset
dataset = read.csv('Social_Network_Ads.csv')
View(dataset)
dataset = dataset[3:5]
View(dataset)
table(dataset$Purchased)
# Encoding the target feature as factor
dataset$Purchased = factor(dataset$Purchased,
                             levels = c(0, 1))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)

split = sample.split(dataset$Purchased, SplitRatio = 0.7)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
head(training_set)

# Feature Scaling
training_set[-3]= scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
head(training_set[-3])

head(test_set)
# Fitting Logistic Regression to the Training set
classifier = glm(formula = Purchased ~ .,
                 family = "binomial",
                 data = training_set)

# Predicting the Test set results
prob_pred = predict(classifier, newdata = test_set[-3],type='response')
y_pred = ifelse(prob_pred > 0.5, 1, 0)

# Making the Confusion Matrix   
cm = table(test_set[, 3], y_pred )
cm

x=scale(as.data.frame('Age'=25,'EstimatedSalary'=35000))
predict(classifier,newdata = x, type='response')
library(caret)
confusionMatrix(test_set[,3],y_pred)


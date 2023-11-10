# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('Salary_Data.csv')
View(dataset)
# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 0.8)
split
training_set = subset(dataset, split == TRUE)
training_set
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)
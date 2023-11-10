# SVR

# Importing the dataset
dataset = read.csv(file.choose())
View(dataset)
dataset=dataset[7:9]

# Splitting the dataset into the Training set and Test set
install.packages('caTools')
 library(caTools)
 set.seed(123)
 split = sample.split(dataset$Deaths, SplitRatio = 2/3)
 training_set = subset(dataset, split == TRUE)
 test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fitting SVR to the dataset
# install.packages('e1071')
library(e1071)
regressor = svm(formula = Deaths ~ .,
                data = dataset)

# Predicting a new result
y_pred = predict(regressor, data.frame(Confirmed = 1270,Cured=78))
y_pred

# Visualising the SVR results
# install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Cured, y = dataset$Deaths),
             colour = 'red') +
  geom_line(aes(x = dataset$Cured, y = predict(regressor, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff (SVR)') +
  xlab('Cured') +
  ylab('Deaths')


# K-Means Clustering
# Importing the dataset
dataset = read.csv('Mall_Customers.csv')
View(dataset)
dataset = dataset[4:5]
View(dataset)

# Using the elbow method to find the optimal number of clusters
set.seed(6)
wcss = vector()
for (i in 1:10) 
        {
        wcss[i] = sum(kmeans(dataset, i)$withinss)
        }
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')


# visualization
kmeans1= kmeans(x=dataset,centers=4,nstart = 10)
kmeans2= kmeans(x=dataset,centers=6,nstart = 12)
kmeans1$withinss
kmeans1$iter
kmeans1$cluster
library(ggplot2)
#install.packages('ggfortify')
library(ggfortify)

plot1=autoplot(kmeans1,dataset,frame= TRUE)
plot2=autoplot(kmeans2,dataset,frame= TRUE)

library(gridExtra)
grid.arrange(plot1,plot2,nrow=1)

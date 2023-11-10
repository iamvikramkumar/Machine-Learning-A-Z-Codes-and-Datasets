# Data Preprocessing

# Importing the dataset
dataset = read.csv('Data.csv')
View(dataset)
str(dataset)
is.na(dataset)
sum(is.na(dataset))
miss=dataset[!complete.cases(dataset),]
miss
which(is.na(dataset))
colnames(dataset)=c("Country","Age","Salary","Tax Paid")
colnames(dataset)
names(dataset)
setNames(dataset,c("a","b","Salary","Tax Paid"))

names(dataset)<- c("Country","Age","Salary","Purchased")
str(dataset)

sum(is.na(dataset))
View(dataset)
dataset$Age=ifelse(is.na(dataset$Age),
                   mean(dataset$Age,na.rm=TRUE),
                   dataset$Age)



# Taking care of missing data
dataset$Age=ifelse(is.na(dataset$Age),
                  ave(dataset$Age, 
                  FUN = function(x) mean(x, na.rm = TRUE)),
                    dataset$Age)
dataset$Salary=ifelse(is.na(dataset$Salary),
                  ave(dataset$Salary, 
                  FUN = function(x) mean(x, na.rm = TRUE)),
                    dataset$Salary)
sum(is.na(dataset))
View(dataset)
str(dataset)


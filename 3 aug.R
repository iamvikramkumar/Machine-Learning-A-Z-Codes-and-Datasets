d1=data.frame(Name=c('Veer','Jai','Ajay','Vijay'),
  Age=c(13,15,18,20),
  Section=c('KM023','KM024','KM045','KM009'),
  CGPA=c(8.9,7.5,8,9))
d1

{
  Name=c()
  Age=c()
  Section=c()
  CGPA=c()
  n=as.integer(readline('Enter no. of students:'))
  for(i in 1:n)
  {
    Name[i]=readline()
    Age[i]=as.integer(readline())
    Section[i]=readline()
    CGPA[i]=as.numeric(readline())
  }
  d2=data.frame(Name,Age,Section,CGPA)
  d2
}
write.csv(d2,file = "Dataframe1.csv")
d3=data.frame()
d3=edit(d3)
d3

save(d1,d2,d3,file="File2.RData")

#Load the dataset data.csv
data1=read.csv('Data.csv')
data1
colnames(data1)
colnames(data1)=c('Country',
                  'Age',
                  'Salary',
                  'Tax Paid')
data1
sum(is.na(data1))
data1[!complete.cases(data1),]
which(is.na(data1))
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
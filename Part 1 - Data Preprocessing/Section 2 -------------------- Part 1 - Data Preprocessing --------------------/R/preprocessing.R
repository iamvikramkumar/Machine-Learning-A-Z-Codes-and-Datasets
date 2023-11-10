
"""
Load Mall_Customers.csv file and 
do the data preprocessing steps
"""
1. knowing about particular variables
2. structure of datasets
3. removing unnecessary varaibles
4. Re-Labelling the variables
5. handling categorical variables
6. Missing value

d1=read.csv("Data.csv")
View(d1)
str(d1)
summary(d1)

colnames(d1) 
colnames(d1)=c("Country","Age","Salary","Tax paid")
table(d1$Country)
d1$Country=factor(d1$Country,
                  levels=c("France","Germany","Spain"),
                  labels=c(0,1,2))

d1=d1[,-1]
d1=d1[,c(2,3)]
is.na(d1)
sum(is.na(d1))
which(is.na(d1))
miss=d1[!complete.cases(d1),]
miss
d1$Age=ifelse(is.na(d1$Age),
              mean(d1$Age,na.rm=TRUE),
              d1$Age)
d1$Salary=ifelse(is.na(d1$Salary),
              mean(d1$Salary,na.rm=TRUE),
              d1$Salary)









d1=read.csv("Mall_Customers.csv")
View(d1)
str(d1)
colnames(d1)
colnames(d1)[2]="Gender"
colnames(d1)=c("C_ID","Gender","Age","Annual Income","Spending Score")
d2=d1[,c(1,4,5)]
View(d2)
d3=d1[,c(-2,-3)]
View(d3)
table(d2$`Annual Income`)
table(d2$`Spending Score`)
range(d2$`Annual Income`)
range(d2$`Spending Score`)
d2[125,2]
d2[125,2]=NA
d2[125,2]
d2[10:15,3]=NA
is.na(d2)
sum(is.na(d2))
m=d2[!complete.cases(d2),]
View(m)
d2$`Annual Income`=ifelse(is.na(d2$`Annual Income`),
                          round(mean(d2$`Annual Income`,na.rm=TRUE)),
                          d2$`Annual Income`)

d2$`Spending Score`=ifelse(is.na(d2$`Spending Score`),
                           round(mean(d2$`Spending Score`,na.rm=TRUE),
                           d2$`Spending Score`)
sum(is.na(d2))
d4=read.csv("Data.csv")
d4
table(d4$x1)
d4$x1=factor(d4$x1,levels = c("France","Germany","Spain"),
                              labels=c(1,2,3))
d4





df1=read.csv(file.choose())
View(df1)
df1=df1[,-1]
colnames(df1)[3]="Annual Income"
colnames(df1)[4]="Spending Score"
df1[200,2]=NA
df1[2,2]=NA
df1[17,2]=NA
df1[23,4]=NA
df1[30,4]=NA


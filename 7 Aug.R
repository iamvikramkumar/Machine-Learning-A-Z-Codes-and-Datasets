"""
1. Write a program to take different input 
from user and store them in different 
datatypes."""
{
a=readline("Enter a character")
b=as.numeric(readline("Enter a number"))
c=as.logical(readline("Enter a logical value"))
d=as.complex(readline("Enter an integer"))
e=as.integer(readline("Enter an integer value"))
}
a
b
c
d
e


{a=readline("Enter a character")
b=as.numeric(readline("Enter a numeric:"))
c=as.logical(readline("Enter a logical value"))
d=as.complex(readline("Enter a complex number"))
e=as.integer(readline("Enter an integer"))
a
b
c
d
e}

#1.LIST
fun2=function(Name,Age)
{

}
{
n=as.integer(readline("Enter no. of students"))
Name=c()
Age=c()
for (i in 1:n)
{
  Name[i]=readline()
  Age[i]=as.integer(readline())
}
list1=list(Name,Age)
list1
}
"""
2.VECTOR
3.ARRAY
4.MATRIX
"""

m1=matrix(c(12,15,20,26,56,758,56,6,7,43,3,442,4,454,54,46),
          nrow=3,byrow=TRUE)
m1

{
  data=c()
  for(i in 1:10)
  {
    data[i]=as.numeric(readline())
  }
  
  mat2=matrix(data,nrow=3,ncol=3,byrow=TRUE)
  mat2
}
"""
5.DATAFRAME
6.FACTOR
"""
bloodgroup=factor(c('A+','AB+','O-','B+','A+','B+','O+'),
                  levels=c('A+','B+','O+'),labels = c(1,2,3))

bloodgroup

save(list1,m1,file="File4.RData")
load("File4.RData")
list1
m1
ls()



#write a code to check if the 
#entered number is odd or even
{n=as.numeric(readline("Enter a number"))
  if(n==0)
    print("ZERO")
  else if (n%%2==0)
    print("EVEN")
  else
    print("ODD")}
#Take 2 vectors and do the following operations:
1.A-B
2.A+B
3.A*B
4.A%B
5.A/B
v1=c(1.2,2.5,7,9,8)
v2=c(17,18,3,2,10)
v1-v2
v1*v2
v1%/%v2
v1%%v2
v1^v2
  





















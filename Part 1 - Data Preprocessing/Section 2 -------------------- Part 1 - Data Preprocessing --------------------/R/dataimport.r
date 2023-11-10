file1=read.csv("Data.csv")
View(file1)

install.packages(readxl)
library(readxl)
file2=read_xls(file.choose())
View(file2)





library(DataExplorer)

# Read flavors_of_cacao data using read.table function
#Choco <- read.table("flavors_of_cacao.csv", sep = ",")
Chacolate <- read.csv("flavors_of_cacao.csv", header = T)
#Chacolate$CompanyLocation [1:4[]
View(Chacolate[1:90, "CompanyLocation"])

emp.data <- read.table("EmployeeSales.txt", header = T, sep = ",", quote = "\"")
print(emp.data)
list.files()

# Once it is installed you do not need it again simply execute below libraries
#install.packages("tidyverse")
#install.packages("dbplyr")
#install.packages("DBI")
#install.packages("RSQLite")

library(tidyverse)
library(dbplyr)
library(DBI)
library(RSQLite)

chinook <- DBI::dbConnect(
  drv = RSQLite::SQLite(),
  dbname = "chinook.db"
)

employees <- dplyr::tbl(chinook, "employees")
customers <- dplyr::tbl(chinook, "customers")
invoices <- dplyr::tbl(chinook, "invoices")
invoice_items <- dplyr::tbl(chinook, "invoice_items")

qry <- "SELECT HireYear, COUNT(EmployeeId) FROM
(SELECT SUBSTR(HireDate, 1, 4) AS HireYear, EmployeeId
FROM employees)
GROUP BY HireYear"

DBI::dbGetQuery(chinook, qry)

employees_by_hire_year <- employees %>% 
  dplyr::mutate(HireYear = substr(HireDate, 1, 4)) %>% 
  dplyr::group_by(HireYear) %>% 
  summarize(Total = n())

employees_by_hire_year




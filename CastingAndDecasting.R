setwd("C:/Users/surya/Desktop")

#Creating the tables
tableA <- data.frame("product" = c(100, 101, 102),
                     "tags" = c("chocolate, sprinkles", "chocolate, filled", "glazed"))

tableB <- data.frame("customer" = c('A', 'A', 'B', 'C', 'C', 'B', 'A', 'C'),
                     "product" = c(100, 101, 101, 100, 102, 101, 100, 102))

tableA
tableB

library(tidyr)
newA = separate_rows(tableA, "tags")
newA

joinData = merge(newA, tableB, by=c('product'))
joinData

library(dplyr)

summary =joinData %>%
  group_by(customer, tags) %>%
  summarise(count=n())

summary=data.frame(summary)
summary

library(reshape2)
finaldata1 = recast(summary, customer ~ tags, id.var = c("tags", "customer"))
finaldata1

finaldata1[,c(1,2,5,3,4)]

library(data.table) ## or library(reshape2)
finaldata2 = ?dcast(melt(as.data.table(joinData), id.vars = c("tags", "customer")), 
      customer ~ tags, value.var = "value")
finaldata2

#Input Format:
#The first element indicates the number of elements present in the vector (excluding the first element).
#The operation must be performed from the 2nd element. 
#Output Format:
#Print in a single line the number of duplicates present.
#Sample Input:
# [5,1,2,2,3,3]
#Sample Output:
#2
#Explanation:
#The first element indicates that there are 5 other elements in the list. 
#1 occurs once, 2 occurs twice and 3 occurs twice. Hence, there are 2 duplicates: 2 and 3.
#So the required answer will be 2.

#SOLUTION:

# Enter your code here. Read input from STDIN. Print output to STDOUT
library(data.table)
#data = suppressWarnings(readLines(file("stdin")));
data= c(7,2,2,1,3,3,4,4)
newdata = data[2:length(data)]
newdata = data.table(table(newdata))
countDuplicates = function(newdata)
{    
  c=sum(newdata[,N]>1);
  return(c)
}
cat(countDuplicates(newdata))
#3

#--------------------------------------------------------------------------------------------

#Given a vector, return the element with its frequency
datatable = table(data)
data.frame(datatable)
#  data Freq
#1    1    1
#2    2    2
#3    3    2
#4    4    2
#5    7    1

#--------------------------------------------------------------------------------------------

#Given a vector, remove duplicates and return only the unique elements
data= c(7,2,2,1,3,3,4,4)
unique(data)
#[1] 7 2 1 3 4

#--------------------------------------------------------------------------------------------



#You are given a list(1-indexed) of size 'n', initialized with zeroes. 
#You have to perform 'm' operations on the list and output the maximum of final values of all the 'n' elements in the list. 
#For every operation, you are given three integers 'a', 'b' and 'k' and you have to add value 'k' to all the elements ranging from index 'a' to 'b' (both inclusive).

#For example, consider a list 'a' of size 3. 
#The initial list would be a = [0, 0, 0] and after performing the update 0(a, b, k) = (2, 3, 30), the new list would be a = [0, 30, 30]. 
#Here, we've added value 30 to elements between indices 2 and 3. Note the index of the list starts from 1.

#Input Format
#The first line will contain two integers 'n' and 'm' separated by a single space.
#Next 'm' lines will contain three integers a, b and k separated by a single space.
#Numbers in list are numbered from 1 to n.

#Output Format
#Print in a single line the maximum value in the updated list.

#Sample Input:
#5 3
#1 2 100
#2 5 100
#3 4 100

#Sample Output:
#200

#Explanation:
#After first update list will be 100 100 0 0 0. 
#After second update list will be 100 200 100 100 100.
#After third update list will be 100 200 200 200 100.
#So the required answer will be 200.

#Enter your code here. Read input from STDIN. Print output to STDOUT

#SOLUTION:
list = suppressWarnings(readLines(file("stdin")));
x= list[1]
space = gregexpr(pattern =' ', x)[[1]][1]
first =substring(x, 1, space)
first  = as.numeric(first)
last =substring(x, space, nchar(x))
last  = as.numeric(last)
array = array(rep(0, first))
for(i in 1:last)
{
  y = list[i+1]
  space1 = gregexpr(pattern =' ', y)[[1]][1]
  space2 = gregexpr(pattern =' ', y)[[1]][2] 
  first = substring(y, 1, space1)
  first  = as.numeric(first)
  middle = substring(y, space1, space2)
  middle  = as.numeric(middle)
  last = substring(y, space2, nchar(y))
  last  = as.numeric(last)
  for(j in first:middle){
    array[j]=array[j]+last
  }
}
cat(max(array))
#--------------------------------------------------------------------------------------------

#Sample Input:
list <- list("5 3", "1 2 100", "2 5 100", "3 4 100")
list = list("4 3", "2 3 603", "1 1 286", "4 4 882")
#print(list)
x= list[1]
space = gregexpr(pattern =' ', x)[[1]][1]
#space
first =substring(x, 1, space)
first  = as.numeric(first)
#first
last =substring(x, space, nchar(x))
last  = as.numeric(last)
#last
array = array(rep(0, first))
#array
for(i in 1:last)
{
  y = list[i+1]
  space1 = gregexpr(pattern =' ', y)[[1]][1]
  #space1
  space2 = gregexpr(pattern =' ', y)[[1]][2]
  #space2 
  first =substring(y, 1, space1)
  first  = as.numeric(first)
  #first
  middle =substring(y, space1, space2)
  middle  = as.numeric(middle)
  #middle
  last =substring(y, space2, nchar(y))
  last  = as.numeric(last)
  #last
  for(j in first:middle){
    array[j]=array[j]+last
  }
}
#array
#286 603 603 882
cat(max(array))
#882

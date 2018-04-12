#Concatenation in R using Paste:
#Understanding Sep Vs Collapse

x=c("AAA", "BBB", "CCC")
y= c(1, 2, 3)

# When you use 'paste' for multiple vectors, 'sep' defines what
# separates the entries in those tuple-wise concatenations.
# 
# When you use paste a *collapse* value, it will return
# any concatenated pairs as part of a single length - 
# a one character vector, with the tuples separated by 
# the string you passed to 'collapse'

#Sep
paste(x, y, sep = "%%%")
#"AAA%%%1" "BBB%%%2" "CCC%%%3"

#Collapse
paste(x, y, collapse = "%%%")
#"AAA 1%%%BBB 2%%%CCC 3"

x <- c("a", "b", "c", "d")
y <- c("w", "x", "y", "z")

#Sep
paste(x,y, sep="%")
"a%w" "b%x" "c%y" "d%z"

#Collapse
paste(x,y, collapse="%")
"a w%b x%c y%d z"

paste("Hello", "world", sep=",")
#"Hello,world"
paste("Hello", "Hey", "world", sep =",")
#"Hello,Hey,world"
paste("Hello", "world", collapse =",")
#"Hello world"

#Some more examples:

paste(c("The", "quick", "brown", "fox"))
#"The"   "quick" "brown" "fox"
paste(c("The", "quick", "brown", "fox"), sep =" ")
#"The"   "quick" "brown" "fox"
paste(c("The", "quick", "brown", "fox"), collapse =" ")
#"The quick brown fox"
paste(c("The", "quick", "brown", "fox"), collapse ="/")
#"The/quick/brown/fox"
paste(LETTERS[1:5], 1:5, sep="%", collapse="///")
#"A%1///B%2///C%3///D%4///E%5"

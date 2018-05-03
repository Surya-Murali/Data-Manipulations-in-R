#Read File
csv_file = read.csv("/file/path.csv", header = FALSE)

#Write File
write.csv(data_frame, file = "/file/path.csv", row.names=FALSE)

#Prints first 5 rows of a data frame
head(data_frame) 

#Prints last 5 rows of a data frame
tail(data_frame)

#Prints the number of rows of a data frame
nrow(data_frame)

#Prints the number of columns of a data frame
ncol(data_frame)

#Filtering Data Frames
fileteredData = data_frame[which(data_frame$column_name > 1), ]

summary(data_frame$column_name)
str(data)

#Create a new column using existing column values
data$ratio = as.numeric(data$weight/data$height)

#Format a column as date time
data$start_time = as.POSIXct(data$start_time, format="%d/%m/%Y %H:%M:%S")
#This enables you to do filtering as shown below
filtered = data[which(data$start_time >= "2017-02-18 16:00:00"), ]

#Find percentage contribution of each distinct value in a column
as.data.frame(prop.table(table(data_frame$column_name)) * 100)

#Find data types of each column
sapply(data_frame, class)

#Find all distinct values from a column
unique(data_frame$column_name)

#Rename a column
colnames(data_frame)[column_index] <- "new_name"

#In operator
data$column_name %in% some_other_data[, "column_name"]))

#Take subset of data using Not In operator
data_subset = subset(data_to_subset, !(data_to_subset$column_name %in% some_other_data[, "column_name"]))

#Concatenate two columns
data$concatenated = paste(data$column_one, data$column_two, sep="-")

#Extract column as data frame
new_data_frame = as.data.frame( data_frame[,"column_name"], drop=false)

#Scatterplot
plot(data_frame$column1, data_frame$column2, main="title", xlab="x-label ", ylab="y-label", pch=19, col=factor(data_frame$color_column))

#Plot a histogram (requires package ggplot2)
qplot(column_name, data=data, bins = 100, main="title", ylim=c(0, 1000))

#Plot overlaying histograms based on column values
ggplot(data, aes(x=column_to_plot, fill=column_for_visual_separation)) +
geom_histogram(alpha=0.5, position="identity", binwidth=10)

#Box plot
boxplot(column_to_plot ~ column_for_unique_plots, data=data, ylab = "title")

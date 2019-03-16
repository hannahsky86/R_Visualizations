# Assignment-Chapter 1&2 (100 points)
# Student Name:Hannah Roach
# ID: 678363897
#   
# 1.	What is the difference between package and library? (5 points)
# A library is a directory and contains a set of packages. 
# A package is a set of functions and data. A package belongs to a library. A package is also a namespace. 



# 2.	Assume there is a CSV file where has header and separated using semicolon. 
# Please write down the functions to load this file with header. 
# Save the CSV file into xlsx format, and 
# write down the functions to load the first sheet of this xlsx file with header. 
# (10 points)
install.packages(c("ggplot2", "gcookbook"))
library(gcookbook)
install.packages("xlsx")
library(xlsx)

data1 <- read.csv("datafile.csv", sep=";")
write.xlsx(data1, "/Users/hannahroach/Desktop/R_Projects/Assignments/dataexport.xlsx")
data2 <- read.xlsx("dataexport.xlsx", 1)


# 3.	Please 
# create two vectors. 
# One is a vector of 100 normal random variables with mean 5 and standard deviation 2. 
# Another is a vector of 100 normal random variables with mean 15 and standard deviation 3. 
# Please use three different functions to create a scatter plot with two vectors, 
# and write down all functions. 
# Then use three different functions to create a line graph with two vectors, 
# and write down all functions. (20 points)
library(ggplot2)

rn_vector1 <- rnorm(100,5,2)
rn_vector2 <- rnorm(100,15,3)

qplot(rn_vector1, rn_vector2)
plot(rn_vector1, rn_vector2)
ggplot(NULL,aes(x=rn_vector1,y=rn_vector2))+geom_point()

plot(rn_vector1, rn_vector2, type = "l")
qplot(rn_vector1, rn_vector2, geom = "line")
ggplot(, aes(rn_vector1, rn_vector2)) + geom_line() + geom_point()


# 4.	Please create a data frame. 
# There are two columns in the frame: one is students’ name and another is class score. 
# There are 5 students totally. (5 points)

name <- c("Bob", "Rusty", "Frank", "Fredrick", "Christopher")
class_score <- c(100, 40, 80,95, 95)
df = data.frame(name, class_score)


# 5.	Using the above data frame to create a bar graph using two ways. (10 points)
barplot(df$class_score, names.arg = df$name)
ggplot(df, aes(x = name, y = class_score)) + geom_bar(stat = "identity")


# 6.	Using the above data frame to create a histogram using three ways. (15 points)
hist(df$class_score, xlab = "Score", ylab = "Count", breaks = 10 )
qplot(class_score, data = df, binwidth = 5)
ggplot(df, aes(x = class_score)) + geom_histogram(binwidth = 5)

# 7.	Please create a data frame.  There two columns in the frame:  one is instructors’ names and another is student numbers. 
# There are 5 rows totally, and 2 instructors.  Each instructor can have several student numbers and appear several times. (5 points)
numbers = c(100, 40, 80,95, 95)
names = c("Bilzo", "Bilzo", "Sally", "Sally", "Sally")
df_students_names <- data.frame(matrix(c(names, numbers),nrow=5, ncol=2))
colnames(df_students_names) <- c("Names", "Numbers")

# 8.	Use this data frame to draw a boxplot using three ways (15 points)
boxplot(numbers ~ factor(names), data = df_students_names)
ggplot(df_students_names, aes(x=(names), y=numbers)) + geom_boxplot()
qplot(names, numbers, data=df_students_names, geom ="boxplot")

# 9.	Write a function as: y=sin(x) and plot this function using two ways. The range is from [-pi, pi]. (15 points)
install.packages("ggplot2")
library(ggplot2)

myfun <- function(x) 
{
  sin(x)
}
curve(myfun(x), from = -pi, to = pi, add = TRUE)
# or
ggplot(data.frame(x=c(0,10)), aes(x=x)) + stat_function(fun=myfun, geom = "line")
# or

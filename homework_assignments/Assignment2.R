#Assignment 2
#Name: Hannah Roach
#ID: 

#1 . Create a data frame with two columns as: 
# time 	total_bill
# Lunch      	14.89
# Dinner      	17.23
# Then use and write functions to draw four graphs, respectively. (30 points)

library(gcookbook)
library(ggplot2)

total_bill <- c(14.89,17.23)
time <- c("Lunch","Dinner")
factored_time = factor(time, levels = time)
table <- data.frame(factored_time, total_bill)
colnames(table) = c("time", "total_bill")

#A. Basic Plot
ggplot(table, aes(x=time, y=total_bill)) + geom_bar(stat="identity") 

#B. Add Color
ggplot(table, aes(x=time, y=total_bill, fill=time)) + geom_bar(position = "dodge", stat = "identity")

#C.Create boarder 
ggplot(table, aes(x=time, y=total_bill, fill=time)) + 
  geom_bar(position = "dodge", colour = "black", stat = "identity") 

#D. Remove Legend
ggplot(table, aes(x=time, y=total_bill, fill=time)) + 
  geom_bar(stat = "identity", position = "dodge", colour = "black") +
  theme(legend.position="none")


#2. Create a dataframe with three columns as:
library(gcookbook)
library(ggplot2)
total_bill <- c(13.53,16.81, 16.24, 17.42)

sex <- c("Female", "Female", "Male", "Male")
factored_sex = factor(sex, levels = c("Female","Male"))

time <- c("Lunch","Dinner","Lunch","Dinner")
factored_time = factor(time, levels = c("Lunch","Dinner"))

table <- data.frame(factored_sex, factored_time, total_bill)

colnames(table) = c("sex", "time", "total_bill")

#A. Basic Plot
ggplot(table, aes(x=time, y=total_bill, group=sex)) + geom_point() + geom_line()

#B. Add Color
ggplot(table, aes(x=time, y=total_bill, group=sex, colour=sex)) + geom_point() + geom_line()

#C. Add Shape. Remove Color.
ggplot(table, aes(x=time, y=total_bill, group=sex, shape=sex)) + geom_point() + geom_line()


#3. Use the data frame ToothGrowth to draw four graphs, respectively.
library(plyr)
types = c("supp", "dose")
tooth_growth <- ddply(ToothGrowth, types, summarise, length = mean(len))

#A. Scale 0.5 from 0.5 to 2
ggplot(tooth_growth, aes(x=dose, y=length, color=supp)) + geom_line() + geom_point() 

#B. Scale 0.5, 1, 2
ggplot(tooth_growth, aes(x=factor(dose), y=length, colour=supp, group=supp, xlab="dose")) + geom_line() + geom_point()

#C. Factor dose
ggplot(tooth_growth, aes(x=factor(dose), y=length, colour=supp, group=supp)) + 
  geom_line() + geom_point() + labs(x = "dose") 


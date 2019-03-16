#2.	Use the mtcars data frame to draw four graphs, respectively.  
# Write down the used functions in ggplot2 (30 points)

# a.
install.packages(c("ggplot2","gcookbook"))
library(ggplot2)
library(gcookbook)
p <- ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()
p + annotate("text", x=4, y=25, label = "Some text", size = 6)

#b.
xvalues <- data.frame(2:5)
flabels <- data.frame(drv = xvalues, label = c("Some text","Some text","Some text","Some text"))
p <- ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()
p + annotate("text", x = c(2,3,4,5), y = 25, label = "Some text", size =6)

#c.
p <- ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()
p + annotate("rect", xmin = 3, xmax = 4.12, ymin = 11.5, ymax = 21.25, alpha = .2 )

#d.
p <- ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point() 
p + annotate("segment", x = 2.5, xend = 4 , y = 15, yend = 25, colour = "blue") 

#e. 
p <- ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()
p + annotate("text", x=1.9, y=20, label = "my label", size = 6) + 
  annotate("text", x=3, y=21, label = "label 2", size = 6)


#3.	Use data frame PlantGrowth and write functions to draw graphs, respectively. (30 points)

#a.
ggplot(PlantGrowth, aes(x = group, y = weight)) + geom_boxplot()


#b. 
ggplot(PlantGrowth, aes(x = group, y = weight)) + geom_boxplot() + coord_flip()

#c 
ggplot(PlantGrowth, aes(x = group, y = weight)) + geom_boxplot() +
  scale_x_discrete(limits=c("trt1", "trt2", "ctrl"))

#d
ggplot(PlantGrowth, aes(x = group, y = weight)) + geom_boxplot() +
  scale_x_discrete(limits=c("trt2", "trt1", "ctrl"))

#4.	Following the same data frame in question 2, and use and write functions to draw the following graphs, respectively. (18 points)
#a
ggplot(PlantGrowth, aes(x = group, y = weight)) + geom_boxplot() +
  scale_x_discrete(breaks=c("ctrl","trt1", "trt2"), 
                   labels=c("Control","Treat1","Treat2"))
#b
ggplot(PlantGrowth, aes(x = group, y = weight)) + geom_boxplot() +
  theme(axis.ticks = element_blank(), axis.text.x = element_blank()) +
  scale_x_discrete(breaks=NULL)

#c.
ggplot(PlantGrowth, aes(x = group, y = weight)) + geom_boxplot() +
  theme(axis.ticks = element_blank(), axis.text.x = element_blank()) 

#5.Following the same data frame in question 2, and use and write functions to draw the following graphs, respectively. (18 points)
#a. 
ggplot(PlantGrowth, aes(x = group, y = weight)) + geom_boxplot() +
  scale_x_discrete(limits=c("ctrl", "trt1", "trt2")) +
  theme(axis.title.x = element_blank()) + 
  ylab("Weight(kg)") 

#b 
ggplot(PlantGrowth, aes(x = group, y = weight)) + geom_boxplot() +
  scale_x_discrete(limits=c("ctrl", "trt1", "trt2")) +
  ylab("Weight(kg)") + xlab("")

#c
ggplot(PlantGrowth, aes(x = group, y = weight)) + geom_boxplot() +
  scale_x_discrete(limits=c("ctrl", "trt1", "trt2")) +
  ylab("Weight(kg)") +
  theme(axis.text.x = element_text(color = "gray", size = rel(2), angle = 90)) +
  theme(axis.title.x = element_text(color = "red", size = rel(3)))


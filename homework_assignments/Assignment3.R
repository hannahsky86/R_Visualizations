# 1.	The attached CSV data file consists of Human Development Index and Corruption Perception Index scores for several countries. Load the attached CSV file to finish the following steps and put the drawing result in the file one by one: (10 points)
# 
install.packages(c("ggplot2", "gcookbook"))
library(gcookbook)
library(ggplot2)
data <- read.csv("EconomistData.csv")


print(BOD)
# LinePlot
ggplot(BOD, aes(x=Time, y=demand)) + geom_line()
# Scatter Plot
ggplot(BOD, aes(x=Time, y=demand)) + geom_point()
# Box Plot 
ggplot(BOD, aes(x=1, y=demand)) + geom_boxplot() + theme(axis.title.x = element_blank())
# Histogram 
ggplot(BOD, aes(x=Time)) + geom_histogram(binwidth = 4, size = .5, color = "black", fill = "White")


# Write down basic steps to draw a function curve using a data frame and ggplot2 package. 
#The function is f(x) = x^2 + 5*x + 9, x is in [0 20]
xval <- seq(0, 20)
yval <- x^2 + 5*x +9
df <- data.frame(cbind(xval,yval))
ggplot(df, aes(x = xval, y = yval)) + geom_line()

print(df)

# a)	Create a scatter plot with CPI on the x axis and HDI on the y axis.

ggplot(data, aes(x=CPI, y=HDI)) + geom_point()
 
# b)	Color the points in the previous plot blue.

ggplot(data, aes(x=CPI, y=HDI)) + geom_point(colour="blue")
 
# c)	Color the points in the previous plot according to Region.

ggplot(data, aes(x=CPI, y=HDI, colour = Region)) + geom_point()

# d)	Create boxplots of CPI by Region

ggplot(data, aes(x=factor(Region), y=CPI)) +
  geom_boxplot(width=.5) +
  theme(axis.text.x = element_text(angle = 60, hjust=1))

 
# e)	Overlay points on top of the box plots

ggplot(data, aes(x=factor(Region), y=CPI)) +
  geom_boxplot(width=.5, ) +
  geom_dotplot(aes(x=as.numeric(Region), group = Region), binaxis = "y", binwidth=.25, alpha = .3, stackdir = "center") +
  theme(axis.text.x = element_text(angle = 60, hjust=1)) 




# 2.	Re-create a scatter plot with CPI on the x axis and HDI on the y axis as previous question. 
# Then finish the following steps and put the drawing result in the file one by one: (15 points)
# 
# 
# a)	Overlay a smoothing line on top of the scatter plot using the lm method.
ggplot(data, aes(x=CPI, y=HDI)) + geom_point() + geom_line(stat = "smooth", method = "lm", colour = "black", size = 1)

# b)	Overlay a smoothing line on top of the scatter plot using the default method.
ggplot(data, aes(x=CPI, y=HDI)) + geom_point() + geom_smooth(colour = "black", se = FALSE, size = 1)

 
# c)	Overlay a smoothing line on top of the scatter plot using the default loess method, but make it less smooth.
ggplot(data, aes(x=CPI, y=HDI)) + geom_point() + 
  geom_line(stat = "smooth", method = "loess", colour = "black", span = 0.2, size = 1)


# 3.	Create a data frame using the following functions:
  set.seed(955)
dat <- data.frame(cond = rep(c("A", "B"), each=10),
                  xvar = 1:20 + rnorm(20,sd=3),
                  yvar = 1:20 + rnorm(20,sd=3))
# Then use and write functions to draw four graphs, respectively. (25 points)
#A.
ggplot(dat, aes(x = xvar, y = yvar, colour = cond)) + geom_point(shape = 21, fill = NA)

#B.
ggplot(dat, aes(x = xvar, y = yvar, colour = cond)) + geom_point(shape = 21, fill = NA) +
  geom_smooth(method = lm, se = FALSE)

#C.
ggplot(dat, aes(x = xvar, y = yvar, colour = cond)) + geom_point(shape = 21, fill = NA) +
  geom_smooth(method = lm, se = FALSE, fullrange = TRUE)

#D. 
ggplot(dat, aes(x = xvar, y = yvar, shape = cond)) + geom_point()

#E.
ggplot(dat, aes(x = xvar, y = yvar, shape = cond)) + geom_point() + scale_shape_manual(values = c(1,2)) 


# 4.	Create a data frame using the following functions:
   set.seed(1234)
 dat <- data.frame(cond = factor(rep(c("A","B"), each=200)), 
                   rating = c(rnorm(200),rnorm(200, mean=.8)))
# Then use and write functions to draw graphs, respectively. (20 points)
 
 # A.
binsize <- diff(range(dat$rating))/10
ggplot(dat, aes(x=rating)) + geom_histogram( binwidth = binsize , colour = "black", fill = "black")

# B.
binsize <- diff(range(dat$rating))/15
ggplot(dat, aes(x=rating)) + geom_histogram( binwidth = binsize , colour = "black", fill = "White")

#C.
ggplot(dat, aes(x=rating)) + geom_density()
  
#D.
ggplot(dat, aes(x=rating, y = ..density..)) + 
  geom_histogram(binwidth = binsize , colour = "black", fill = "White") + geom_density(alpha =.1, fill = "red")


# 5.	Following the same data frame in question 4, and use and write functions to draw the following graphs,
# respectively. (15 points)

#A.
ggplot(dat, aes(x=rating, fill = cond)) + 
  geom_histogram(position = "identity", binwidth = binsize, alpha = .6)

#B.
ggplot(dat, aes(x=rating, colour = cond)) + geom_density()

#C.
ggplot(dat, aes(x=rating, fill = cond)) + geom_density(alpha = .4)


# 6.	Following the same data frame in question 4, and use and write functions to draw the following graphs, respectively. (15 points)

#A.
ggplot(dat, aes(x=factor(cond), y = rating)) + geom_boxplot() + labs(x = "cond") 

#B.
ggplot(dat, aes(x=factor(cond), y = rating, fill = cond)) + geom_boxplot() + labs(x = "cond") 

#C.
ggplot(dat, aes(x=factor(cond), y = rating)) + geom_boxplot() + labs(x = "cond") + 
  stat_summary(fun.y = "mean", geom = "point", shape = 23, size = 3, fill = "white")

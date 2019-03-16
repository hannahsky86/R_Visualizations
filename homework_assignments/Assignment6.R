

# 1.	Please run the following two commands and observe the differences of two graphs. Write the difference and the reasons. (10 points)
# a.
install.packages(c("ggplot2", "gcookbook"))
library(gcookbook)
library(ggplot2)


#Quiz 3
p <- ggplot(PlantGrowth, aes(x=group, y=weight, fill=group)) + geom_boxplot()
p + guides(fill = guide_legend(title.theme = element_text(face = "italic", family = "Times", color = "red", size = "14", angle=0)))

p + theme(legend.title=element_text(face = "italic", family = "Times", color = "red", size = "14"))


p + theme(legend.position = "none")
p + scale_fill_discrete(guide=FALSE)
p + guides(fill=FALSE)

p <-ggplot(heightweight,aes(x=ageYear,y=heightIn)) +geom_point()
#a.
p + theme(axis.title.x =element_text(colour="red")) + theme_bw()
#b. 
p + theme_bw() + theme(axis.title.x =element_text(colour="red",size=12))



#2.	Use the PlantGrowth data frame to draw following graphs, respectively.  Write down the used functions in ggplot2 (25 points) 
#(a)
ggplot(PlantGrowth, aes(x = group, y = weight)) + geom_boxplot() +
  scale_x_discrete(limits=c("ctrl", "trt1", "trt2")) +
  theme(panel.grid.minor = element_blank(), panel.grid.major = element_blank())
#b

ggplot(PlantGrowth, aes(x = group, y = weight)) + geom_boxplot() +
  scale_x_discrete(limits=c("ctrl", "trt1", "trt2")) +
  theme(panel.grid.minor = element_blank())

#c
ggplot(PlantGrowth, aes(x = group, y = weight)) + geom_boxplot() +
  scale_x_discrete(limits=c("ctrl", "trt1", "trt2")) +
  theme(panel.grid.minor.x = element_blank(), panel.grid.major.x = element_blank())

#d
ggplot(PlantGrowth, aes(x = group, y = weight)) + geom_boxplot() +
  scale_x_discrete(limits=c("ctrl", "trt1", "trt2")) +
  theme(panel.grid.minor.y = element_blank(), panel.grid.major.y = element_blank())


#3.	Please use the DF1 data frame to draw following graphs, respectively.  Write down the used functions in ggplot2 (40 points)
DF1 <- data.frame(x = 1:10, y = 1:10, gp = factor(rep(1:2, each = 5)))
p0 <- ggplot(DF1, aes(x = x, y = y, colour = gp)) + geom_point()

#a.
p0 + ggtitle("Top") +
  theme(plot.title=element_text(hjust = 0.5, size=rel(1.5), lineheight=.9, face="bold" ), 
        legend.position="top",
        legend.title = element_text(face="bold"))

#b.
p0 + ggtitle("Bottom") +
  theme(plot.title=element_text(hjust = 0.5, size=rel(1.5), lineheight=.9, face="bold"), 
        legend.position="bottom",
        legend.title = element_text(face="bold"))

#c
p0 + ggtitle("Left") +
  theme(plot.title=element_text(hjust = 0.5, size=rel(1.5), lineheight=.9, face="bold"), 
        legend.position="left",
        legend.title = element_text(face="bold"))

#d
p0 + ggtitle("None") +
  theme(plot.title=element_text(hjust = 0.5, size=rel(1.5), lineheight=.9, face="bold"), 
        legend.position="None",
        legend.title = element_text(face="bold"))
#e
p0 + ggtitle("Inside") +
  theme(plot.title=element_text(hjust = 0.5, size=rel(1.5), lineheight=.9, face="bold"), 
        legend.position=c(.009,.99),legend.justification = c(0,1),
        legend.title = element_text(face="bold"))

#f
p0 + ggtitle("Default") +
  theme(plot.title=element_text(hjust = 0.5, size=rel(1.5), lineheight=.9, face="bold"), 
        legend.title = element_text(face="bold"))

#4.	Please use the DF1 data frame to draw following graphs, respectively.  Write down the used functions in ggplot2 (25 points)

p0 + ggtitle("Left justified") +
  theme(plot.title=element_text(hjust = 0.5, size=rel(1.5), lineheight=.9, face="bold"), 
        legend.position=c(.5,.5),legend.justification = "left",
        legend.title = element_text(face="bold"))

p0 + ggtitle("Right justified") +
  theme(plot.title=element_text(hjust = 0.5, size=rel(1.5), lineheight=.9, face="bold"), 
        legend.position=c(.5,.5),legend.justification = "right",
        legend.title = element_text(face="bold"))

p0 + ggtitle("Center top justified") +
  theme(plot.title=element_text(hjust = 0.5, size=rel(1.5), lineheight=.9, face="bold"), 
        legend.position=c(.5,.5),legend.justification = "top",
        legend.title = element_text(face="bold"))

p0 + ggtitle("Bottom left justified") +
  theme(plot.title=element_text(hjust = 0.5, size=rel(1.5), lineheight=.9, face="bold"), 
        legend.position=c(.5,.5),legend.justification = c(0,0),
        legend.title = element_text(face="bold"))

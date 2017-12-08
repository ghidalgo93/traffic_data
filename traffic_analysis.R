#Gerardo Hidalgo-Cuellar
#November 30, 2017
#Looking at some traffic data

#sets the working directory 
setwd("~/Dropbox/traffic_data")

#importing data
Traffic_Violations <- read.csv("~/Dropbox/traffic_data/SpeedExceeded.csv")


##Histogram with a normal curve
x <- SpeedExceeded$SpeedOver
h <- hist(x, breaks = 100, xlim = c(0,50), col = "red", xlab = "Speed Over Speed Limit", main = "Histogram with Normal Curve")
xfit<-seq(min(x),max(x),length=40) 
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x)) 
yfit <- yfit*diff(h$mids[1:2])*length(x) 
lines(xfit, yfit, col="blue", lwd=2)

##Kernel Density Plot
#d <- density(Traffic_Violations_SpeedExceeded$SpeedOver) # returns the density data 
#plot(d, xlim = c(0, 100)) # plots the results

##comparing speed over for hwy and no-hwy roads
#library(sm)
#attach(SpeedExceeded)
# plot densities 
#sm.density.compare(SpeedExceeded$SpeedOver, Hwy, xlab="Speed Over")
#title(main="Speed Over Distribution by Hwy or Normal Road")
# add legend via mouse click
#colfill<-c(2:(2+length(levels(Hwy)))) 
#legend(locator(1), levels(Hwy), fill=colfill)




##Histogram of Frequency of 9mph over at differnent speed limits
#hist(SpeedExceeded[SpeedExceeded$SpeedOver == 9,]['SpeedLimit']$SpeedLimit, breaks=100, col="red", xlab = 'Speed Limit (mph)', main = 'Frequency of 9mph over at different Speed Limits')


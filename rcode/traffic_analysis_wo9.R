#Gerardo Hidalgo-Cuellar
#November 30, 2017
#Looking at some traffic data

#sets the working directory 
setwd("~/Dropbox/traffic_data")

#importing data
Traffic_Violations <- read.csv("~/Dropbox/traffic_data/SpeedExceeded_wo9.csv")

#Histogram with a normal curve
x <- SpeedExceeded_wo9$SpeedOver
h <- hist(x, breaks = 100, xlim = c(0,50), col = "red", xlab = "Speed Over Speed Limit", main = "Histogram with Normal Curve")
xfit<-seq(min(x),max(x),length=40) 
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x)) 
yfit <- yfit*diff(h$mids[1:2])*length(x) 
lines(xfit, yfit, col="blue", lwd=2)

# Kernel Density Plot
##d <- density(Traffic_Violations_SpeedExceeded$SpeedOver) # returns the density data 
##plot(d, xlim = c(0, 100)) # plots the results

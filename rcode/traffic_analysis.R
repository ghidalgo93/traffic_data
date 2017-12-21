#Gerardo Hidalgo-Cuellar
#November 30, 2017
#Looking at some traffic data

###Libraries
library(ggplot2)

####sets the working directory 
setwd("~/Dropbox/traffic_data/rcode")

###importing data
SpeedExceeded <- read.csv("~/Dropbox/traffic_data/data/SpeedExceeded.csv")


###Histogram with a normal curve (freq v. speedover)
#x <- SpeedExceeded$SpeedOver
#h <- hist(x, breaks = 100, xlim = c(0,50), col = "red", xlab = "Speed Over Speed Limit", main = "Histogram with Normal Curve")
#xfit<-seq(min(x),max(x),length=40) 
#yfit<-dnorm(xfit,mean=mean(x),sd=sd(x)) 
#yfit <- yfit*diff(h$mids[1:2])*length(x) 
#lines(xfit, yfit, col="blue", lwd=2)
###same hist, but with ggplot 2, much better graphics
#data=data.frame(value=SpeedExceeded$SpeedOver)
#ggplot(data, aes(x=value)) + geom_histogram(binwidth = 1, color="white", fill=rgb(0.2,0.7,0.1,0.4))

###Kernel Density Plot (freq v. speedover)
#d <- density(Traffic_Violations_SpeedExceeded$SpeedOver) # returns the density data 
#plot(d, xlim = c(0, 100)) # plots the results

###comparing speed over for hwy and no-hwy roads (freq v. speedover)
#library(sm)
#attach(SpeedExceeded)
# plot densities 
#sm.density.compare(SpeedExceeded$SpeedOver, Hwy, xlab="Speed Over")
#title(main="Speed Over Distribution by Hwy or Normal Road")
##add legend via mouse click
#colfill<-c(2:(2+length(levels(Hwy)))) 
#legend(locator(1), levels(Hwy), fill=colfill)


###Histogram of Frequency of 9mph over at differnent speed limits
#hist(SpeedExceeded[SpeedExceeded$SpeedOver == 9,]['SpeedLimit']$SpeedLimit, breaks=100, col="red", xlab = 'Speed Limit (mph)', main = 'Frequency of 9mph over at different Speed Limits')

###Histogram (freq v. time of day)
#hist(SpeedExceeded$Time.Of.Day_decimal , breaks = 24, col="red", xlab = 'Time of Day', main = 'Freq v. Time of Day')

##Histogram (freq v. day of the month)
#day <- SpeedExceeded$DayOfMonth
#hist(day , breaks = 31, col="red", xlab = 'Day of the Month', main = 'Freq v. Day of the Month')




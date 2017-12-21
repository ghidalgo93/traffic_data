#Gerardo Hidalgo-Cuellar
#Dec 6, 2017
#mapping some traffic data from maryland

#importing libraries
library(ggmap)
library(mapproj)
library(rworldmap)

#sets the working directory 
setwd("~/Dropbox/traffic_data/rcode")

#importing data
SpeedExceeded <- read.csv("~/Dropbox/traffic_data/data/SpeedExceeded.csv")

#setting up new data frame object with the latitude and longitude data
loc_data <- data.frame(SpeedExceeded$Longitude, SpeedExceeded$Latitude)
colnames(loc_data) = c('lon', 'lat')

##setting up a png file to save map to
#png("../figures/itsafuckingheatmap.png", width=4, height=4, units="in", res=300)

##setting up the google map
map <- get_map(location = 'Montgomery County', zoom = 10)
##regularmap
ggmap(map) + geom_point(aes(x=lon, y=lat), data=loc_data, alpha=0.5, color="darkred", size = 1, shape = '.')
##heatmap
#ggmap(map) + geom_density2d(data=loc_data, aes(x = lon, y = lat), size = 0.3) + stat_density2d(data = loc_data, 
               aes(x = lon, y = lat, fill = ..level.., alpha = ..level..), size = 0.01, bins = 16, 
               geom = "polygon") + scale_fill_gradient(low = "green", high = "red") + scale_alpha(range = c(0, 0.3), 
               guide = FALSE)

#dev.off()


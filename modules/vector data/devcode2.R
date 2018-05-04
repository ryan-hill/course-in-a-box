wd = '/media/removable/SD\ Card/tmp'
setwd(wd)

library(sp)
cities <- c('Ashland', 'Corvallis', 'Bend', 'Portland', 'Newport')
population <- c(20062, 50297, 61362, 537557, 9603)
longitude <- c(-122.699, -123.275, -121.313, -122.670, -124.054)
latitude <- c(42.189, 44.57, 44.061, 45.523, 44.652)
coords <- data.frame(longitude, latitude)
dat <- data.frame(cities, population)
pts <- SpatialPointsDataFrame(coords, dat)
print(dat)
print(pts)






library(rgdal); library(sf); 

gages <- read.csv('StreamGages.csv')

coords <- data.frame(longitude, latitude)
dat <- data.frame(cities, population)
pts <- SpatialPointsDataFrame(coords, dat)

coordinates(gages) <- c("LON_SITE","LAT_SITE")
proj4string(gages) <- "+proj=longlat +datum=NAD83"

plot(gages, pch = 20)

gages = spTransform(gages, CRS('+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs '))

test = data.frame(bbox(pts))

plot(gages, pch = 20, col = 'blue', ylim = pts@bbox[2,], xlim = pts@bbox[1,])

plot(pts, col='white')

plot(pts, add = T, col='red', pch=16)

plot(gages)

pts@bbox[1,]

portland = pts[pts$cities == 'Portland', ]

plot(portland, col='blue', pch = 12, add = T)


plot(gages)



slotNames(pts)





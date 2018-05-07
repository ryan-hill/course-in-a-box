load('./data/HUCs.RData')
plot(HUCs)

library(rgdal)

gages <- read.csv('./data/StreamGages.csv')
HUCs

hucs = spTransform(hucs, CRS('+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 
                           +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 
                           +datum=NAD83 +units=m +no_defs '))




hucs <- readOGR(dsn = './data', layer = 'HUCs')

writeOGR(hucs, './data', 'HUCs', driver="ESRI Shapefile")

library(dplyr)

hucs$sqkm <- gArea(hucs, byid = T) / 1e6

ranpts = spsample(hucs, n = 500, type = 'stratified')
plot(hucs)
plot(ranpts, add = T, col = 'red', pch = 20)

tmp = over(ranpts, hucs)

tmp = tmp %>% group_by(HUC_8) %>% summarise(count = n())
data.frame(tmp)
  
max(tmp$count)
  
  








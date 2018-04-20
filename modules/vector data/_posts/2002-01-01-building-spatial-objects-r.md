### Building and Manipulating Spatial Data in R

-----

Let's take a step back now.  Basic data structures in R can represent spatial data - all we need is some vectors with location and attribute information

```r
cities <- c('Ashland','Corvallis','Bend','Portland','Newport')
longitude <- c(-122.699, -123.275, -121.313, -122.670, -124.054)
latitude <- c(42.189, 44.57, 44.061, 45.523, 44.652)
population <- c(20062,50297,61362,537557,9603)
locs <- cbind(longitude, latitude) 
plot(locs, cex=sqrt(population*.0002), pch=20, col='red', 
  main='Population', xlim = c(-124,-120.5), ylim = c(42, 46))
text(locs, cities, pos=4)
```

Add a legend
```r
breaks <- c(20000, 50000, 60000, 100000)
options(scipen=3)
legend("topright", legend=breaks, pch=20, pt.cex=1+breaks/20000, 
  col='red', bg='gray')
```

![BasicMap](/AWRA_GIS_R_Workshop/figure/BasicMap.png)

Add a polygon to our map...
```r
lon <- c(-123.5, -123.5, -122.5, -122.670, -123)
lat <- c(43, 45.5, 44, 43, 43)
x <- cbind(lon, lat)
polygon(x, border='blue')
lines(x, lwd=3, col='red')
points(x, cex=2, pch=20)
```

![BasicMap2](/AWRA_GIS_R_Workshop/figure/BasicMap2.png)

So, is this sufficient for working with spatial data in R and doing spatial analysis?  What are we missing?

Packages early on in R came at handling spatial data in their own way. The `maps` package is great example - a database of locational information that is quite handy. The `maps` package format was developed in S (R is implementation of S) - lines represented as a sequence of points separated by 'NA' values - think of as drawing with a pen, raising at NA, then lowering at a value.  Bad for associating with data since objects are only distinguished by separation with NA values. Try the following code-

```r
library(maps)
map()
```

![globalmap](/AWRA_GIS_R_Workshop/figure/globalmap.png)

```r
map.text('county','oregon')
map.axes()
title(main="Oregon State")
```

![OregonCounties](/AWRA_GIS_R_Workshop/figure/OregonCounties.png)

`maps` package draws on a binary database - see Becker references in help(map) for more details. Creates a list of 4 vectors when you create a `maps` object in R.

Explore the structure of map object a bit....
```r
p <- map('county','oregon')
str(p)
p$names[1:10]
p$x[1:50]
```

Spatial classes provided in `sp` package have mostly standardized spatial data in R and provide a solid way to represent and work with spatial data in R. 


The `maptools` package provides convenience function for making spatial objects from  map objects.  Try the following code and see if you can follow each step...

```r
library(maptools)
counties <- map('county','oregon', plot=F, col='transparent',fill=TRUE)
counties$names
#strip out just the county names from items in the names vector of counties
IDs <- sapply(strsplit(counties$names, ","), function(x) x[2])
counties_sp <- map2SpatialPolygons(counties, IDs=IDs,
    proj4string=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"))
summary(counties_sp)
plot(counties_sp, col="grey", axes=TRUE)
```

![OregonCounties2](/AWRA_GIS_R_Workshop/figure/OregonCounties2.png)


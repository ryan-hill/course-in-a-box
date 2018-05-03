---
title: "sp package"
---

### Background

----

To start, let's consider the simplest vector feature - points. To contain all of the characteristics of a set of points, we need more than just set of latitudes and longitudes. We also need a coordinate reference system, a bounding box, data, and more. The `sp` package bundles all of these things together into a single object called a `SpatialPointsDataFrame`. Think of it as a data frame that is bundled with other objects, such as a bounding box, a projection system (proj4string), and coordinates.

![SpatialClassesFig1](/AWRA_GIS_R_Workshop/figure/SpatialClassesFig1.png)

This type of feature is called an [S4](http://adv-r.had.co.nz/S4.html) object. The structure of S4 objects can be intimidating and a difficult to work with. Perhaps because of this (and other reasons), there has been a big movement towards the newer `sf` package for working with vector data (covered in a subsequent section). However, numerous packages still use the  `sp` object structure (see the image below tweeted by [Colin Gillespie](https://twitter.com/csgillespie/status/854438264538845184)), so we need to learn about them.

![CRANdependencies](/AWRA_GIS_R_Workshop/figure/CRANdependencies.jpg)

*Roger Bivand's book [Applied Spatial Data Analysis in R](http://www.asdar-book.org/)*

<br>

### Excercise

We will explore `sp` objects in R by first starting a new R Markdown. 

- In the project you created for this workshop, open a fresh R Markdown file (File > New File > R Markdown). Name it 'Vector data' and save it in your project.

We will take the simple example we used in the previous section and convert it into an `sp` object. We'll print the data frame and the new points object and compare them.

```r
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
```
```r
#     cities population
#1   Ashland      20062
#2 Corvallis      50297
#3      Bend      61362
#4  Portland     537557
#5   Newport       9603

#          coordinates    cities population
# 1 (-122.699, 42.189)   Ashland      20062
# 2  (-123.275, 44.57) Corvallis      50297
# 3 (-121.313, 44.061)      Bend      61362
# 4  (-122.67, 45.523)  Portland     537557
# 5 (-124.054, 44.652)   Newport       9603
```
We can see that `pts` combines the attributes (cities and population) with the latitudes and longitudes and that these make an new combined column called 'coordinates'.

Now, do a summary on `pts`...

```r 
summary(pts)
```

```r
# Object of class SpatialPointsDataFrame
# Coordinates:
#                min      max
# longitude -124.054 -121.313
# latitude    42.189   45.523
# Is projected: NA 
# proj4string : [NA]
# Number of points: 5
# Data attributes:
#        cities    population    
#  Ashland  :1   Min.   :  9603  
#  Bend     :1   1st Qu.: 20062  
#  Corvallis:1   Median : 50297  
#  Newport  :1   Mean   :135776  
#  Portland :1   3rd Qu.: 61362  
#                Max.   :537557  
```

When we do a summary we can see even more information. In addition to the attributes, we can see the min and max of the coordinates, whether the points are projected (`Is projected: NA`), and more. 

If we do a simple plot of the points and add labels with the `maptools` package, we should be able to confirm that the points are in fact the cities from the previous excercise.

```r
library(maptools)
plot(pts)
pointLabel(coordinates(pts),labels=pts$cities)
```
![simple-sp-plot](/sfs-r-gis-2018/img/simple-sp-plot.png)

<kbd>
  <img src="https://raw.githubusercontent.com/ryan-hill/sfs-r-gis-2018/gh-pages/img/simple-sp-plot.png">
</kbd>



After:

#------------------------
Ended here

Next we'll delve a bit deeper into the spatial objects inhereting from the base spatial class and try creating some simple objects.  Here's a schematic of how spatial lines and polygons inherit from the base spatial class - again, from the Bivand book:

![SpatialClassesFig2](/AWRA_GIS_R_Workshop/figure/SpatialClassesFig2.png)

And to explore a bit in R:

```r
getClass("SpatialPolygons")
```

```r
Class "SpatialPolygons" [package "sp"]

Slots:
                              
Name:     polygons   plotOrder        bbox proj4string
Class:        list     integer      matrix         CRS

Extends: "Spatial" 

Known Subclasses: 
Class "SpatialPolygonsDataFrame", directly, with explicit coerce
```

Also, there are a number of spatial methods you can use with classes in `sp` - here are some useful ones to familarize yourself with:

| Method / Class   | Description | 
|------------------|-------------| 
| bbox()           | Returns the bounding box coordinates | 
| proj4string()    | Sets or retrieves projection attributes using the CRS object | 
| CRS()            | Creates an object of class of coordinate reference system arguments | 
| spplot()         | Plots a separate map of all the attributes unless specified otherwise | 
| coordinates()    | Returns a matrix with the spatial coordinates. For spatial polygons it returns the centroids. | 
| over(x, y)       | Used for example to retrieve the polygon or grid indexes on a set of points | 
| spsample(x)      | Sampling of spatial points within the spatial extent of objects |   

<br>

As an example data set to try out some of these methods on some spatial data in `sp`, we'll load the `nor2k` data in the `rgdal` package which represents Norwegian peaks over 2000 meters:

```r
library(rgdal)
data(nor2k)
plot(nor2k,axes=TRUE)
```

Take a few minutes to examine the nor2k `SpatialPointsDataFrame` and try using methods we've seen such as `class()`, `str()`, `typeof()`, `proj4string()`, etc.  

A big part of working with spatial data in `sp` is understanding slots, and understanding how we access slots. The easiest way to access particular slots in an `sp` object is to use the @ symbol.  You can also use the slotNames method. Take a few minutes using both to explore the structure of this simple `sp` object.

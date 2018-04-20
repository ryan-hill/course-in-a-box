---
title: "Intro to Spatial Objects"
---

### Getting to Know Spatial Objects

----

Handling of spatial data in R has been standardized in recent years through the base package `sp` - uses 'new-style' [S4](http://adv-r.had.co.nz/S4.html) classes in R that use formal class definitions and are closer to object-oriented systems than standard S3 classes in R.  

The best source to learn about `sp` and fundamentals of spatial analysis in R is Roger Bivand's book [Applied Spatial Data Analysis in R](http://www.asdar-book.org/)

Although we'll look at the new simple features object specification this morning as well, numerous packages are currently built using sp object structure so need to learn to navigate current R spatial ecosystem - image below from [Colin Gillespie's Tweet](https://twitter.com/csgillespie/status/854438264538845184):

![CRANdependencies](/AWRA_GIS_R_Workshop/figure/CRANdependencies.jpg)
 
 `sp` provides definitions for basic spatial classes (points, lines, polygons, pixels, and grids).
 
To start with, it's good to stop and ask yourself what it takes to define spatial objects.  What would we need to define vector (point, line, polygon) spatial objects?  

- A coordinate reference system
- A bounding box, or extent
- plot order
- data
- ?

`sp` objects inherit from the basic spatial class, which has two 'slots' in R new-style class lingo.  From the Bivand book above, here's what this looks like (Blue at top of each box is the class name, items in white are the slots, arrows show inheritance between classes):

![SpatialClassesFig1](/AWRA_GIS_R_Workshop/figure/SpatialClassesFig1.png)
 
- Let's explore this in R.  We can use the `getClass()` command to view the subclasses of a spatial object:

```r
library(sp)
getClass("Spatial")
```

```r
Class "Spatial" [package "sp"]
 
Slots:
                               
Name:         bbox proj4string
Class:      matrix         CRS
 
Known Subclasses: 
Class "SpatialPoints", directly
Class "SpatialGrid", directly
Class "SpatialLines", directly
Class "SpatialPolygons", directly
Class "SpatialPointsDataFrame", by class "SpatialPoints", distance 2
Class "SpatialPixels", by class "SpatialPoints", distance 2
Class "SpatialGridDataFrame", by class "SpatialGrid", distance 2
Class "SpatialLinesDataFrame", by class "SpatialLines", distance 2
Class "SpatialPixelsDataFrame", by class "SpatialPoints", distance 3
Class "SpatialPolygonsDataFrame", by class "SpatialPolygons", distance 2
```

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

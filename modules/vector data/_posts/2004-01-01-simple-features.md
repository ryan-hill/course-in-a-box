---
title: "Simple Features"
---

## Simple Features

----

The `sf` Simple Features for R package by Edzer Pebesma is a changes of gears from the `sp` package. The `sf` package provides [simple features access](https://en.wikipedia.org/wiki/Simple_Features) for R. Without a doubt, `sf` will replace `sp` as the fundamental spatial model in R for vector data. Packages are already being updated around `sf`. In addition, it fits in with the "tidy" approach to data of Hadley Wickham's `tidyverse`. The simple feature model will be familiar to folks who use [PostGIS](https://en.wikipedia.org/wiki/PostGIS), [MySQL Spatial Extensions](https://en.wikipedia.org/wiki/MySQL), [Oracle Spatial](https://en.wikipedia.org/wiki/Oracle_Spatial_and_Graph), the [OGR component of the GDAL library](https://en.wikipedia.org/wiki/GDAL), [GeoJSON](https://datatracker.ietf.org/doc/rfc7946/) and [GeoPandas](http://geopandas.org/) in Python.  Simple features are represented with Well-Known text - [WKT](https://en.wikipedia.org/wiki/Well-known_text) - and well-known binary formats.

Important for us today - the `sf` package is fast and pretty simple to use. It can also be more reliable to use than the `sp` package in our experience. All of the functions we have covered so far are also included in `sf` (i.e., it is a very inclusive and ever-expanding package). Finally, you won't lose any of the functionality of `sp` because it is very easy to move data back and forth between `sf` and `sp`. 

#### Equivalent functions

 `sp` + others   | `sf` 
----------------------------------|-------------
sp::bbox()           | st_bbox()   
sp::proj4string()    | st_crs()$proj4string 
sp::coordinates()    | st_coordinates() 
sp::over()           | st_join() 
sp::SpatialPointsDataFrame() | st_as_sf() 
rgdal:: readOGR() | st_read() 
rgdal::writeOGR() | st_write() 
rgeos::gSimplify() | st_simplify() 
rgeos::gArea() | st_area() 
rgeos::gLength() | st_length() 
raster::intersect() | st_intersection() 

Edzar Pebesma has extensive documentation, blog posts and vignettes available for `sf` here:
[Simple Features for R](https://github.com/edzer/sfr).  Additionally, see Edzar's [r-spatial blog](http://r-spatial.org/) which has numerous announcements, discussion pieces and tutorials on spatial work in R focused. 

### Lesson Goals
  - Learn the structure of `sf` objects using some example water sample data
  - Understand plotting with of `sf` objects
  - Use topological operations in `sf` such as spatial intersections, joins and aggregations with example data

---

#### Excercise 1: Exploring `sf`

To begin, let's look at the methods (specific functions) that are available with `sf`. 

```r
methods(class = "sf")
```
```
##  [1] [                 aggregate         cbind            
##  [4] coerce            initialize        plot             
##  [7] print             rbind             show             
## [10] slotsFromS3       st_agr            st_agr<-         
## [13] st_as_sf          st_bbox           st_boundary      
## [16] st_buffer         st_cast           st_centroid      
## [19] st_convex_hull    st_crs            st_crs<-         
## [22] st_difference     st_drop_zm        st_geometry      
## [25] st_geometry<-     st_intersection   st_is            
## [28] st_linemerge      st_polygonize     st_precision     
## [31] st_segmentize     st_simplify       st_sym_difference
## [34] st_transform      st_triangulate    st_union         
## see '?methods' for accessing help and source code
```

Let's read in a set of point coordinates. For this example, we'll use data from the US EPA's Wadeable Streams Assessment (WSA). 

```r
library(RCurl)
library(sf)

download <- getURL("https://www.epa.gov/sites/production/files/2014-10/wsa_siteinfo_ts_final.csv")

wsa <- read.csv(text = download)
class(wsa)
```

Just a data frame that includes location and other identifying information about river and stream sampled sites from 2000 to 2004.

```
## [1] "data.frame"
```

Because this dataframe has coordinate information, we can promotote it to an `sf` spatial object.

```r
wsa = st_as_sf(wsa, coords = c("LON_DD", "LAT_DD"), crs = 4269,agr = "constant")
str(wsa)
par(mar = c(0,0,0,0))
plot(wsa$geometry, pch = 19)
```

![](../../../img/wsa-usa.jpg)





Let's subset our data to just the US plains ecoregions using the 'ECOWSA9' variable in the wsa dataset. Here's an image of the regions in this table: 

![](../../../img/ecoregions_withlegend_7_27_2016_cropped2.jpg)

```r
levels(wsa$ECOWSA9)
wsa_plains <- wsa[wsa$ECOWSA9 %in% c("TPL","NPL","SPL"),]
```


Note that this is now still a dataframe but with an additional geometry column. `sf` objects are still a data frame, but have an additional list-column for geometry. 

```r
head(wsa_plains[,c(1,60)])
```
```
##Simple feature collection with 6 features and 1 field
##Attribute-geometry relationship: 1 constant, 0 aggregate, 0 identity
##geometry type:  POINT
##dimension:      XY
##bbox:           xmin: -104.7643 ymin: 39.35901 xmax: -91.92294 ymax: 42.70254
##epsg (SRID):    4269
##proj4string:    +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs
##        SITE_ID                    geometry
##13        CC0001  POINT(-104.76432 39.35901)
##14 IAW02344-0096 POINT(-94.089731 41.950878)
##15 IAW02344-0096 POINT(-94.089731 41.950878)
##16 IAW02344-0097 POINT(-95.400885 41.332723)
##17 IAW02344-0097 POINT(-95.400885 41.332723)
##18 IAW02344-0098   POINT(-91.92294 42.70254)
```
We can do simple plotting just as with `sp` spatial objects. `sf` by default creates a multi-panel lattice plot much like the `sp` package `spplot` function - either plot particular columns in multiple plots or specify the `geometry` column to make a single simple plot.  Note how it's easy to use graticules as a parameter for `plot` in `sf`. 

```r
plot(wsa_plains[c(46,56)], graticule = st_crs(wsa_plains), axes=TRUE)
```

![WSASites](/AWRA_GIS_R_Workshop/figure/WSASites.png)

Try some of these variations and see if they make sense to you.

```r
plot(wsa_plains[c(38,46)],graticule = st_crs(wsa_plains), axes=TRUE)
plot(wsa_plains['geometry'], main='Keeping things simple',graticule = st_crs(wsa_plains), axes=TRUE)
```








---
title: "Spatial Objects II"
---

## Spatial Objects II

----

In the previous section, we learned how to create spatial objects in R. In those examples, we focused on importing points from geographic coordinates. However, it is common to bring in data from external data sets, including ESRI shapefiles. In this section, we will learn how to import and export data from shapefiles. These layers will include polygons and lines and we will continue with out exploration of geoprocessing examples with these types of data. 

By the end of this section you will be able to:

- Read and write shapefiles.
- Simplify spatial layers with complex geometries.
- Modify geomoe
- Calculate geometry metrics such as area of polygons or lengths of lines.
- Clip one polygon feature based on another polygon feature.
- Calculate 

### Reading and writing external data

R uses the open source `gdal` C/C++ libraries to read and write vector (and raster) data. This library is extensively used by both open sources and enterprise softwares, including some ESRI applications. The R package for reading and writing spatial data is called `rgdal`. 

First, let's read in a shapefile called 'HUCs.shp'. The code below assumes that you have created an R project and that you have downloaded and extracted these layers to a folder within that project called **'data'**. The function to read in a shapefile is `readOGR` and the syntax to read the layer is may not be intuitive to R users used to reading in data tables. In this fuction:

- dsn = folder where shapefile lives
- layer = name of shapefile (excluding '.shp')
- verbose = rgdal likes to print a lot of stuff while reading in a shapefile - let's tell it to be quiet

```r
library(rgdal); library(zoom)
hucs <- readOGR(dsn = './data', layer = 'HUCs', verbose = F)
plot(hucs)
writeOGR(hucs, './data', 'HUCs', driver="ESRI Shapefile")
```

### 

###

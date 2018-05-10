---
title: "Simple Features"
---

## Simple Features

----

The `sf` Simple Features for R package by Edzer Pebesma is a changes of gears from the `sp` S4 class of spatial data. The `sf` package provides [simple features access](https://en.wikipedia.org/wiki/Simple_Features) for R. Without a doubt, `sf` will replace `sp` as the fundamental spatial model in R for vector data. Packages are already being updated around `sf`. In addition, it fits in with the "tidy" approach to data of Hadley Wickham's `tidyverse`. The simple feature model will be familiar to folks who use [PostGIS](https://en.wikipedia.org/wiki/PostGIS), [MySQL Spatial Extensions](https://en.wikipedia.org/wiki/MySQL), [Oracle Spatial](https://en.wikipedia.org/wiki/Oracle_Spatial_and_Graph), the [OGR component of the GDAL library](https://en.wikipedia.org/wiki/GDAL), [GeoJSON](https://datatracker.ietf.org/doc/rfc7946/) and [GeoPandas](http://geopandas.org/) in Python.  Simple features are represented with Well-Known text - [WKT](https://en.wikipedia.org/wiki/Well-known_text) - and well-known binary formats.

### Equivalent functions

| Previous Section   | `sf` | 
|----------------------------------|-------------| 
| sp::bbox()           | st_bbox()   | 
| sp::proj4string()    | st_crs()$proj4string | 
| sp::coordinates()    | st_coordinates() | 
| sp::over()           | st_join() | 
| sp::SpatialPoints<br>DataFrame() | st_as_sf() |
| rgdal:: readOGR() | st_read() |
| rgdal::writeOGR() | st_write() |
| rgeos::gSimplify() | st_simplify() |
| rgeos::gArea() | st_area() |
| rgeos::gLength() | st_length() |
| raster::intersect() | st_intersection() |











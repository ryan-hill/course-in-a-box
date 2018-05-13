---
title: "Working with Rasters"
---

## Working with Rasters

In this section, we'll play with real data and demonstrate some of the nice features of working with the `raster` package. 

### Lesson Goals
By the end of this section you will be able to: 
- Read and write raster data from disk and from the web
- Clip raster data
- More...

---

### Loading raster data from the web

The `raster` package has a `getData` function that can be used to grab several pre-defined datasets directly from the web. These include:

- SRTM 90 (elevation data with 90m resolution between latitude  -60 and 60)
- World Climate Data (Tmin, Tmax, Precip, BioClim)
- Global adm. boundaries (different levels)

We'll work with the SRTM data but we will also load some state borders to provide some geographic context for you. With `getData`, you can provide a latitude and longitude and the desired data. 

```r
library(raster)
#Download elevation data
srtm <- getData('SRTM', lon=-121, lat=42)
#Download US borders and select Oregon
US <- getData("GADM",country="USA",level=1)
oregon <- US[US$NAME_1 == 'Oregon',]
plot(oregon, axes=T)
plot(srtm, add = T)
```

![srtm-oregon](../../../img/srtm-oregon.png)

### Cropping raster data

Now, let's supposed we are working in the Calapooia watershed in Oregon and we'd like to crop the elevation data to match the bounding box of the watershed. We can use the extent of our watershed to do so. 

```r
#Read in watershed layer
ws <- readOGR(dsn = './data', layer = 'calapooia-ws')
proj4string(ws) == proj4string(srtm)
#Crop srtm based on ws bounding box
cal_elev <- crop(srtm, ws)
plot(cal_elev, main="Elevation (m) in Calapooia River Watershed")
plot(ws, add=TRUE)
```

![cal-crop](../../../img/cal-crop.png)

Sometimes this level of cropping isn't enough and we actually want it to match the border of a particular layer. We can use the `mask` function to do this. However, be warned that this function can take a while with larger datasets.

```r
cal_elev <- mask(cal_elev, ws)
plot(cal_elev)
plot(ws, add = T)
```

![cal-mask](../../../img/cal-mask.png)

### Reading & writing raster data from disk

If we inspect our new raster (cal_elev), you'll notice that `data source: in memory`. 

```r
# class       : RasterLayer 
# dimensions  : 731, 887, 648397  (nrow, ncol, ncell)
# resolution  : 90, 90  (x, y)
# extent      : -2136562, -2056732, 2645806, 2711596  (xmin, xmax, ymin, ymax)
# coord. ref. : +proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=23 +lon_0=-96 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs +ellps=GRS80 +towgs84=0,0,0 
# data source : in memory
# names       : calapooia 
# values      : 52.44468, 1546.756  (min, max)
```

We may want to save this new raster to work with later.

```r
#Writing to GeoTiff requires the rgdal package
library(rgdal)
#Writing 
writeRaster(cal_elev, './data/cal_elev.tif', format="GTiff", overwrite=TRUE)
```
```r
library(raster);library(rgdal)
#Reading
cal_elev <- raster('./data/cal_elev.tif')
```

The `raster` package can handle many different formats other than `GeoTiff` and can generally interpret these formats when reading. However, you will need to specify the format when writing. 

### Reprojecting rasters

As we noted previously, it is critical that your data all be in the same projection for analysis. Like many applications, it's useful to use an equal-area projection for rasters as well. Let's suppose we have a watershed polygon that is in the desired projection and we want our raster to match that projection. 

```r
pts2 <- spTransform(pts, CRS('+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 
                           +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 
                           +datum=NAD83 +units=m +no_defs '))```
```r
#[1] FALSE
```

Use `projectRaster` with `method = 'bilinear'` and the CRS from the 'ws' layer.

```r
cal_elev <- projectRaster(cal_elev, 
                          crs = '+proj=aea +lat_1=29.5 
                                +lat_2=45.5 +lat_0=37.5 
                                +lon_0=-96 +x_0=0 +y_0=0 
                                +ellps=GRS80 
                                +datum=NAD83 +units=m +no_defs ', 
                          res=90, method='bilinear')
```

### Extracting raster stats

We can also extract potentially useful information from a raster layer using several methods.

```r
cellStats(cal_elev, stat='mean')
quantile(cal_elev, probs = c(0.25, 0.5, 0.75))
```
```r
#[1] 300.048
#    25%       50%       75% 
#85.35121 161.22613 408.62559 
```

### Terrain analysis with `raster`

```r

```
 


























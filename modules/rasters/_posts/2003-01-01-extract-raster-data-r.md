---
title: "Extracting Data from Rasters"
---

## Extracting Data from Rasters

---

In this section, we'll learn how to pull useful information from raster datasets. These will include generic functions to summarize rasters as a whole or to extract information based on the boundaries of a second layer. 

### Lesson Goals

By the end of this section you will be able to: 
- Read and write raster data from disk and from the web
- Clip raster data
- More...

---

### Excercise 1: Raster and RasterBrick summary stats

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

Many of these methods work with RasterBricks as well (although some of these stats may not be relevant for some of the layers, such as flowdir).

```r
cellStats(cal_terrain, stat='mean')
quantile(cal_terrain, probs = c(0.25, 0.5, 0.75))
```
```r
#        tri         tpi   roughness       slope      aspect     flowdir 
# 9.64157210 -0.09001769 31.13302748  0.12417778  3.29963730 34.03649593 
#                   25%         50%        75%
#tri        0.793477233  5.29052019 15.7185688
#tpi       -1.321671745 -0.10031628  0.9763394
#roughness  2.317155757 17.19726370 50.9859111
#slope      0.007261573  0.06209942  0.2085050
#aspect     1.442969122  3.60642750  5.0135436
#flowdir    4.000000000 16.00000000 64.0000000
```











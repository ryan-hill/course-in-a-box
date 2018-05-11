## Introduction to Raster Data

---

### Goals and Motivation

---

Rasters are the second fundamental GIS data type and one that works very will in R. the prefered method far and away is to use the `raster` package by Robert J. Hijmans.  The `raster` package has made working with raster data (as well as vector spatial data for some things) much easier and more efficient.  The `raster` package allows you to:
- read and write almost any commonly used raster data format using `rgdal`
- create rasters, do typical raster processing operations such as resampling, projecting, filtering, raster math, etc.
- work with files on disk that are too big to read into memory in R
- run operations quite quickly since the package relies on back-end C code

The [home page](https://cran.r-project.org/web/packages/raster/) for the `raster` package has links to several well-written vignettes and documentation for the package.

The `raster` package uses three classes / types of objects to represent raster data - `RasterLayer`, `RasterStack`, and `RasterBrick` - these are all `S4` new style classes in R, just like `sp` classes.

All that said, `raster` has not been updated in the last year - there has been discussion in the R spatial developer world among several folks of updating / modifying raster to be both `sf` and pipe-based workflow friendly - it looks like this is coalescing in the `stars: spatiotemporal tidy arrays for R` package being developed by Edzer Pebezma, Michael Sumer, and Etienne Racine.  Their [proposal](https://github.com/r-spatial/stars/blob/master/PROPOSAL.md) outlines the approach they are taking - you can play with the [development version](https://www.r-spatial.org/r/2017/11/23/stars1.html) but it is still very much in alpha stages. 

### Module Goals
- Understand how to create, load, and analyze raster data in R
- Understand basic structure of rasters in R and how to manipulate
- Try some typical GIS-y operations on raster data in R like performing zonal statistics

Let's create an empty `RasterLayer` object - we have to define the matrix (rows and columns) the spatial bounding box, and then we provide values to the cells using the runif function to derive random values from the uniform distribution.
```r
library(raster)
r <- raster(ncol=10, nrow = 10, xmx=-116,xmn=-126,ymn=42,ymx=46)
str(r)
r
r[] <- runif(n=ncell(r))
r
plot(r)
```

![BasicRaster](/AWRA_GIS_R_Workshop/figure/BasicRaster.png)

When you look at summary information for the `RasterLayer`, by simply typing "r", you'll notice the main information defining a `RasterLayer` object described.  Minimal information needed to define a `RasterLayer` include the number of columns and rows, the bounding box or spatial extent of the raster, and the coordinate reference system.  What do you notice about the coordinate reference system of the raster we just generated from scratch?

You can access raster values via direct indexing or line, column indexing - take a minute to see how this works using raster r we just created - the syntax is:

```r
r[i]
r[line, column]
```

An important feature of the `raster` package is that when you load a raster, it is not loaded into memory (at least not intially). 



## Installing R GIS Packages

First we need to install several R packages. R operates on user-contributed packages, and we'll be using several of these spatial packages in this workshop. These packages will include: `sp`, `rgdal`, `rgeos`, `raster`, and the new `sf` simple features package by Edzer Pebesma, among others.  __The complete package list that you will need for this workshop is below.__ Stable versions of these package can be downloaded from [CRAN](https://cran.r-project.org/) (Comprehensive R Archive Network) using the installation functions in R.  We'll also be using development versions of a few packages that can be downloaded from GitHub.  

## Install R packages from console

The following code will install all of the requisite packages by copying and pasting into the RStudio console window. Note that for both `sf`, `ggplot2`, and `plotly`, the alternative install from GitHub rather than CRAN are given.  We strongly encourage you to download the development versions of these packages from GitHub because you will not be able to reproduce many of the examples in this workshop using the stable CRAN versions.

**1. From R CRAN**

Copy and paste these lines into the RStudio console window (lower left window) and press enter to install.

```r
install.packages("sp")
install.packages("maptools")
install.packages("rgeos")
install.packages("rgdal")
install.packages("raster")
install.packages("RCurl")
install.packages("USAboundaries")
install.packages("jsonlite")
install.packages("geojsonio")
install.packages("maps")
install.packages("tmap")
install.packages("micromap")
install.packages("ggrepel")
install.packages("ggmap")
install.packages("mapview")
```

**2. From GitHub**

Newer, development versions of packages can be downloaded directly from GitHub. These version may not always be stable but they can provide access to new capabilities. You will need to install the `devtools` package first from CRAN.  The `devtools` package includes the `install_github` function to install packages from GitHub. 

```r
#devtools packages allows installation from GitHub
install.packages("devtools")
devtools::install_github("edzer/sfr")
devtools::install_github("tidyverse/ggplot2")
devtools::install_github("ropensci/plotly")
```

For __Linux users__, to install simple features for R (`sf`), you need GDAL >= 2.0.0, GEOS >= 3.3.0, and Proj.4 >=  4.8.0.  Edzer Pebesma's Simple Features for R GitHub repo has a good explanation:

[Simple Features for R](https://github.com/edzer/sfr)

You basically want to add [ubuntugis-unstable](http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu/) to the package repositories and then get those three dependencies:

```
sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable
sudo apt-get install libgdal-dev libgeos-dev libproj-dev
```

The Simple features for R package , `sf`, also needs udunits and udunits2 which may need coercing in linux:

[Units Issues in sf GitHub repo](https://github.com/edzer/units/issues/1)

The following should resolve:

```
sudo apt-get install libudunits2-dev
```

**3. Check package installations**

You can verify all packages have installed correctly by loading them in your current R session using the `library` command.  You'll probably get a few messages in the console when you're loading some of the packages.  Just ignore these unless you see an `Error` indicating a package could not load.  That usually means you'll have to try installing the package again.  Warnings about packages being built in other version of R can usually be ignored. 

```r
library(sp)
library(maptools)
library(rgeos)
library(rgdal)
library(raster)
library(RCurl)
library(USAboundaries)
library(jsonlite)
library(geojsonio)
library(maps)
library(tmap)
library(micromap)
library(ggrepel)
library(ggmap)
library(mapview)
library(sf)
library(ggplot2)
library(plotly)
```



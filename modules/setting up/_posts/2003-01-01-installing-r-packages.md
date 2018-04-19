
## Installing R GIS Packages

First we need to install several R packages. R operates on user-contributed packages, and we'll be using of several of these spatial packages in this workshop. These packages will include: `sp`, `rgdal`, `rgeos`, `raster`, and the new `sf` simple features package by Edzer Pebesma.  You can use the packages tab in RStudio (see below) to install packages in a straightforward way.  Mac and Linux users may have certain pre-requisites to fill, we'll assume you can navigate these on your own or can assist as needed.

![RStudio Console]({{site.baseurl}}/img/packages.png)

<br>

### Install R packages from console

The following code will install all of the requiste packages by copying and pasting into the RStudio console window. Note that for both `sf` and `tidyverse` - and specificallly `ggplot2` in `tidyverse`, the alternative install from GitHub rather than CRAN are given.  This is optional, as is installing devtools, and you will be fine with the CRAN version of packages, except that you will not be able to reproduce one of the example plots in the `sf` section that uses `sf_geom` funtion from the development version of `ggplot2`. In addition, `tidyverse` is a 'meta-package' that includes several specific packages such as `ggplot2`, `dplyr`, and `tidyr`, which we will be using today.

#### From R CRAN



```r
install.packages("rgdal")
install.packages("sf")
install.packages("rgeos")
install.packages("raster")
install.packages("gstat")
install.packages("spdep")
install.packages("maptools")
install.packages("stringr")
install.packages("reshape")
install.packages("micromap")
install.packages("tmap")
install.packages("RCurl")
install.packages("dataRetrieval")
install.packages("maps")
install.packages("USAboundaries")
install.packages("rasterVis")
install.packages("landsat")
install.packages("plotly")
install.packages("leaflet")
install.packages("rbokeh"
install.packages("ggmap")
```

#### From GitHub

Newer, development versions of packages can be downloaded directly from GitHub. However, these version may not always be stable.

```r
 #devtools packages allows installation from GitHub
install.packages(devtools)
devtools::install_github("edzer/sfr")
devtools::install_github("hadley/tidyverse")
```

Installing `rgdal` will install the foundation spatial package, `sp`, as a dependency.  

For Linux users, to install simple features for R (`sf`), you need GDAL >= 2.0.0, GEOS >= 3.3.0, and Proj.4 >=  4.8.0.  Edzer Pebesma's Simple Features for R GitHub repo has a good explanation:

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

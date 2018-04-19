## Workshop Data

For convenience, please download the data before the day of the workshop. You can do so by right-clicking on each link below or by running the code chunk in R. nce downloaded, extract (unzip) the files into the directory you will be using for the workshop.

**Links**

- [ESDA.zip](https://github.com/ryan-hill/sfs-r-gis-2018/blob/a98da93ec97ce303507e4731ddda5d8055590f39/files/ESDA.zip?raw=true){:target="_blank"}
- [HUCs.RData](https://github.com/ryan-hill/sfs-r-gis-2018/blob/a98da93ec97ce303507e4731ddda5d8055590f39/files/HUCs.RData?raw=true){:target="_blank"}
- [NLCD_OR_2011.RData](https://github.com/ryan-hill/sfs-r-gis-2018/blob/a98da93ec97ce303507e4731ddda5d8055590f39/files/NLCD_OR_2011.RData?raw=true){:target="_blank"}
- [WorkshopData.zip](https://github.com/ryan-hill/sfs-r-gis-2018/blob/a98da93ec97ce303507e4731ddda5d8055590f39/files/WorkshopData.zip?raw=true){:target="_blank"}

**R Code**

In the code below, replace `your-directory-here` with the folder location where you would like to download the files to.

```r
#Set your working directory
setwd(your-directory-here)

download.file("https://github.com/ryan-hill/sfs-r-gis-2018/blob/a98da93ec97ce303507e4731ddda5d8055590f39/files/ESDA.zip?raw=true",
              "ESDA.zip",
              method="auto",
              mode="wb")

download.file("https://github.com/ryan-hill/sfs-r-gis-2018/blob/a98da93ec97ce303507e4731ddda5d8055590f39/files/HUCs.RData?raw=true",
              "HUCs.RData",
              method="auto",
              mode="wb")

download.file("https://github.com/ryan-hill/sfs-r-gis-2018/blob/a98da93ec97ce303507e4731ddda5d8055590f39/files/NLCD_OR_2011.RData?raw=true",
              "NLCD_OR_2011.RData",
              method="auto",
              mode="wb")

download.file("https://github.com/ryan-hill/sfs-r-gis-2018/blob/a98da93ec97ce303507e4731ddda5d8055590f39/files/WorkshopData.zip?raw=true",
              "WorkshopData.zip",
              method="auto",
              mode="wb")
              
```

Once downloaded, extract the files with the `unzip` function.

```r
unzip("WorkshopData.zip")
unzip("ESDA.zip")

#Or unzip("WorkshopData.zip", exdir = "your-directory-here") 
```

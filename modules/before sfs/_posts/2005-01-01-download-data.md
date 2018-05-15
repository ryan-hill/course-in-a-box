## Workshop Data

---

For convenience, please download the data before the day of the workshop. 

There are two options to download the data - right-click the link or run the R code below.

**Link**

[data.zip](https://github.com/ryan-hill/sfs-r-gis-2018/blob/a98da93ec97ce303507e4731ddda5d8055590f39/files/data.zip?raw=true){:target="_blank"}

**R Code**

In the code below, replace `your-directory-here` with the folder location where you would like to download the files to.

```r
#Set your working directory
setwd(your-directory-here)

download.file("https://github.com/ryan-hill/sfs-r-gis-2018/blob/a98da93ec97ce303507e4731ddda5d8055590f39/files/data.zip?raw=true",
              "data.zip",
              method="auto",
              mode="wb")           
```

On the day of the workshop, we'll extract the files with the `unzip` function into a project that we will create together.

```r
unzip("data.zip")
#Or unzip("data.zip", exdir = "your-directory-here") 
```

## Download exercise data

---

Now that we have our software setup, we will download the exercise data.

There are two options to download the data - right-click the link or run the R code below.

**Link**

[data.zip](https://github.com/ryan-hill/sfs-r-gis-2018/raw/gh-pages/files/data.zip){:target="_blank"}

**R Code**

In the code below, replace `your-directory-here` with the folder location where you would like to download the files to.

```r
#Set your working directory
setwd(your-directory-here)

download.file("https://github.com/ryan-hill/sfs-r-gis-2018/raw/gh-pages/files/data.zip",
              "data.zip",
              method="auto",
              mode="wb")           
```

On the day of the workshop, we'll extract the files with the `unzip` function into a project that we will create together.

```r
unzip("data.zip")
```

## Workshop Data

---

Now that we have our workshop project set up, we will download the data we will use today. Once downloaded, extract (unzip) the files into the workshop directory. Since we have created an R project and are currently working under this project, the zip file will automatically download the main level of the project folder - this is what we want.

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

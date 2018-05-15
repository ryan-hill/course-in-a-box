## Workshop Data

---

Now that we have our workshop project set up, we will download the data we will use today. Once downloaded, extract (unzip) the files into the workshop directory. Since we have created an R project and are currently working under this project, the zip file will automatically download to the main level of the project folder - this is what we want.

There are two options to download the data - run the R code below or download/unzip manually.

**R Code**

Run the R code below to download the zipped file from website.  This will download to your home directory of your project.

```r
#Set your working directory
setwd(your-directory-here)

download.file("https://github.com/ryan-hill/sfs-r-gis-2018/raw/gh-pages/files/data.zip",
              "data.zip",
              method="auto",
              mode="wb")           
```

Then extract the files with the `unzip` function.  You should now have a folder called `data` with lots of juicy data.  You can look in this folder using the file pane on the lower right.

```r
unzip("data.zip")
```

**Manual download**

If you want to do it the hard way, download the file manually from [this](https://github.com/ryan-hill/sfs-r-gis-2018/raw/gh-pages/files/data.zip) link.  Extract the files into a folder called "data" in your RStudio project.  You'll have to do this outside of RStudio.

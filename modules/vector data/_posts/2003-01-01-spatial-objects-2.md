---
title: "Spatial Objects II"
---

## Spatial Objects II

----

### Reading and writing external data

```r
hucs <- readOGR(dsn = './data', layer = 'HUCs')

writeOGR(hucs, './data', 'HUCs', driver="ESRI Shapefile")
```

### 

###

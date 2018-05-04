wd = '/media/removable/SD\ Card/tmp'

library(rgdal); library(sf); library(maps)

states = readOGR(dsn = wd, layer = 'cb_2017_us_state_500k', verbose = F)

plot(states)
summary(states)

writeOGR(states, wd, 'states', driver = 'ESRI Shapefile')



vpu = readOGR(dsn = wd, layer = 'BoundaryUnit', verbose = F)

vpu = st_read(paste0(wd, '/BoundaryUnit.shp'))

vpu = st_simplify(vpu, dTolerance = 0.001)
st_write(vpu, paste0(wd, '/simplified.shp'))
vpu = st_cast(vpu)
plot(vpu$geometry)

st_crs(vpu) 


6703
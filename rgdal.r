# Install below packages for the first time in R
install.packages("rgdal")
install.packages("RColorBrewer")
# After installation of above packages load the packages
library(rgdal)
library(RColorBrewer)

myshapefile <- readOGR(dsn = "District.shp") 
myshapefile <- spTransform(myshapefile,CRS("+proj=longlat +datum=WGS84 +no_defs"))

hist(myshapefile$Shape_len)





#R and GIS - working with shapefiles
#install.packages("maptools")
#install.packages("rgeos")
#install.packages("sp") 
#install.packages("ggmap")

train <- read.csv("BigMartDataset.csv")

ggplot(train, aes(Outlet_Location_Type, fill = Outlet_Type)) + geom_bar()+
  labs(title = "Stacked Bar Chart", x = "Outlet Location Type", y = "Count of Outlets")

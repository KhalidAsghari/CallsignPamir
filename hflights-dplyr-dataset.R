# Install hflights package with hflights dataset for analysis
install.packages("hflights")
# load teh hflights library
library(hflights)
library(dplyr)
# Check Data types of individual column
data.class(hflights$Year)
data.class(hflights$Month)
data.class(hflights$DayofMonth)
data.class(hflights$DayOfWeek)
data.class(hflights$DepTime)
data.class(hflights$ArrTime)
data.class(hflights$UniqueCarrier)
data.class(hflights$FlightNum)
data.class(hflights$TailNum)
data.class(hflights$ActualElapsedTime)
data.class(hflights$AirTime)
data.class(hflights$ArrDelay)
data.class(hflights$DepDelay)
data.class(hflights$Origin)
data.class(hflights$Dest)
data.class(hflights$Distance)
data.class(hflights$TaxiIn)
data.class(hflights$TaxiOut)
data.class(hflights$Cancelled)
data.class(hflights$CancellationCode)
data.class(hflights$Diverted)


myresult <- hflights %>% filter(Origin == "IAH") %>%
  mutate(FDelayed = if_else(DepDelay>0,TRUE,FALSE,missing=NULL))%>%
  group_by(UniqueCarrier)%>%
  summarise(No=n(),NumDelayed=sum(FDelayed,na.rm=TRUE))%>%
  mutate(DPH=100*(NumDelayed/No))%>%
  arrange(desc(DPH))



#first you have to install the package 
# install.packages("mlbench")
# load the library
library(mlbench)

# load the dataset
data(PimaIndiansDiabetes)

# create a bar plot of each categorical attribute
par(mfrow=c(2,4))

for(i in 1:8) {
  hist(PimaIndiansDiabetes[,i], 
       main=names(PimaIndiansDiabetes)[i])
}
#graphics.off()

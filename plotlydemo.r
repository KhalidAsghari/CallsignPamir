# PLOTLY IS A PACKAGE THAT WILL BE USED FOR COMMERCIAL PURPOSES
install.packages("plotly")
# Call the library 
library(plotly)
# Create the 1st ploty plot
p <- plot_ly(midwest, x = ~percollege, color = ~state, type = "box")
#call the variable
p

abc <- plot_ly(mpg, x = ~displ, color = ~class, type="histogram")

abc

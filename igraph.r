
library(igraph)

g <- graph(c(1,2,2,3,3,4,4,1), directed = TRUE)
plot(g, vertex.color = "green",
     vertex.size= 40,
     edge.color ="red")

g[]

g1 <- graph(c("ali","wali", "ali", "khan", "shah", "ali", "naweed", "wali"))

plot(g1, vertex.color = "green",
     vertex.size= 40,
     edge.color ="red")
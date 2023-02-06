library(factoextra)
library(ggplot2)
library(ggfortify)
library(stats)
library(dplyr)

a=iris[1:4]
sc=scale(a)
fviz_nbclust(
sc, kmeans, method="wss"
) 

km=kmeans(sc,centers = 3)
print( km)

autoplot(km,sc,frame=TRUE)

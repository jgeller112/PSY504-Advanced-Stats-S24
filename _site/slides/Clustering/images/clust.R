


set.seed(1234)
x <- rnorm(12, rep(1:3, each = 4), 0.2)
y <- rnorm(12, rep(c(1, 2, 1), each = 4), 0.2)
plot(x, y, col = "blue", pch = 19, cex = 2)
text(x + 0.05, y + 0.05, labels = as.character(1:12))

## the general idea

1. calculate distance between every point with every other point

dataFrame <- data.frame(x=x, y=y)
dist(dataFrame)

2. Find two points clostest together
rdistxy <- as.matrix(dist(dataFrame))

## Remove the diagonal from consideration
diag(rdistxy) <- diag(rdistxy) + 100000

# Find the index of the points with minimum distance
ind <- which(rdistxy == min(rdistxy), arr.ind = TRUE)
ind

plot(x, y, col = "blue", pch = 19, cex = 2)
text(x + 0.05, y + 0.05, labels = as.character(1:12))
points(x[ind[1, ]], y[ind[1, ]], col = "orange", pch = 19, cex = 2)


> par(mfrow = c(1, 2))
> plot(x, y, col = "blue", pch = 19, cex = 2, main = "Data")
> text(x + 0.05, y + 0.05, labels = as.character(1:12))
> points(x[ind[1, ]], y[ind[1, ]], col = "orange", pch = 19, cex = 2)
> 
  > # Make a cluster and cut it at the right height
  > library(dplyr)
> hcluster <- dist(dataFrame) %>% hclust
> dendro <- as.dendrogram(hcluster)
> cutDendro <- cut(dendro, h = (hcluster$height[1] + 0.00001))
> plot(cutDendro$lower[[11]], yaxt = "n", main = "Begin building tree")


##### Complete 

- max distance



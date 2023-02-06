# Load the iris dataset
iris <- iris

# Display the first 6 rows of the iris dataset
head(iris)

# Store the species labels in a separate variable
iris.labels <- iris$Species 

# Count the number of occurrences of each species
table(iris.labels)

# Store the first 4 columns of iris as iris_data
iris_data <- iris[1:4]

# Display the iris_data
iris_data

# Scale the iris_data
iris_data_scale <- scale(iris_data)

# Display the scaled iris_data
iris_data_scale

# Calculate the distance between the rows in the iris_data_scale
iris_data<- dist(iris_data_scale)

# Load the factoextra library to use the fviz_nbclust function
library (factoextra)

# Visualize the number of clusters required using the elbow method
fviz_nbclust(iris_data_scale, kmeans, method ="wss") +
  labs(subtitle ="Elbow Method")

# Apply the kmeans clustering algorithm
km.out <-kmeans(iris_data_scale, centers =3, nstart =100)

# Print the kmeans output
print(km.out)

# Store the cluster assignment for each row
km.clusters <-km.out$cluster

# Add the species names to the row names of iris_data_scale
rownames(iris_data_scale)<-paste(iris$Species, 1:dim(iris)[1],seq="_")

# Visualize the clusters formed by the kmeans algorithm
fviz_cluster(list(data=iris_data_scale,cluster =km.clusters))
library(ggplot2)
library(dplyr)
library(factoextra)

data <- read.csv("large_pca_data.csv")

#standardization
scaled_data <- scale(data)
head(scaled_data)

#calculating PCA with eigenvalues and eigenvectors
pca_model <- prcomp(scaled_data, center=TRUE, scale=TRUE)
pca_model

#transforming data set into principal components
pca_transformed_data <- as.data.frame(pca_model$x)

#kmeans for the PC1 and PC2
set.seed(150)
cluster_results <- kmeans(pca_transformed_data[,1:2], centers = 3)

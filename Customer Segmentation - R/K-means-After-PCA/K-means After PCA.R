library(ggplot2)
library(dplyr)
library(factoextra)

data <- read.csv("customer_data_pca.csv")

#standardization
scaled_data <- scale(data)
head(scaled_data)

#calculating PCA with eigenvalues and eigenvectors
pca_model <- prcomp(scaled_data, center=TRUE, scale=TRUE)
pca_model

#transforming data set into principal components
pca_transformed_data <- as.data.frame(pca_model$x)


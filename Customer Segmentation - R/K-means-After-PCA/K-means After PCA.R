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

#kmeans for the PC1 and PC2
set.seed(150)
cluster_results <- kmeans(pca_transformed_data[,1:2], centers = 4)

#adding labels to clusters
pca_transformed_data$cluster <- as.factor(cluster_results$cluster)

#drawing cluster results
#PC1 against PC2
ggplot(pca_transformed_data, aes(x= PC1, y= PC2, color=cluster))+
  stat_ellipse(aes(fill=cluster), geom = "polygon", alpha=0.4) + 
  geom_point(size=3, alpha=0.8)+
  labs(title= "PC1 against PC2 distribution of clusters",
       x="PC1",
       y="PC2")+
  theme_minimal()

#drawing proper cluster boundaries
#creating corvex hull for each cluster
compute_hull <- function(df) df[chull(df$PC1, df$PC2),]



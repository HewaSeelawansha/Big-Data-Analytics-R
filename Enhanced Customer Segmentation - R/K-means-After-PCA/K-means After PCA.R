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

#adding labels to clusters
pca_transformed_data$cluster <- as.factor(cluster_results$cluster)

library(GGally)

#PC1 to PC4
ggpairs(
  pca_transformed_data[, c("PC1", "PC2", "PC3", "PC4", "cluster")],
  aes(color = cluster, alpha = 0.6),
  upper = list(continuous = wrap("cor", size = 3))
) +
  theme_minimal() +
  ggtitle("Pairwise Plot of the First 4 Principal Components with Clusters")

#install.packages("cluster")
library(cluster)

# Function to Compute Convex Hull for Given X and Y
compute_hull <- function(df, x, y) {
  df[chull(df[[x]], df[[y]]), ]
}

# Generate Convex Hull Data for All Pairwise Combinations
hull_data <- bind_rows(
  lapply(
    c("PC1", "PC2", "PC3", "PC4"),
    function(x) {
      lapply(
        c("PC1", "PC2", "PC3", "PC4"),
        function(y) {
          if (x != y) {
            pca_transformed_data %>%
              group_by(cluster) %>%
              group_split() %>%
              lapply(compute_hull, x = x, y = y) %>%
              bind_rows() %>%
              mutate(x_col = x, y_col = y)
          }
        }
      )
    }
  ) %>% unlist(recursive = FALSE)
)

# Pairwise Plot with Clusters and Convex Hulls
plot <- ggpairs(
  pca_transformed_data[, c("PC1", "PC2", "PC3", "PC4", "cluster")],
  aes(color = cluster, alpha = 0.6),
  upper = list(continuous = wrap("cor", size = 3)),
  lower = list(continuous = wrap("points", alpha = 0.8, size = 2))
) +
  theme_minimal() +
  ggtitle("Pairwise Plot of the First 4 Principal Components with Clusters")



library(ggplot2)
library(dplyr)
library(factoextra)

data <- read.csv("large_pca_data.csv")

#standardization
scaled_data <- scale(data)
head(scaled_data)


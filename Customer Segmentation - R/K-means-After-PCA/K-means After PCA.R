library(ggplot2)
library(dplyr)
library(factoextra)

data <- read.csv("customer_data_pca.csv")

#standardization
scaled_data <- scale(data)
head(scaled_data)


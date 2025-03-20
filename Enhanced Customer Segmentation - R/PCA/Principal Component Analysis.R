data <- read.csv("D://NSBM//3rd year 2nd semester//Big Data Analysis//Lab//Lab//Week-03 Submission DLE - 23-02-2025//large_pca_data.csv")

library(ggplot2)
#install.packages("GGally")
library(GGally)
library(dplyr)
library(factoextra)

#Standardization
scaled_data <- scale(data)
head(scaled_data)

#calculating PCA with Eigenvalues and Eigenvectors
pca_model <- prcomp(scaled_data, center=TRUE, scale=TRUE)
pca_model
summary(pca_model)

#screen Plot
fviz_eig(pca_model, addlabels = TRUE, ylim = c(0,100))

#transforming data set into principal components
pca_transformed_data <- as.data.frame(pca_model$x)
head(pca_transformed_data)



library(ggplot2)

data <- read.csv("origin.csv")
head(data)
str(data)

#examine the dataset
table(data$Country)

data$Country <- as.factor(data$Country)

#draw a plot to see the data points spread
ggplot(data, aes(x= Height, y= Weight, color=Country))+
  geom_point(size=3, alpha=0.6)+
  labs(title= "Height against weight distribution",
       x="Height",
       y="weight")+
  theme_minimal()

#implementation cluster model using k-means

#let's remove country column
model_data <- data[,c("Height", "Weight")]
head(model_data)

#k-means model
set.seed(150)
results <- kmeans(model_data, centers = 3)

#adding labels to clusters
data$cluster <- as.factor(results$cluster)

#to show the cluster numbers use this "data$cluster"

#drawing cluster results
ggplot(data, aes(x= Height, y= Weight, color=cluster))+
  stat_ellipse(aes(fill=cluster), geom = "polygon", alpha=0.4) + 
  geom_point(size=3, alpha=0.8)+
  labs(title= "Height against weight distribution of clusters",
       x="Height",
       y="weight")+
  theme_minimal()

table(data$Country, data$cluster)

#lets run  for 10 clusters starting from 1
optimal_number <- sapply(1:10, function(k) kmeans(model_data, centers=k)$tot.withinss)

#draw elbow
plot (1:10, optimal_number, type='b', pch=19, col='purple')

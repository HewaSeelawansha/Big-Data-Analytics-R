library(ggplot2)
data <- read.csv("Climate.csv")
head(data)
str(data)

#examine the dataset
table(data$ClimateZone)

data$ClimateZone <- as.factor(data$ClimateZone)

#draw a plot to see the data points spread
ggplot(data, aes(x= Temperature, y= Rainfall, color=ClimateZone))+
  geom_point(size=3, alpha=0.6)+
  labs(title= "Temperature against rainfall distribution",
       x="Temperature",
       y="Rainfall")+
  theme_minimal()

#implementation cluster model using k-means

#let's remove country column
model_data <- data[,c("Temperature", "Rainfall")]
head(model_data)

#k-means model
set.seed(100)
results <- kmeans(model_data, centers = 4)

#adding labels to clusters
data$cluster <- as.factor(results$cluster)

#to show the cluster numbers use this "data$cluster"

#drawing cluster results
ggplot(data, aes(x= Temperature, y= Rainfall, color=cluster))+
  stat_ellipse(aes(fill=cluster), geom = "polygon", alpha=0.4) + 
  geom_point(size=3, alpha=0.8)+
  labs(title= "Temperature against rainfall distribution of clusters",
       x="Temperature",
       y="Rainfall")+
  theme_minimal()

table(data$ClimateZone, data$cluster)

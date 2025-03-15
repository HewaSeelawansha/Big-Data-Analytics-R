library(ggplot2)
data <- read.csv("D://NSBM//3rd year 2nd semester//Big Data Analysis//Lab//Lab//Week-03 Submission DLE - 23-02-2025//large_pca_data.csv")
head(data)
str(data)

#lets run  for 10 clusters starting from 1
optimal_number <- sapply(1:10, function(k) kmeans(data, centers=k)$tot.withinss)

#draw elbow
plot (1:10, optimal_number, type='b', pch=19, col='blue')

#k-means model
set.seed(150)
results <- kmeans(data, centers = 3)

#adding labels to clusters
data$cluster <- as.factor(results$cluster)

#drawing cluster results
#Age against Annual_Income
ggplot(data, aes(x= Age, y= Annual_Income, color=cluster))+
  stat_ellipse(aes(fill=cluster), geom = "polygon", alpha=0.4) + 
  geom_point(size=3, alpha=0.8)+
  labs(title= "Age against Annual_Income distribution of clusters",
       x="Age",
       y="Annual_Income")+
  theme_minimal()

#Age against Spending_Score
ggplot(data, aes(x= Age, y= Spending_Score, color=cluster))+
  stat_ellipse(aes(fill=cluster), geom = "polygon", alpha=0.4) + 
  geom_point(size=3, alpha=0.8)+
  labs(title= "Age against Spending_Score distribution of clusters",
       x="Age",
       y="Spending_Score")+
  theme_minimal()

#Annual_Income against Spending_Score
ggplot(data, aes(x= Annual_Income, y= Spending_Score, color=cluster))+
  stat_ellipse(aes(fill=cluster), geom = "polygon", alpha=0.4) + 
  geom_point(size=3, alpha=0.8)+
  labs(title= "Annual_Income against Spending_Score distribution of clusters",
       x="Annual_Income",
       y="Spending_Score")+
  theme_minimal()



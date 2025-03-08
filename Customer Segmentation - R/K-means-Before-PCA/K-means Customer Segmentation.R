library(ggplot2)
data <- read.csv("customer_data_pca.csv")
head(data)
str(data)

#k-means model
set.seed(150)
results <- kmeans(data, centers = 4)

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

#Age against spending Spending_Score
ggplot(data, aes(x= Age, y= Spending_Score, color=cluster))+
  stat_ellipse(aes(fill=cluster), geom = "polygon", alpha=0.4) + 
  geom_point(size=3, alpha=0.8)+
  labs(title= "Age against Spending_Score distribution of clusters",
       x="Age",
       y="Spending_Score")+
  theme_minimal()

#Annual_Income against spending Spending_Score
ggplot(data, aes(x= Annual_Income, y= Spending_Score, color=cluster))+
  stat_ellipse(aes(fill=cluster), geom = "polygon", alpha=0.4) + 
  geom_point(size=3, alpha=0.8)+
  labs(title= "Annual_Income against Spending_Score distribution of clusters",
       x="Annual_Income",
       y="Spending_Score")+
  theme_minimal()

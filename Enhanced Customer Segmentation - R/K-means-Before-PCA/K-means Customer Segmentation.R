library(ggplot2)
data <- read.csv("large_pca_data.csv")
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

  #Annual_Income against Total_Purchases
ggplot(data, aes(x= Annual_Income, y= Total_Purchases, color=cluster))+
  stat_ellipse(aes(fill=cluster), geom = "polygon", alpha=0.4) + 
  geom_point(size=3, alpha=0.8)+
  labs(title= "Annual_Income against Total_Purchases distribution of clusters",
       x="Annual_Income",
       y="Total_Purchases")+
  theme_minimal()

#Age against Online_Shopping_Frequency
ggplot(data, aes(x= Age, y= Online_Shopping_Frequency, color=cluster))+
  stat_ellipse(aes(fill=cluster), geom = "polygon", alpha=0.4) + 
  geom_point(size=3, alpha=0.8)+
  labs(title= "Age against Online_Shopping_Frequency distribution of clusters",
       x="Age",
       y="Online_Shopping_Frequency")+
  theme_minimal()

#Age against Offline_Shopping_Frequency
ggplot(data, aes(x= Age, y= Offline_Shopping_Frequency, color=cluster))+
  stat_ellipse(aes(fill=cluster), geom = "polygon", alpha=0.4) + 
  geom_point(size=3, alpha=0.8)+
  labs(title= "Age against Offline_Shopping_Frequency distribution of clusters",
       x="Age",
       y="Offline_Shopping_Frequency")+
  theme_minimal()

#Age against Customer_Loyalty_Score
ggplot(data, aes(x= Age, y= Customer_Loyalty_Score, color=cluster))+
  stat_ellipse(aes(fill=cluster), geom = "polygon", alpha=0.4) + 
  geom_point(size=3, alpha=0.8)+
  labs(title= "Age against Customer_Loyalty_Score distribution of clusters",
       x="Age",
       y="Customer_Loyalty_Score")+
  theme_minimal()

#Discount_Usage against Annual_Income
ggplot(data, aes(x= Discount_Usage, y= Annual_Income, color=cluster))+
  stat_ellipse(aes(fill=cluster), geom = "polygon", alpha=0.4) + 
  geom_point(size=3, alpha=0.8)+
  labs(title= "Discount_Usage against Annual_Income distribution of clusters",
       x="Discount_Usage",
       y="Annual_Income")+
  theme_minimal()

#Discount_Usage against Customer_Loyalty_Score
ggplot(data, aes(x= Discount_Usage, y= Customer_Loyalty_Score, color=cluster))+
  stat_ellipse(aes(fill=cluster), geom = "polygon", alpha=0.4) + 
  geom_point(size=3, alpha=0.8)+
  labs(title= "Discount_Usage against Customer_Loyalty_Score distribution of clusters",
       x="Discount_Usage",
       y="Customer_Loyalty_Score")+
  theme_minimal()

#Discount_Usage against Avg_Purchase_Value
ggplot(data, aes(x= Discount_Usage, y= Avg_Purchase_Value, color=cluster))+
  stat_ellipse(aes(fill=cluster), geom = "polygon", alpha=0.4) + 
  geom_point(size=3, alpha=0.8)+
  labs(title= "Discount_Usage against Avg_Purchase_Value distribution of clusters",
       x="Discount_Usage",
       y="Avg_Purchase_Value")+
  theme_minimal()

#Discount_Usage against Avg_Purchase_Value
ggplot(data, aes(x= Discount_Usage, y= Customer_Satisfaction, color=cluster))+
  stat_ellipse(aes(fill=cluster), geom = "polygon", alpha=0.4) + 
  geom_point(size=3, alpha=0.8)+
  labs(title= "Discount_Usage against Customer_Satisfaction distribution of clusters",
       x="Discount_Usage",
       y="Customer_Satisfaction")+
  theme_minimal()

#Avg_Purchase_Value against Annual_Income
ggplot(data, aes(x= Avg_Purchase_Value, y= Annual_Income, color=cluster))+
  stat_ellipse(aes(fill=cluster), geom = "polygon", alpha=0.4) + 
  geom_point(size=3, alpha=0.8)+
  labs(title= "Avg_Purchase_Value against Annual_Income distribution of clusters",
       x="Avg_Purchase_Value",
       y="Annual_Income")+
  theme_minimal()


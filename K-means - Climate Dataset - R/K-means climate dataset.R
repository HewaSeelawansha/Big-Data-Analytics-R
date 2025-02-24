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

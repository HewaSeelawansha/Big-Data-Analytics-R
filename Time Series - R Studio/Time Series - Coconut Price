#instaling requied libraries
install.packages("ggplot2") #for grphs
install.packages("forecast") #model to predict future

#loading to project
library(ggplot2)
library(forecast)

#loading the dataset
data <- read.csv("Coconut_Price_SriLanka_2005_2025.csv")

str(data)

#data pre processing month variable to data format
data$Month <- as.Date(data$Month) #, format = "%Y-%m"

ggplot(data, aes(x = Coconut_Price)) +
  geom_histogram(binwidth = 8, fill = 'green', color = 'black') + 
  labs(title = "Coconut Price Distribution",
       x = "Rs",
       y = "Frequency") +
  theme_minimal()

#creating the time series
coco_t_s <- ts(data$Coconut_Price, start = c(2005,1), frequency = 12)

#plot time series
plot(coco_t_s, main = "Coconut Price Time Series",
     ylab = "Price", xlab="Year", col='blue')

#future predictions
model <- auto.arima(coco_t_s)
predict <- forecast(model, h=24)
plot(predict)

#loading to project
library(ggplot2)
library(forecast)

#loading the dataset
data <- read.csv("Rice_Prices_Dataset.csv")

str(data)

#data pre processing month variable to data format
data$Month <- as.Date(data$Date) 

#creating the time series
rice_t_s <- ts(data$Rice_Prices, start = c(2005,1), frequency = 12)

#plot time series
plot(rice_t_s, main = "Rice Price Time Series",
     ylab = "Price", xlab="Year", col='blue')

#future predictions
model <- auto.arima(rice_t_s)
predict <- forecast(model, h=24)
plot(predict, main = "Rice Price Forecast for Next 24 Months")

#loading to project
library(ggplot2)
library(forecast)

#loading the dataset
data <- read.csv("D://NSBM//3rd year 2nd semester//Big Data Analysis//Lab//Lab//Week-01//Airplanes_Dataset.csv")

str(data)

#data pre processing month variable to data format
data$Month <- as.Date(data$Date) 

#creating the time series
airplane_t_s <- ts(data$Airplanes, start = c(2005,1), frequency = 12)

#plot time series
plot(airplane_t_s, main = "Airplanes Time Series",
     ylab = "Airplanes", xlab="Year", col='blue')

#future predictions
model <- auto.arima(airplane_t_s)
predict <- forecast(model, h=24)
plot(predict, main = "Airplanes Forecast for Next 24 Months")

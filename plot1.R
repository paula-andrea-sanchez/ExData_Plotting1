# 1. Import Data

library(dplyr)
library(lubridate)

data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", 
                   na.strings = "?")

data <- data %>% mutate(Date = dmy(Date)) %>% mutate(Time = hms(Time))
df <- subset(data, Date >= dmy("01/02/2007") & data$Date <= dmy("02/02/2007"))

# 2. Create Plot.1

png(filename = "plot1.png", width = 480, height = 480)

with(df, hist(Global_active_power, col="red", main = "Global Active Power", 
              xlab = "Global Active Power (kilowatts)", bg = "transparent"))

dev.off()


# 1. Import Data

library(dplyr)
library(lubridate)

data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", 
                   na.strings = "?")

data <- data %>% mutate(Date = dmy(Date)) %>% mutate(Time = hms(Time))
df <- subset(data, Date >= dmy("01/02/2007") & data$Date <= dmy("02/02/2007"))


# Create Plot No. 3

png(filename = "plot3.png", width = 480, height = 480)

with(df, plot(Sub_metering_1, type = "l", ylab = "Energy sub metering", 
              xlab = "", xaxt="n", bg = "transparent"))
with(df, lines(Sub_metering_2, col ="red", ylab = "", 
                xlab = "", xaxt="n", bg = "transparent"))
with(df, lines(Sub_metering_3, col ="blue", ylab = "", 
                xlab = "", xaxt="n", bg = "transparent"))
axis(side = 1, at =  seq(0, 2500, by = 1250), labels = c("Thu", "Fri", "Sat"))
legend("topright", pch = "-", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
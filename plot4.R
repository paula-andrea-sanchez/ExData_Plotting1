# 1. Import Data

library(dplyr)
library(lubridate)

data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", 
                   na.strings = "?")

data <- data %>% mutate(Date = dmy(Date)) %>% mutate(Time = hms(Time))
df <- subset(data, Date >= dmy("01/02/2007") & data$Date <= dmy("02/02/2007"))

# Create Plot 4.

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2), mar = c(4, 4, 2, 2))

with(df, {
  plot(Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", 
       xlab ="", xaxt="n", bg = "transparent")
  axis(side = 1, at =  seq(0, 2500, by = 1250), labels = c("Thu", "Fri", "Sat"))
  
  plot(Voltage, type = "l", xlab = "datetime", , xaxt="n", bg = "transparent")
  axis(side = 1, at =  seq(0, 2500, by = 1250), labels = c("Thu", "Fri", "Sat"))
  
  plot(Sub_metering_1, type = "l", ylab = "Energy sub metering", 
       xlab = "", xaxt="n", bg = "transparent")
  lines(Sub_metering_2, col ="red", ylab = "", 
         xlab = "", xaxt="n")
  line(Sub_metering_3, col ="blue", ylab = "", 
         xlab = "", xaxt="n")
  axis(side = 1, at =  seq(0, 2500, by = 1250), labels = c("Thu", "Fri", "Sat"))
  legend("topright", pch = "-", col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(Global_reactive_power, type="l", xlab = "datetime", xaxt = "n", bg = "transparent")
  axis(side = 1, at =  seq(0, 2500, by = 1250), labels = c("Thu", "Fri", "Sat"))
  
})

dev.off()
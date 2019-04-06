# 1. Import Data

library(dplyr)
library(lubridate)

data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", 
                   na.strings = "?")

data <- data %>% mutate(Date = dmy(Date)) %>% mutate(Time = hms(Time))
df <- subset(data, Date >= dmy("01/02/2007") & data$Date <= dmy("02/02/2007"))

# 2. Create Plot No. 2

png(filename = "plot2.png", width = 480, height = 480)

with(df, plot(Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", 
              xlab ="", xaxt="n", bg = "transparent"))
axis(side = 1, at =  seq(0, 2500, by = 1250), labels = c("Thu", "Fri", "Sat"))

dev.off()
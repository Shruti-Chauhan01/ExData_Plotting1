setwd("C:\\Users\\shrut\\OneDrive\\Documents\\Study_Material\\Additional\\Coursera\\EDA\\ExData_Plotting1")
library(data.table)

# Load and filter data
data <- fread("household_power_consumption.txt", na.strings = "?", sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
filtered_data <- data[Date %in% as.Date(c("2007-02-01", "2007-02-02"))]
filtered_data$Datetime <- as.POSIXct(paste(filtered_data$Date, filtered_data$Time),
                                     format = "%Y-%m-%d %H:%M:%S")

# Create PNG device
png("plot4.png", width = 480, height = 480)

# Plot: 4 graphs in 2x2 grid
par(mfrow = c(2, 2))

# Top-left
plot(filtered_data$Datetime, as.numeric(filtered_data$Global_active_power), type = "l",
     xlab = "", ylab = "Global Active Power")

# Top-right
plot(filtered_data$Datetime, as.numeric(filtered_data$Voltage), type = "l",
     xlab = "datetime", ylab = "Voltage")

# Bottom-left
plot(filtered_data$Datetime, as.numeric(filtered_data$Sub_metering_1), type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(filtered_data$Datetime, as.numeric(filtered_data$Sub_metering_2), col = "red")
lines(filtered_data$Datetime, as.numeric(filtered_data$Sub_metering_3), col = "blue")
legend("topright", bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)

# Bottom-right
plot(filtered_data$Datetime, as.numeric(filtered_data$Global_reactive_power), type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

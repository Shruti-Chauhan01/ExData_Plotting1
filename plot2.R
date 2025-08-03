setwd("C:\\Users\\shrut\\OneDrive\\Documents\\Study_Material\\Additional\\Coursera\\EDA\\ExData_Plotting1")
library(data.table)

# Load and filter data
data <- fread("household_power_consumption.txt", na.strings = "?", sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
filtered_data <- data[Date %in% as.Date(c("2007-02-01", "2007-02-02"))]
filtered_data$Datetime <- as.POSIXct(paste(filtered_data$Date, filtered_data$Time),
                                     format = "%Y-%m-%d %H:%M:%S")

# Create PNG device
png("plot2.png", width = 480, height = 480)

# Plot: Global Active Power over time
plot(filtered_data$Datetime, as.numeric(filtered_data$Global_active_power), type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()

# Load required library
setwd("C:\\Users\\shrut\\OneDrive\\Documents\\Study_Material\\Additional\\Coursera\\EDA\\ExData_Plotting1")
library(data.table)

# Load and filter
data <- fread("household_power_consumption.txt", na.strings = "?", sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
filtered_data <- data[Date %in% as.Date(c("2007-02-01", "2007-02-02"))]

# Create proper datetime column
filtered_data$Datetime <- as.POSIXct(paste(filtered_data$Date, filtered_data$Time),
                                     format = "%Y-%m-%d %H:%M:%S")

# Load and filter data as before...

# Create PNG
png("plot1.png", width = 480, height = 480)

# Plot
hist(as.numeric(filtered_data$Global_active_power), 
     col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.off()

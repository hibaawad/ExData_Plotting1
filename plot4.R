setwd("/Users/hawad/dev/ExData_Plotting1")
hpc <- read.table("household_power_consumption.txt", header=TRUE, na.strings = "", sep = ";",  stringsAsFactors = FALSE)
hpc <- transform(hpc, Global_active_power = as.numeric(Global_active_power))
hpc$DateTime <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- strptime(hpc$DateTime, format = "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date (hpc$Date, format = "%d/%m/%Y")
lim_data <- subset(hpc, Date  %in% c(as.Date("01/02/2007",format = "%d/%m/%Y"), as.Date("02/02/2007", format = "%d/%m/%Y")))
png(file="plot4.png")


par(mfrow = c(2, 2), mar = c(2, 4, 2, 1))


plot(lim_data$DateTime, lim_data$Global_active_power, type="l", col="black", ylab = "Global Active Power")
plot(lim_data$DateTime, lim_data$Voltage, type="l", col="black", ylab = "Voltage", xlab="dateTime")
plot(lim_data$DateTime, lim_data$Sub_metering_1, type="l", col="black", ylab = "Energy Sub Meeting")
lines(lim_data$DateTime, lim_data$Sub_metering_2, type="l", col="red")
lines(lim_data$DateTime, lim_data$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(lim_data$DateTime, lim_data$Global_reactive_power,type="l",ylab = "GLobal_reactive_power", col="black", xlab="datetime")
dev.off()



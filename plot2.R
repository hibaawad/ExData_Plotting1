
setwd("/Users/hawad/dev/ExData_Plotting1")
hpc <- read.table("household_power_consumption.txt", header=TRUE, na.strings = "", sep = ";",  stringsAsFactors = FALSE)
hpc <- transform(hpc, Global_active_power = as.numeric(Global_active_power))
hpc$DateTime <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- strptime(hpc$DateTime, format = "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date (hpc$Date, format = "%d/%m/%Y")
lim_data <- subset(hpc, Date  %in% c(as.Date("01/02/2007",format = "%d/%m/%Y"), as.Date("02/02/2007", format = "%d/%m/%Y")))
lim_data<- subset(lim_data, !is.na(Global_active_power))
lim_data<- subset(lim_data, !is.na(DateTime))

png(file="plot2.png")

plot(lim_data$DateTime, lim_data$Global_active_power, type="l", col="black", ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()
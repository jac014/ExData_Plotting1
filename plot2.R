##Load data and filter
powerall<- read.table(file = "household_power_consumption.txt", header = TRUE ,sep = ";",na.strings = "?", colClasses = c("character","character", rep("numeric",7)))
powercons <- subset(powerall, Date == "2/2/2007" | Date == "1/2/2007")
rm(powerall)
##Set date format
powercons$Date <- strptime(paste(powercons$Date,powercons$Time), "%d/%m/%Y %H:%M:%S")
##Plot and output
par(bg=NA, mar=c(3, 4, 4, 3))
plot(powercons$Date, powercons$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "",cex.lab = .75, cex.axis = .75)
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()

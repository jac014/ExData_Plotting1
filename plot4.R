##Load data and filter
powerall<- read.table(file = "household_power_consumption.txt", header = TRUE ,sep = ";",na.strings = "?", colClasses = c("character","character", rep("numeric",7)))
powercons <- subset(powerall, Date == "2/2/2007" | Date == "1/2/2007")
rm(powerall)
##Set date format
powercons$Date <- strptime(paste(powercons$Date,powercons$Time), "%d/%m/%Y %H:%M:%S")
##Plot and output
par(bg=NA, mfcol = c(2, 2))
with(powercons, {
  plot(powercons$Date, powercons$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "",cex.lab = .75, cex.axis = .75)
  plot(x = powercons$Date, y = powercons$Sub_metering_1, type = "l", ylab = "Energy sub metering",cex.lab = .75, cex.axis = .75, xlab = "")
  lines(x= powercons$Date, y = powercons$Sub_metering_2, type="l", col="red")
  lines(x= powercons$Date, y = powercons$Sub_metering_3, type="l", col="blue")
  legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = .75, bty = "n")
  plot(powercons$Date, powercons$Voltage, type = "l", ylab = "Voltage", xlab = "datetime",cex.lab = .75, cex.axis = .75)
  plot(powercons$Date, powercons$Global_reactive_power, type = "l", ylab = "Global_reactive_power" , xlab = "datetime",cex.lab = .75, cex.axis = .75)
})
dev.copy(png, file = "plot4.png", width=480, height=480)
dev.off()

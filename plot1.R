powerall<- read.table(file = "household_power_consumption.txt", header = TRUE ,sep = ";",na.strings = "?", colClasses = c("character","character", rep("numeric",7)))
powercons <- subset(power, Date == "2/2/2007" | Date == "1/2/2007")
rm(powerall)
powercons$Date <- as.Date(powercons$Date, format='%d/%m/%Y')
hist(powercons$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red", cex.lab = .75, cex.main = .75, cex.axis = .75)
dev.copy(png, file = "plot1.png", width=480, height=480) ## Copy  plot to a PNG file
dev.off()

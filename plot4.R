plotone <- read.table('electric.txt', header = TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
plotonesub <- subset(plotone,Date %in% c("5/2/2007","6/2/2007") )
plotonesub$td <- strptime(paste(plotonesub$Date, plotonesub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plotonesub$Sub_metering_1 <- as.numeric(plotonesub$Sub_metering_1)
plotonesub$Sub_metering_2 <- as.numeric(plotonesub$Sub_metering_2)
plotonesub$Sub_metering_3 <- as.numeric(plotonesub$Sub_metering_3)
png("plot2.png", width=480, height=480)   
plot(plotonesub$td,plotonesub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Submetering")
lines(plotonesub$td,plotonesub$Sub_metering_2, col = "red")
lines(plotonesub$td,plotonesub$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

png("plot4real.png", width=480, height=480)
par(mfrow = c(2, 2)) 

## Plot left top 
plotonesub$td <- strptime(paste(plotonesub$Date, plotonesub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plotonesub$Global_active_power <- as.numeric(plotonesub$Global_active_power)
plot(plotonesub$td,plotonesub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## plot top right 
plotonesub$Voltage <- as.numeric(plotonesub$Voltage)
plot(plotonesub$td,plotonesub$Voltage, type = "l", xlab="datetime", ylab = "Voltage")

##Plot bottom left 

plotonesub$Sub_metering_1 <- as.numeric(plotonesub$Sub_metering_1)
plotonesub$Sub_metering_2 <- as.numeric(plotonesub$Sub_metering_2)
plotonesub$Sub_metering_3 <- as.numeric(plotonesub$Sub_metering_3)
plot(plotonesub$td,plotonesub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Submetering")
lines(plotonesub$td,plotonesub$Sub_metering_2, col = "red")
lines(plotonesub$td,plotonesub$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"))


## Plot bottom right 

plotonesub$Global_reactive_power <- as.numeric(plotonesub$Global_reactive_power)
plot(plotonesub$td,plotonesub$Global_reactive_power, type = "l", xlab = "datetime",ylab = "Global_Reactive_Power")

dev.off()
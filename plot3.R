## Plot 3 script

## Read in the data
householdData <- read.table( "household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?" )

## Only choose the data that corresponds to 2/1/2007 and 2/2/2007
selectedData <- subset( householdData, Date == "1/2/2007" | Date == "2/2/2007"  )

## Combine the date and time fields and convert to a date object
selectedData$TimeStamp <- paste( selectedData$Date, selectedData$Time )
selectedData$TimeStamp <- strptime( selectedData$TimeStamp, "%d/%m/%Y %H:%M:%S" )

## open device to png file
png( file="plot3.png" )

## create the plot
plot(selectedData$TimeStamp, selectedData$Sub_metering_1, type="l", xlab="", 
     ylab = "Energy sub metering")
lines(selectedData$TimeStamp, selectedData$Sub_metering_2, col = "red")
lines(selectedData$TimeStamp, selectedData$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lwd=1, lty=1, col=c("black", "red", "blue"))
       
## close device
dev.off()
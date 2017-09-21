## Plot 2 script

## Read in the data
householdData <- read.table( "household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?" )

## Only choose the data that corresponds to 2/1/2007 and 2/2/2007
selectedData <- subset( householdData, Date == "1/2/2007" | Date == "2/2/2007"  )

## Combine the date and time fields and convert to a date object
selectedData$TimeStamp <- paste( selectedData$Date, selectedData$Time )
selectedData$TimeStamp <- strptime( selectedData$TimeStamp, "%d/%m/%Y %H:%M:%S" )

## open device to png file
png( file="plot2.png" )

## create the plot
plot(selectedData$TimeStamp, selectedData$Global_active_power, type="l", xlab="", 
     ylab = "Global Active Power (kilowatts)")

## close device
dev.off()
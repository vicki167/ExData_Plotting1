## Plot 1 script

## Read in the data
householdData <- read.table( "household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?" )

## Only choose the data that corresponds to 2/1/2007 and 2/2/2007
selectedData <- subset( householdData, Date == "1/2/2007" | Date == "2/2/2007"  )

## open device to png file
png( file="plot1.png" )
## create the plot
hist(selectedData$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
## close device
dev.off()
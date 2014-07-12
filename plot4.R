## Exploratory Data Analysis Course Project 1, plot 4
## Requires the original data file (household_power_consumption.txt) to be in the working directory
## Requires lubridate 
## Read the original data file from the specified dates, set na.strings to be ?, set header information as in original file

fd <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';', na.strings="?")
colnames(fd) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

## Format date and time columns to be in correct format, replace date column with combined date and time
## Remove Time column

fd$Date <- dmy_hms(paste(fd$Date,fd$Time, sep = " "))
fd$Time <- NULL

## Create file, draw the plot and close graphical device
png(filename= "plot4.png", width= 480, height = 480)
par(mfrow=c(2,2))
with(fd, {
        plot(fd$Date, fd$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
        plot(fd$Date, fd$Voltage, type="l", xlab="datetime", ylab="Voltage")
        with(fd, plot(Date, Sub_metering_1,  type = "l", xlab="", ylab="Energy sub metering"))
        with(fd, points(Date, Sub_metering_2, type="l", col="red"))
        with(fd, points(Date, Sub_metering_3, type="l", col="blue"))
        legend("topright", pch="_" , bty="n", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(fd$Date, fd$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
})
dev.off()
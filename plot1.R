## Exploratory Data Analysis Course Project 1, plot 1
## Requires the original data file (household_power_consumption.txt) to be in the working directory
## Requires lubridate 
## Read the original data file from the specified dates, set na.strings to be ?, set header information as in original file

fd <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';', na.strings="?")
colnames(fd) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

## Format date and time columns to be in correct format, replace date column with combined date and time
## Remove Time column

fd$Date <- dmy_hms(paste(fd$Date,fd$Time, sep = " "))
fd$Time <- NULL

## Create file, draw the histogram and close graphical device
png(filename= "plot1.png", width= 480, height =480)
hist(fd$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()


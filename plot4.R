colnames <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
a <- grep("1/2/2007", readLines("household_power_consumption.txt"))[1]
b <- grep("3/2/2007", readLines("household_power_consumption.txt"))[1]
data <- read.table("household_power_consumption.txt",col.names=colnames,sep=";",skip=a-1,na.strings="?",nrows=(b-a))
data[[1]] <- strptime(paste(data[[1]],data[[2]]),format="%d/%m/%Y %H:%M:%S")
png(file="plot2.png")
plot(data[[1]],data[[3]],type="l",ylab="Global Active Power (kilowatts)",xlab="Date")
dev.off()
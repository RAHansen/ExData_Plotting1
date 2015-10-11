# Project 1 - Plot 4

# Read the data file
  filename = "power_data/household_power_consumption.txt"
  message("Reading data from ", filename)
  pdata <- read.table(filename, header=TRUE, sep=";", na.strings=c("?",""))
  
# set class type for date column
  message("Set date type")
  pdata$Date <- as.Date(pdata$Date, format="%d/%m/%Y")
 
# subset to dates of interest
  message("Subset to dates of interest. ")
  pdata <- pdata[pdata$Date=="2007-02-01" | pdata$Date=="2007-02-02",]
  message("Number of rows = ", nrow(pdata))
    
# set type for time column
  pdata$Time <- strptime(paste(pdata$Date, pdata$Time), format = "%Y-%m-%d %H:%M:%S")

# plot multiple charts
  message("Creating plot4.png")
  png(filename="plot4.png", type="cairo")
  par(mfrow=c(2,2))
  
  # Chart 1
  plot(pdata$Time, pdata$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  
  # Chart 2
  plot(pdata$Time, pdata$Voltage, type="l", ylab="Voltage", xlab="datetime")
  
  # Chart 3
  plot(pdata$Time, pdata$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(pdata$Time, pdata$Sub_metering_2, col="red")
  lines(pdata$Time, pdata$Sub_metering_3, col="blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", lty=1, col=c("black", "red", "blue"))

  # Chart 4
  plot(pdata$Time, pdata$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
  
  dev.off()
  
  message("Complete.")
  
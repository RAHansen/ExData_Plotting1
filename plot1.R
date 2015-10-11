# Project 1 - Plot 1

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

# plot histogram  
  message("Creating plot1.png")
  png(filename="plot1.png", type="cairo")
  hist(pdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
  dev.off()
  
  message("Complete.")
  
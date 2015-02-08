library(dplyr)

# Load the full Data into a variable
fullData <- read.csv("household_power_consumption.txt",sep=";")

# filter the data needed
data <- filter(fullData,grepl("^2/2/2007|^1/2/2007",Date))
# Convert Date/Time
data$DateTime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")


#Convert active power to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

#Start the PNG file output
png("plot1.png",bg="transparent",width = 480,height = 480)

#plat chart
hist(data$Global_active_power/1000,col="red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()

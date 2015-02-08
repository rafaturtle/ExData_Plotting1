library(dplyr)

# Load the full Data into a variable
fullData <- read.csv("household_power_consumption.txt",sep=";")

# filter the data needed
data <- filter(fullData,grepl("^2/2/2007|^1/2/2007",Date))

# Convert Date/Time
data$DateTime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")


#Convert active power to numeric
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

#Start the PNG file output
png("plot3.png",bg="transparent",width = 480,height = 480)

#plat chart
plot(x = data$DateTime, y = data$Sub_metering_1,type = "l",ylab = "Energy sub metering",xlab = "", col = "black")
lines(x = data$DateTime, y = data$Sub_metering_2,type = "l", col = "red")
lines(x = data$DateTime, y = data$Sub_metering_3,type = "l", col = "blue")
legend("topright", col= c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1)
dev.off()

library(dplyr)

# Load the full Data into a variable
fullData <- read.csv("household_power_consumption.txt",sep=";")

# filter the data needed
data <- filter(fullData,grepl("^2/2/2007|^1/2/2007",Date))

# Convert Date/Time
data$DateTime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")


#Convert active power to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Voltage <- as.numeric(data$Voltage)
#Start the PNG file output
png("plot4.png",bg="transparent",width = 480,height = 480)

par(mfrow=c(2,2))

#plat chart 1
plot(x = data$DateTime, y = data$Global_active_power / 1000,type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")
#plot chart 2
plot(x = data$DateTime, y = data$Voltage ,type = "l",ylab = "Voltage",xlab = "datetime")

#plot chart 3
plot(x = data$DateTime, y = data$Sub_metering_1,type = "l",ylab = "Energy sub metering",xlab = "", col = "black")
lines(x = data$DateTime, y = data$Sub_metering_2,type = "l", col = "red")
lines(x = data$DateTime, y = data$Sub_metering_3,type = "l", col = "blue")
legend("topright", col= c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1)

#plot chart 4
plot(x= data$DateTime,y = data$Global_reactive_power / 400, type = "l",ylab = "Global_reactive_power")

dev.off()


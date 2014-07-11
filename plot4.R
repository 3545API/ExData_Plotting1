## set working directory and read .txt file into myData
setwd("./Desktop/Coursera/Exploratory Data Analysis")
myData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
## create myDataSubset and read myData from 2007-02-01 and 2007-02-02
myDataSubset <- myData[myData$Date == "1/2/2007" | myData$Date == "2/2/2007", ]
## convert the classes of Date and Time
Date <- as.Date(myDataSubset[ , 1], format = "%d/%m/%Y")
Time <- myDataSubset[ , 2]
## combine Date and Time, use strptime() function to prepare "weekday x-axis" generation 
DT <- paste(Date, Time)
Xaxis <- strptime(DT, format = "%Y-%m-%d %H:%M:%S")
## generate plot4.png
png(file = "plot4.png")
par(mfcol = c(2, 2))
## plot top-left
plot(Xaxis, myDataSubset[ , 3], type = "n", xlab = "", ylab = "Global Active Power")
lines(Xaxis, myDataSubset[ , 3])
## plot bottom-left
plot(Xaxis, myDataSubset[ , 7], type = "n", xlab = "", ylab = "Energy sub metering")
lines(Xaxis, myDataSubset[ , 7])
lines(Xaxis, myDataSubset[ , 8], col = "red")
lines(Xaxis, myDataSubset[ , 9], col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75, bty = "n")
## plot top-right
plot(Xaxis, myDataSubset[ , 5], type = "n", xlab = "datetime", ylab = "Voltage")
lines(Xaxis, myDataSubset[ , 5])
## plot bottom-right
plot(Xaxis, myDataSubset[ , 4], type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines(Xaxis, myDataSubset[ , 4])
dev.off()
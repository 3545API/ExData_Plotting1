## set working directory and read .txt file into myData
setwd("./Desktop/Coursera/Exploratory Data Analysis/Project_1")
myData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
## create myDataSubset and read myData from 2007-02-01 and 2007-02-02
myDataSubset <- myData[myData$Date == "1/2/2007" | myData$Date == "2/2/2007", ]
## convert the classes of Date and Time
Date <- as.Date(myDataSubset[ , 1], format = "%d/%m/%Y")
Time <- myDataSubset[ , 2]
## combine Date and Time, use strptime() function to prepare "weekday x-axis" generation 
DT <- paste(Date, Time)
Xaxis <- strptime(DT, format = "%Y-%m-%d %H:%M:%S")
## generate plot2.png
setwd("./ExData_Plotting1")
png(file = "plot2.png")
plot(Xaxis, myDataSubset[ , 3], type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(Xaxis, myDataSubset[ , 3])
dev.off()
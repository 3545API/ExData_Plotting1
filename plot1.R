## set working directory and read .txt file into myData
setwd("./Desktop/Coursera/Exploratory Data Analysis/Project_1")
myData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
## create myDataSubset and read myData from 2007-02-01 and 2007-02-02
myDataSubset <- myData[myData$Date == "1/2/2007" | myData$Date == "2/2/2007", ]
## generate plot1.png
setwd("./ExData_Plotting1")
png(file = "plot1.png")
hist(myDataSubset[ , 3], col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
# Script for Course Exploratory Data Analysis W1 Project
# Script for fierst Plot 02

# load the packages
setwd("D:/R/DataScience") #you can change the path to your own path.

# Create data folder
if(!file.exists("Exploratory Data Analysis W1")) {
  dir.create("Exploratory Data Analysis W1")
}

# get the data, load it into data.frames
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl,destfile = "./Exploratory Data Analysis W1/household_power_consumption.zip")
unzip("./Exploratory Data Analysis W1/household_power_consumption.zip") # unzips to the home dir

#read the txt file
PowerCon <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

#Change classes of Date and Time variables
PowerCon$Date <- as.Date(PowerCon$Date, format = "%d/%m/%Y")

#Choose data from "2007-2-1" to "2007-2-2"
PowerCon <- PowerCon[PowerCon$Date >= "2007-2-1" & PowerCon$Date < "2007-2-3",]

#Change classes of Data's 3:8 columns
PowerCon[,3] <- as.numeric(PowerCon[,3])
PowerCon[,4] <- as.numeric(PowerCon[,4])
PowerCon[,5] <- as.numeric(PowerCon[,5])
PowerCon[,6] <- as.numeric(PowerCon[,6])
PowerCon[,7] <- as.numeric(PowerCon[,7])
PowerCon[,8] <- as.numeric(PowerCon[,8])

#Add new variable for classe Date and Time
PowerCon$DateTime <- strptime(paste(PowerCon$Date,PowerCon$Time),
                                 format = "%Y-%m-%d %H:%M:%S")
with(PowerCon, plot(DateTime, Global_active_power, type = "l", xlab = "",
                       ylab = "Global Active Power (kilowatts)", xaxt = "n"))
axis(side = 1, at = c(as.numeric(PowerCon$DateTime[1]),
                      as.numeric(PowerCon$DateTime[1441]),
                      as.numeric(PowerCon$DateTime[2880])),labels = c("Thu","Fri","Sat"))



#Save plot to a PNG file
dev.copy(device = png, width = 480, height = 480, file = "Plot2.png")
dev.off()


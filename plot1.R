#install tidyverse package
install.packages("tidyverse")
library(tidyverse)

#download and unzip dataset
fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("household_power_consumption.txt")){
  download.file(fileurl,"epc.zip")
  unzip("epc.zip")
}

#load data into R
epc<-read.csv("household_power_consumption.txt", sep=";")
epcdata<-filter(epc,Date=="1/2/2007" | Date=="2/2/2007")

#clean Global Active Power data
globalactivepower<-as.numeric(as.character(epcdata$Global_active_power))

#create histogram
hist(globalactivepower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#save to PNG
dev.copy(png,width=480,height=480,file="plot1.png",)
dev.off()
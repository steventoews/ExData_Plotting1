#install tidyverse package
install.packages("tidyverse")
library(tidyverse)
library(lubridate)

#download and unzip dataset
fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("household_power_consumption.txt")){
  download.file(fileurl,"epc.zip")
  unzip("epc.zip")
}

#load data into R
epc<-read.csv("household_power_consumption.txt", sep=";")
epcdata<-filter(epc,Date=="1/2/2007" | Date=="2/2/2007")

#clean datetime
epcdata$DateTime<-paste(as.character(epcdata$Date),as.character(epcdata$Time))
epcdata$DateTime<-dmy_hms(epcdata$DateTime)

#clean Global_active_power
epcdata$Global_active_power<-as.numeric(as.character(epcdata$Global_active_power))

#create histogram
with(epcdata, plot(DateTime,Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts))"))
dev.copy(png,height=480,width=480,"plot2.png")
dev.off()
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

#clean Sub_Metering Variables
epcdata$Sub_metering_1<-as.numeric(as.character(epcdata$Sub_metering_1))
epcdata$Sub_metering_2<-as.numeric(as.character(epcdata$Sub_metering_2))
epcdata$Sub_metering_3<-as.numeric(as.character(epcdata$Sub_metering_3))

#create histogram
with(epcdata,plot(DateTime,Sub_metering_1, xlab="",ylab="Energy sub metering", type="l"))
lines(epcdata$DateTime,epcdata$Sub_metering_2,col="red")
lines(epcdata$DateTime,epcdata$Sub_metering_3,col="blue")
legend("topright", legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, cex=0.8)

dev.copy(png, width=480, height=480, "plot3.png")
dev.off()
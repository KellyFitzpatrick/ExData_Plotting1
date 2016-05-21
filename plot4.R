
#Plot 4 for Coursera Course
# I left the code that I was working with and used # to footnote my progress
# combo of all 4 graphs

library(ggplot2)
library(jpeg)


#data<-read.table("F://users/kfitzpatrick/Kelly/R Code/Explore Data/household_power_consumption.txt",sep= ";", header=TRUE)


data<-read.table("C://Kelly/Coursera/household_power_consumption.txt",sep= ";", header=TRUE)

###Update the class setting for the variables used


class(data$Date)
data$Date<-as.Date(data$Date,"%d/%m/%Y") #capital Y is a 4 digit year

subset.data <- subset(data, data$Date=="2007-02-01" |data$Date=="2007-02-02")#2880X9

###Update the class setting for the variables used


class(subset.data$Global_active_power)
subset.data$Global_active_power<-as.numeric(paste(subset.data$Global_active_power))

subset.data$Sub_metering_1<-as.numeric(paste(subset.data$Sub_metering_1))
subset.data$Sub_metering_2<-as.numeric(paste(subset.data$Sub_metering_2))
subset.data$Sub_metering_3<-as.numeric(paste(subset.data$Sub_metering_3))

subset.data$Voltage<-as.numeric(paste(subset.data$Voltage))

subset.data$Global_reactive_power<-as.numeric(paste(subset.data$Global_reactive_power))





##edit the time column
subset.data$Time <- c(1:2880)

par(mfcol=c(2,2))


#plot1
with(subset.data,plot(Time,Global_active_power, type="l",xlab=" ",ylab="Global Active Power",xaxt="n"))

axis(1, at=c(1,1441,2880),labels = c("Thur","Fri","Sat"), las=1)
#summary(subset.data)

#plot2


with(subset.data,plot(Sub_metering_1, type="l",xlab=" ",ylab="Energy sub metering",xaxt="n"))
lines(subset.data$Sub_metering_2,col="red")
lines(subset.data$Sub_metering_3,col="blue")
axis(1, at=c(1,1441,2880),labels = c("Thur","Fri","Sat"), las=1)

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1, 1, 1),col=c(1,2,4),merge=TRUE,cex=.75)


#plot3 Voltage
with(subset.data,plot(Time,Voltage, type="l",xlab="datetime",ylab="Voltage",xaxt="n"))

axis(1, at=c(1,1441,2880),labels = c("Thur","Fri","Sat"), las=1)

#summary(subset.data)

#plot4 Global Reactive Power

with(subset.data,plot(Time,Global_reactive_power, type="l",xlab="datetime",xaxt="n"))

axis(1, at=c(1,1441,2880),labels = c("Thur","Fri","Sat"), las=1)



dev.copy(png,filename = "plot4.png",width = 480, height = 480)
dev.off()


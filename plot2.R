
#Plot 2 for Coursera Course
# I left the code that I was working with and used # to footnote my progress

library(ggplot2)
library(jpeg)


data<-read.table("F://users/kfitzpatrick/Kelly/R Code/Explore Data/household_power_consumption.txt",sep= ";", header=TRUE)


#data<-read.table("C://Kelly/Coursera/household_power_consumption.txt",sep= ";", header=TRUE)
#head(data)
#table(train_names)  
#good<-complete.cases(data[,pollutant])
#newdata<-data[good,][1:4]

###Update the class setting for the variables used


class(data$Date)
data$Date<-as.Date(data$Date,"%d/%m/%Y") #capital Y is a 4 digit year

subset.data <- subset(data, data$Date=="2007-02-01" |data$Date=="2007-02-02")#2880X9

###Update the class setting for the variables used


class(subset.data$Global_active_power)
subset.data$Global_active_power<-as.numeric(paste(subset.data$Global_active_power))


#head(subset.data) #check the data file


##edit the time column
subset.data$Time <- c(1:2880)

with(subset.data,plot(Time,Global_active_power, type="l",xlab=" ",ylab="Global Active Power (kilowatts)",xaxt="n"))

axis(1, at=c(1,1441,2880),labels = c("Thur","Fri","Sat"), las=1)
#summary(subset.data)

dev.copy(png,filename = "plot2.png",width = 480, height = 480)
dev.off()




#Plot 1 for Coursera Course
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


#head(data) #check the data file

with(subset.data,hist(Global_active_power, col="red",breaks=13,xlab="Global Active Power (kilowatts)",main="Global Active Power",xaxt="n"))

axis(1, at = c(0,2,4,6), las=1)
#summary(subset.data)

dev.copy(png,filename = "plot1.png",width = 480, height = 480)
dev.off()


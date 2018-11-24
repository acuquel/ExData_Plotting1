# plot3.R
# Coursera Data Science Specialization - Exploratory Data Analysis - Week 01 - Course Project 
# Script to reproduce third plot of the course project


dataset <- read.table("../../household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")

x <- paste(dataset$Date, dataset$Time)
dataset$Time <- strptime(x,format="%d/%m/%Y %H:%M:%S")
dataset$Date <- as.Date(dataset$Date,format = "%d/%m/%Y")

dataset <- dataset[dataset$Date >= "2007-02-01" & dataset$Date < "2007-02-03",]

dev.copy(png,'plot3.png')
with(dataset,plot(Time,Sub_metering_1,type='l',col='black',xlab="",ylab='Energy sub metering'))
with(dataset,lines(Time,Sub_metering_2,type='l',col='red'))
with(dataset,lines(Time,Sub_metering_3,type='l',col='blue'))
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lty=1)
dev.off()


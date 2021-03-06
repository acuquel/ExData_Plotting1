# plot1.R
# Coursera Data Science Specialization - Exploratory Data Analysis - Week 01 - Course Project 
# Script to reproduce first plot of the course project


dataset <- read.table("../../household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")

x <- paste(dataset$Date, dataset$Time)
dataset$Time <- strptime(x,format="%d/%m/%Y %H:%M:%S")
dataset$Date <- as.Date(dataset$Date,format = "%d/%m/%Y")

dataset <- dataset[dataset$Date >= "2007-02-01" & dataset$Date < "2007-02-03",]

dev.copy(png,'plot1.png')
hist(dataset$Global_active_power,freq=T,col='red',xlab='Global Active Power (kilowatts)',main='Global Active Power')
dev.off()






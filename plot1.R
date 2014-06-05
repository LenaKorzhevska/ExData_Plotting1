#reading data from .txt file into table
data1<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)))

#subsetting the rows which we will use - 2 days in February: 1/02/2007 and 2/02/2007
data<-subset(x=data1,data1$Date=="1/2/2007" | data1$Date=="2/2/2007")


#plotting histogram on png.device
png("plot1.png")
hist(data$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
dev.off()

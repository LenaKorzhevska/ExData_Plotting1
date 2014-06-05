#reading data from .txt file into table
data1<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)))

#subsetting the rows which we will use - 2 days in February: 1/02/2007 and 2/02/2007
data<-subset(x=data1,data1$Date=="1/2/2007" | data1$Date=="2/2/2007")

#creating new column with proper Date-Time formating
data<-cbind(data,DateTime=strptime(paste(data[,1],data[,2]), format = "%d/%m/%Y %H:%M:%S"))

#plotting 4 scatterplots on png.device
png("plot4.png")

par(mfrow=c(2,2))

plot(data$DateTime,data$Global_active_power,xlab="",ylab="Global Active Power",col="black",type= "l")

plot(data$DateTime,data$Voltage,xlab="datetime",ylab="Voltage",col="black",type= "l")

plot(data$DateTime,data$Sub_metering_1,xlab="",ylab="Energy sub metering",type= "n")
lines(data$DateTime,data$Sub_metering_1,col="black")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,bty="n")

plot(data$DateTime,data$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",col="black",type= "l")

dev.off()

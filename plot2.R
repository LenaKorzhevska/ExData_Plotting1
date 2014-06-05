#setClass('myDate')
#setClass('myTime')
#setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
#setAs("character","myTime", function(from) strptime(from, format="%d/%m/%Y %H:%M:%S") )


#reading data from .txt file into table
data1<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",colClasses=c(rep("character",2),rep("numeric",7)))

#subsetting the rows which we will use - 2 days in February: 1/02/2007 and 2/02/2007
data<-subset(x=data1,data1$Date=="1/2/2007" | data1$Date=="2/2/2007")

#creating new column with proper Date-Time formating
data<-cbind(data,DateTime=strptime(paste(data[,1],data[,2]), format = "%d/%m/%Y %H:%M:%S"))

#plotting scatterplot on png.device
png("plot2.png")
plot(data$DateTime,data$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",col="black",type= "l")

dev.off()

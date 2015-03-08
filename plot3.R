# I modified the file "household_power_consumption.txt" so that it only
# contains the data on 1/2/2007 and 2/2/2007

data<- read.table("household_power_consumption.txt",sep=";",header=TRUE)

# The following three lines of code convert the string information in data$Date
# and data$Time into actual time format and put it in a new column, which is
# data$datetime

data[, 1] <- as.Date(data[,1],format="%d/%m/%Y")
data$datetime = paste (data[,1], data[,2],sep="_")
data$datetime<-strptime(data$datetime, format= "%F_%H:%M:%S")

plot(data$datetime, data$Sub_metering_1, xlab="",ylab="Energy sub metering",pch=20, cex=0)
lines(data$datetime, data$Sub_metering_1, col="black")
lines(data$datetime, data$Sub_metering_2, col="red")
lines(data$datetime, data$Sub_metering_3, col="blue")

legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,file="plot3.png")

dev.off()

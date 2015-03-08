# I modified the file "household_power_consumption.txt" so that it only
# contains the data on 1/2/2007 and 2/2/2007

data<- read.table("household_power_consumption.txt",sep=";",header=TRUE)

# The following three lines of code convert the string information in data$Date
# and data$Time into actual time format and put it in a new column, which is
# data$datetime

data[, 1] <- as.Date(data[,1],format="%d/%m/%Y")
data$datetime = paste (data[,1], data[,2],sep="_")
data$datetime<-strptime(data$datetime, format= "%F_%H:%M:%S")


plot(data$datetime, data$Global_active_power, xlab="",ylab="Global Active Power (kilowatts)",cex=0)

lines(data$datetime, data$Global_active_power, xlab="",ylab="Global Active Power (kilowatts)")

dev.copy(png,file="plot2.png")

dev.off()

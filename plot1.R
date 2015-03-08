# I modified the file "household_power_consumption.txt" so that it only
# contains the data on 1/2/2007 and 2/2/2007

data<- read.table("household_power_consumption.txt",sep=";",header=TRUE)

hist(data$Global_active_power,xlab = "Global_active_power (kilowatts)",col="red",main = "Global Active Power")

dev.copy(png,file="plot1.png")

dev.off()

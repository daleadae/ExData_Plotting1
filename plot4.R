hpc <- read.table("Data/household_power_consumption.txt",header=T,sep=";",colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")
hpc$DateTime = paste(hpc$Date, hpc$Time)
hpc$DateTime = as.POSIXlt(hpc$DateTime,format="%d/%m/%Y %H:%M:%S")
hpc$Date = NULL
hpc$Time = NULL

subhpc <- subset(hpc,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))

png("plot4.png")
env <- par()
par(mfrow=c(2,2))
plot(x=(subhpc$DateTime),y=subhpc$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
plot(x=(subhpc$DateTime),y=subhpc$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(x=(subhpc$DateTime),y=subhpc$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=(subhpc$DateTime),y=subhpc$Sub_metering_2,col="red")
lines(x=(subhpc$DateTime),y=subhpc$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2,cex=0.4)
plot(subhpc$DateTime, subhpc$Global_reactive_power, type = "l", main = "", xlab = "datetime")
par(env)
dev.off()
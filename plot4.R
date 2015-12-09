df.power = read.csv('data/household_power_consumption.txt', header=T,
                    sep=";", stringsAsFactors=F, na.strings="?",
                    colClasses=c("character", "character", "numeric",
                                 "numeric", "numeric", "numeric",
                                 "numeric", "numeric", "numeric"))

df.power$timestamp = strptime(paste(df.power$Date, df.power$Time),
                              format="%d/%m/%Y %H:%M:%S", tz="UTC")
startDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
endDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC")
df.power = df.power[df.power$timestamp >= startDate & df.power$timestamp <= endDate, ]

png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(df.power$timestamp, df.power$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
plot(df.power$timestamp, df.power$Voltage, type="l", xlab="datetime",
     ylab="Voltage")

plot(df.power$timestamp, df.power$Sub_metering_1, type="l", xlab="",
     ylab="Global Active Power (kilowatts)",col="black")
lines(df.power$timestamp, df.power$Sub_metering_2,col="red")
lines(df.power$timestamp, df.power$Sub_metering_3,col="blue")

legend("topright",legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(1.5,1.5,1.5),col=c("black","red","blue")) # gives the legend lines the correct color and width

plot(df.power$timestamp, df.power$Global_reactive_power, type="l", xlab="datetime",
     ylab="Global_reactive_power")

dev.off()
data <- read.csv('data/household_power_consumption.txt',header=TRUE,sep=";")

print('data Read')

startDate = as.Date("2007-02-01",format="%Y-%m-%d")
endDate = as.Date("2007-02-02",format="%Y-%m-%d")

data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data$Time <- strptime(data$Time,format = "%H:%M:%S")
data$Time <- strftime(data$Time,format = "%H:%M:%S")
print('converted classes')

classData <- data
classData.filtered <- subset(classData,Date>=startDate & Date<=endDate)
print('filtered on date range')

global = as.numeric(as.character(classData.filtered$Global_active_power))
png(file="plot1.png",width=480,height=480)
hist(global,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()
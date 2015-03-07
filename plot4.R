library(data.table)

# read the data - assumed your working directory is where the file
# household_power_consumption.txt is located

power_consump <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")

# Subset the data to the two days of interest - 1st and 2nd February 2007

pc_sub <- subset(power_consump,Date=="1/2/2007"|Date=="2/2/2007")

## Plot 4
png ("plot4.png",width=480,height=480)

# indicate that you want multiple plots side-by-side
par(mfrow=c(2,2))

plot(strptime(paste(pc_sub$Date,pc_sub$Time), "%d/%m/%Y %H:%M:%S"), pc_sub$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")

plot(strptime(paste(pc_sub$Date,pc_sub$Time), "%d/%m/%Y %H:%M:%S"), pc_sub$Voltage,xlab="datetime",ylab="Voltage",type="l")

plot(strptime(paste(pc_sub$Date,pc_sub$Time), "%d/%m/%Y %H:%M:%S"), pc_sub$Sub_metering_1, ylab="Energy sub metering",xlab="",type="l",col="black")
lines(strptime(paste(pc_sub$Date,pc_sub$Time), "%d/%m/%Y %H:%M:%S"), pc_sub$Sub_metering_2,type="l",col="red")
lines(strptime(paste(pc_sub$Date,pc_sub$Time), "%d/%m/%Y %H:%M:%S"), pc_sub$Sub_metering_3,type="l",col="blue")
legend("topright",col=c("black","red","blue"),c("Sub metering 1","Sub metering 2","Sub metering 3"),lty=1,bty="n")

plot(strptime(paste(pc_sub$Date,pc_sub$Time), "%d/%m/%Y %H:%M:%S"), pc_sub$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()

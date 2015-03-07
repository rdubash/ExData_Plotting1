library(data.table)

# read the data - assumed your working directory is where the file
# household_power_consumption.txt is located

power_consump <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")

# Subset the data to the two days of interest - 1st and 2nd February 2007

pc_sub <- subset(power_consump,Date=="1/2/2007"|Date=="2/2/2007")

## Plot 2
png ("plot2.png",width=480,height=480)
plot(strptime(paste(pc_sub$Date,pc_sub$Time), "%d/%m/%Y %H:%M:%S"), pc_sub$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")
dev.off()

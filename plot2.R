#  plot for the exploratory analysis project 1

data = read.table("household_power_consumption.txt", sep=";")

#  select data 
data.new = data[which(data$V1=='1/2/2007' | data$V1=='2/2/2007'),]


data.new$date = as.Date(data.new$V1, "%d/%m/%Y")
data.new$time = strptime(paste(data.new$date, data.new$V2), format="%Y-%m-%d %H:%M:%S")

data.new$Global_active_power = as.numeric(as.character(data.new$V3))
data.new$Global_reactive_power = as.numeric(as.character(data.new$V4))
data.new$Voltage = as.numeric(as.character(data.new$V5))
data.new$Sub_metering_1 = as.numeric(as.character(data.new$V7))
data.new$Sub_metering_2 = as.numeric(as.character(data.new$V8))
data.new$Sub_metering_3 = as.numeric(as.character(data.new$V9))


png(filename = "Plot2.png", width = 480, height = 480)
plot(data.new$time, data.new$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')
dev.off()
#Read in dataset

setwd("./ExploratoryDataAnalysis")
full = read.csv("household_power_consumption.csv", header=TRUE, sep=';')
full$DateTime g= (strptime(paste(full$Date, full$Time), "%d/%m/%Y %H:%M:%OS"))
full$Date = as.Date(strptime(full$Date, "%d/%m/%Y"))
full$Time = (strptime(full$Time, "%H:%M:%OS"))
full$Global_active_power = as.numeric(as.character(full$Global_active_power))
full$Voltage = as.numeric(as.character(full$Voltage))
full$Global_reactive_power = as.numeric(as.character(full$Global_reactive_power))
full$Sub_metering_1 = as.numeric(as.character(full$Sub_metering_1))
full$Sub_metering_2 = as.numeric(as.character(full$Sub_metering_2))
full$Sub_metering_3 = as.numeric(as.character(full$Sub_metering_3))

#Create graph 1

data1 = full[as.Date(full$Date) == "2007-02-01",]
data2 = full[as.Date(full$Date) == "2007-02-02",]
power = rbind(data1, data2)

rm(data1)
rm(data2)

hist(glob, col="red",  main="Global Active Power",   xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png")
dev.off()

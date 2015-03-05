#Read the data 
source("read_data.R")
epc<-read_data()


# General sttings
Sys.setlocale("LC_TIME", "English")
par(mfrow=c(1,1))
gaplabel<-"Global Active Power (kilowatts)"

#Write to file
png(file="plot4.png")

#fourth plot
par(mfrow=c(2,2))
# Active power
with(epc, plot( datetime,Global_active_power, type="line", ylab = gaplabel))
#Voltage
with(epc, plot( datetime,Voltage, type="line"))

# Enegry submetering for each submeter by time
with(epc, plot(datetime, Sub_metering_1,   type ="n", ylab= "Energy sub metering"))
with(epc, points(datetime, Sub_metering_1, col ="black", type="line"))
with(epc, points(datetime,Sub_metering_2, col ="red", type ="line"))
with(epc, points(datetime,Sub_metering_3, col ="blue", type = "line"))
legend("topright", pch = "-", col=c("black", "red", "blue"), legend=colnames(epc)[7:9])

# Reactive power
with(epc, plot( datetime,Global_reactive_power, type="line"))

dev.off()

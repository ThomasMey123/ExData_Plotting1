#Read the data 
source("read_data.R")
epc<-read_data()

# General sttings
Sys.setlocale("LC_TIME", "English")
gaplabel<-"Global Active Power (kilowatts)"


#Write to file
png(file= "plot3.png")

#third plot Enegry submetering for each submeter by time
par(mfrow=c(1,1))
with(epc, plot(datetime, Sub_metering_1,   type ="n", ylab= "Energy sub metering"))
with(epc, points(datetime, Sub_metering_1, col ="black", type="line"))
with(epc, points(datetime,Sub_metering_2, col ="red", type ="line"))
with(epc, points(datetime,Sub_metering_3, col ="blue", type = "line"))
legend("topright", pch = "-", col=c("black", "red", "blue"), legend=colnames(epc)[7:9] )


dev.off()

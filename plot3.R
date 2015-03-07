library(dplyr)

read_data<-function(){
    
    # read the header to get the column names
    epc<-read.csv("data\\household_power_consumption.txt",  nrow=1000,sep=";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
    
    #keep the colnames in mind
    tempnames<-names(epc)
    
    # found out the approx reading range from line 60000 to 70000 by trial and error
    epc<-read.csv("data\\household_power_consumption.txt",  skip= 60000,nrow=10000,sep=";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")
    names(epc)<-tempnames
    
    # filter onthe exact range
    epc<-filter(epc, Date %in% c("1/2/2007","2/2/2007") )
    epc$datetime<-strptime(paste(epc$Date, epc$Time),"%d/%m/%Y %H:%M:%S")
    
    epc
}

epc<-read_data()

# General sttings
Sys.setlocale("LC_TIME", "English")
gaplabel<-"Global Active Power (kilowatts)"


#Write to file
png(file= "plot3.png")

#third plot Enegry submetering for each submeter by time
par(mfrow=c(1,1))
with(epc, plot(datetime, Sub_metering_1,   type ="n", ylab= "Energy sub metering",xlab=""))
with(epc, points(datetime, Sub_metering_1, col ="black", type="l"))
with(epc, points(datetime,Sub_metering_2, col ="red", type ="l"))
with(epc, points(datetime,Sub_metering_3, col ="blue", type = "l"))
legend("topright", pch = "-", col=c("black", "red", "blue"), legend=colnames(epc)[7:9] )


dev.off()

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
par(mfrow=c(1,1))
gaplabel<-"Global Active Power (kilowatts)"

# First plot: histogram of global active power
hist(epc$Global_active_power, col="red", main ="Global Active Power", xlab = gaplabel)

#Write to png
dev.copy(png, file= "plot1.png")
dev.off()


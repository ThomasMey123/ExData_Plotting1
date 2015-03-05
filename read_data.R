library(dplyr)


read_data<-function(){

# found out the approx reading range from line 60000 to 70000 by trial and error
epc<-read.csv("data\\household_power_consumption.txt",  nrow=1000,sep=";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#keep the colnames in mind
tempnames<-names(epc)


epc<-read.csv("data\\household_power_consumption.txt",  skip= 60000,nrow=10000,sep=";", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")
names(epc)<-tempnames

# filter onthe exact range
epc<-filter(epc, Date %in% c("1/2/2007","2/2/2007") )
epc$datetime<-strptime(paste(epc$Date, epc$Time),"%d/%m/%Y %H:%M:%S")

epc
}



#Read the data 
source("read_data.R")
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


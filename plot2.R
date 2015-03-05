#Read the data 
source("read_data.R")
epc<-read_data()


# General sttings
Sys.setlocale("LC_TIME", "English")
par(mfrow=c(1,1))
gaplabel<-"Global Active Power (kilowatts)"

# Second plot: global activer power by time
with(epc, plot( datetime,Global_active_power, type="line", ylab = gaplabel))

#Write to png
dev.copy(png, file= "plot2.png")
dev.off()

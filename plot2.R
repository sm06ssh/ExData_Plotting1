mydata<-read.table("./household_power_consumption.txt", header=TRUE,  sep=";") ## nrows=10 

mydata$Date<-as.Date(mydata$Date, format="%d/%m/%Y")

mydata_2<-subset( mydata, Date == "2007-02-01" | Date == "2007-02-02")
mydata_3<-mydata_2

mydata_3$Global_active_power<-as.character(mydata_3$Global_active_power)
mydata_3$Global_active_power<-as.numeric(mydata_3$Global_active_power)
mydata_3$Time<-as.character(mydata_3$Time)

mydate_time<-paste(mydata_3$Date, mydata_3$Time)
mydata_3$DateTime<-strptime(mydate_time, format="%Y-%m-%d %H:%M:%S", tz="")

par(cex.lab=0.8, cex.axis=0.8)
with(mydata_3, plot(mydata_3$DateTime, 
                    mydata_3$Global_active_power,type="l",lwd=1, 
                    xlab="", ylab="Global Active Power (kilowatts)", 
                    main=""))

dev.copy(png, file="plot2.png", width = 480, height = 480)
dev.off()
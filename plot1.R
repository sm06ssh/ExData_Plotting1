mydata<-read.table("./household_power_consumption.txt", header=TRUE,  sep=";") ## nrows=10 

mydata$Date<-as.Date(mydata$Date, format="%d/%m/%Y")

mydata_2<-subset( mydata, Date == "2007-02-01" | Date == "2007-02-02")
mydata_3<-mydata_2

mydata_3$Global_active_power<-as.character(mydata_3$Global_active_power)
mydata_3$Global_active_power<-as.numeric(mydata_3$Global_active_power)

par(cex.lab=0.8, cex.axis=0.8, cex.main=0.8)
hist(mydata_3$Global_active_power, xlab="Global Active Power (kilowatts)",
     ylab="Frequency", main="Global Active Power", col="red")

dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()
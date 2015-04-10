rm(list=ls());
file<-"household_power_consumption.txt";
data<-read.table(file, header = TRUE, sep=";");
days <- data$Date == "1/2/2007" | data$Date == "2/2/2007";
data2<- data[days,];
x<-strptime(paste(as.character(data2$Date), as.character(data2$Time)), "%d/%m/%Y %H:%M:%S")
y<-as.numeric(as.character(data2$Global_active_power));
plot(x,y,type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(x,y)
dev.copy(png, file="plot2.png");
dev.off();

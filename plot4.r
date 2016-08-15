file<-"household_power_consumption.txt"

df<-read.table(file,
               header=TRUE,
               sep=";",
               dec=".",
               na.strings="?",
               blank.lines.skip=TRUE
)

df$Time<-format(strptime(df$Time,format="%H:%M:%S"),format="%H:%M:%S")
df$Date<-as.Date(df$Date,format="%d/%m/%Y")
df<-subset(df,df$Date=="2007-02-01"|df$Date=="2007-02-02")

df$DateTime<-strptime(paste(df$Date,df$Time,sep=" "),"%Y-%m-%d %H:%M:%S")

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 
plot(df$DateTime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(df$DateTime, df$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(df$DateTime, df$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(df$DateTime, df$Sub_metering_2, type="l", col="red")
lines(df$DateTime, df$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"),bty="o")

plot(df$DateTime, df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
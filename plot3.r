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

png("plot3.png", width=480, height=480)

plot(df$DateTime, df$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(df$DateTime, df$Sub_metering_2, type="l", col="red")
lines(df$DateTime, df$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()

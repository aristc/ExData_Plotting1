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

png("plot2.png", width=480, height=480)
plot(df$DateTime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

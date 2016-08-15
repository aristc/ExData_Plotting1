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

png("plot1.png", width=480, height=480)
hist(df$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
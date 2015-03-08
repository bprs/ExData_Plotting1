dat <- read.csv('household_power_consumption.txt',sep=';',na.strings='?')
dat$Date <- as.Date(strptime(dat$Date,'%d/%m/%Y'))
dat.f <- dat[dat$Date >= as.Date(strptime('2007-02-01', '%Y-%m-%d')) &
             dat$Date <= as.Date(strptime('2007-02-02', '%Y-%m-%d')),]
dat.f$fullTime <- strptime(paste(dat.f$Date,dat.f$Time),'%Y-%m-%d %H:%M:%S')

png(file='plot4.png',width=480,height=480)
par(bg='transparent',mar=c(5.1,4.1,4.1,2.1))
par(mfrow = c(2, 2))

plot(dat.f$fullTime, dat.f$Global_active_power,col='black',ylab='Global Active Power',xlab='',main='',type='l')

plot(dat.f$fullTime, dat.f$Voltage,col='black',ylab='Voltage',xlab='datetime',main='',type='l')

plot(dat.f$fullTime, dat.f$Sub_metering_1,col='black',type='l',xlab='',main='',ylab='Energy sub metering')
lines(dat.f$fullTime, dat.f$Sub_metering_2,col='red')
lines(dat.f$fullTime, dat.f$Sub_metering_3,col='blue')
legend('topright', lwd=1, bty='n', col=c('black', 'red', 'blue'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

plot(dat.f$fullTime, dat.f$Global_reactive_power,col='black',ylab='Global_reactive_power',xlab='datetime',main='',type='l')

dev.off()


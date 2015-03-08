dat <- read.csv('household_power_consumption.txt',sep=';',na.strings='?')
dat$Date <- as.Date(strptime(dat$Date,'%d/%m/%Y'))
dat.f <- dat[dat$Date >= as.Date(strptime('2007-02-01', '%Y-%m-%d')) &
             dat$Date <= as.Date(strptime('2007-02-02', '%Y-%m-%d')),]
dat.f$fullTime <- strptime(paste(dat.f$Date,dat.f$Time),'%Y-%m-%d %H:%M:%S')

png(file='plot2.png',width=480,height=480)
par(bg='transparent',mar=c(5.1,4.1,4.1,2.1))
plot(dat.f$fullTime, dat.f$Global_active_power,col='black',ylab='Global Active Power (kilowatts)',xlab='',main='',type='l')
dev.off()


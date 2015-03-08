dat <- read.csv('household_power_consumption.txt',sep=';',na.strings='?')
dat$Date <- as.Date(strptime(dat$Date,'%d/%m/%Y'))
dat.f <- dat[dat$Date >= as.Date(strptime('2007-02-01', '%Y-%m-%d')) &
             dat$Date <= as.Date(strptime('2007-02-02', '%Y-%m-%d')),]

png(file='plot1.png',width=480,height=480)
par(bg='transparent',mar=c(5.1,4.1,4.1,2.1))
hist(dat.f$Global_active_power,col='red',xlab='Global Active Power (kilowatts)',ylab='Frequency',main='Global Active Power')
dev.off()


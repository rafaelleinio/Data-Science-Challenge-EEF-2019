library('ggplot2')

#ROWS_LIMIT <- 1000000
#tIn <- read.csv('dataset\\features-training.csv', nrows=ROWS_LIMIT)
#tOut <- read.csv('dataset\\target-training.csv', nrows=ROWS_LIMIT)

tIn <- read.csv('dataset\\features-training.csv')
#tOut <- read.csv('dataset\\target-training.csv')
#tIn <- read.csv('dataset\\features-test.csv')

tIn$floor <- factor(tIn$floor)
tIn$rooms <- factor(tIn$rooms)

tIn['price'] <- tOut$price
remove(tOut)

#str(tIn)
#summary(tIn)

# Get proportions for fome variables
table(tIn$operation)
table(tIn$property_type)
table(tIn$country_name)
table(tIn$currency)
table(tIn$state_name)
(table(tIn$state_name)/sum(table(tIn$state_name)))*100.0
table(tIn$floor)
table(tIn$rooms)

# Plot data distributions
# property type
qplot(data=tIn, x=property_type)

qplot(data=tIn, x=currency)

tIn$state_name <- substr(tIn$state_name, 0, 10)
qplot(data=tIn, x=state_name)

qplot(data=tIn, x=floor) +
  scale_x_discrete(breaks=seq(0, 50, 2)) +
  coord_cartesian(xlim=c(0, 50), ylim=c(0, 50000))

qplot(data=tIn, x=rooms) +
  scale_x_discrete(breaks=1:20) +
  coord_cartesian(xlim=c(0, 20))

# Plot price
# by property type
qplot(data=tIn,
      xlab='Tipo de propriedade',
      ylab='Preço (milhares)',
      x=tIn$property_type,
      y=price/1000,
      geom='boxplot') +
  coord_cartesian(ylim = c(0,3000)) +
  scale_y_continuous(breaks=seq(0,3000,100))

# State
tIn$state_name <- substr(tIn$state_name, 0, 10)
qplot(data=tIn,
      xlab='Estado',
      ylab='Preço (milhares)',
      x=tIn$state_name,
      y=price/1000,
      geom='boxplot') +
  coord_cartesian(ylim = c(0,3000)) +
  scale_y_continuous(breaks=seq(0,3000,100))

# Floors
qplot(data=tIn,
      xlab='Nº de comodos',
      ylab='Preço (milhares)',
      x=tIn$rooms,
      y=price/1000,
      geom='boxplot') +
  coord_cartesian(ylim = c(0,10000)) +
  scale_y_continuous(breaks=seq(0,10000,500))

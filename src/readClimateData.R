readClimateData <- function(file) {
  cat('Reading metadata for', file, '\n')
  metadata <- NULL
  md <- as.matrix(read.csv(file=file, header=FALSE, nrows=8))
  metadata$stationName <- md[1,2]
  metadata$province <- md[2,2]
  metadata$latitude <- md[3,2]
  metadata$longitude <- md[4,2]
  metadata$elevation <- md[5,2]
  metadata$climateIdentifier <- md[6,2]
  metadata$WMOIdentifier <- md[7,2]
  metadata$TCIdentifier <- md[8,2]

  cat('Reading data for', file, '\n')
  data <- NULL
  d <- read.csv(file=file, header=FALSE, skip=25)
  data$time <- c(data$time, as.POSIXct(d[,1], tz='UTC')) ## FIXME: isn't really UTC, but the data are only reported daily, so it doesn't really matter
  data$maxTemperature <- c(data$maxTemperature, d[,6])
  data$minTemperature <- c(data$minTemperature, d[,8])
  data$meanTemperature <- c(data$meanTemperature, d[,10])
  data$heatingDegDays <- c(data$heatingDegDays, d[,12])
  data$coolingDegDays <- c(data$coolingDegDays, d[,14])
  data$totalRain <- c(data$totalRain, d[,16]) ## mm
  data$totalSnow <- c(data$totalSnow, d[,18]) ## cm
  data$totalPrecip <- c(data$totalPrecip, d[,20]) ## mm
  data$snowOnGround <- c(data$snowOnGround, d[,22]) ## cm
  
  data$time <- as.POSIXct(data$time, origin='1970-1-1', tz='UTC')

  return(list(data=data, metadata=metadata))
}

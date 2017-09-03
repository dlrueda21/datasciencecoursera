rm(list = ls())
setwd("~/datascience")

# directory <- "specdata"; pollutant <- "nitrate"; id <- 23
# head(dat)

pollutantmean <- function(directory, pollutant, id = 1:332) {
  dat <- data.frame()
  for (i in id) {      
    dat <- rbind(dat, read.csv(paste0(directory, "/", sprintf("%03d", i), ".csv")))
  }
  mean(dat[ , pollutant], na.rm = TRUE)
}

# tests ====
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)
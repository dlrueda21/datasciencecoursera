rm(list = ls())
setwd("~/datascience")

corr <- function(directory, threshold = 0) {
        result <- numeric()
        for (i in 1:332) {
                dat <- read.csv(paste0(directory, "/", sprintf("%03d", i), ".csv"))
                dat <- na.omit(dat)
                if (nrow(dat) > threshold) {
                        result <- c(result, cor(dat$sulfate, dat$nitrate))
                }
        }
        result
}

# tests ====
cr <- corr("specdata", 150)
head(cr)
summary(cr)
cr <- corr("specdata", 400)
head(cr)
summary(cr)
cr <- corr("specdata", 5000)
summary(cr)
length(cr)
cr <- corr("specdata")
summary(cr)
length(cr)
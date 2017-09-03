rm(list = ls())
setwd("~/datascience")

# directory <- "specdata"; id <- 3

complete <- function(directory, id = 1:332) {
        result <- data.frame(id = integer(), nobs = integer())
        for (i in id) {
                dat <- read.csv(paste0(directory, "/", sprintf("%03d", i), ".csv"))
                dat <- na.omit(dat)
               result <- rbind(result, data.frame(id = i, nobs = nrow(dat)))
        }
        result
}

# tests ====
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)
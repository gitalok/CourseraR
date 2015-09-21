pollutantmean <- function(directory, pollutant = "sulfate", id = 1:332) {
    
    # set working directory
    if(grep("specdata", directory) == 1) {
        directory <- ("./specdata/")
    }
    # initialize a data frame
    dat <- data.frame()
  
    # find all files in the specdata folder
    files_full <- list.files(directory, full.names = TRUE) 
    
    for(i in id) {
        dat <- rbind(dat, read.csv(files_full[i]))
    }
    mean(dat[, pollutant], na.rm = TRUE) 
}

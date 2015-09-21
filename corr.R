corr <- function(directory, threshold = 0) {
    
    files_full <- list.files(directory, full.names = TRUE)

    dat <- vector(mode = "numeric", length = 0)
    
    for (i in 1:length(files_full)) {
        moni_i <- read.csv(files_full[i])
        csum = sum(complete.cases(moni_i))
        
        if (csum > threshold) {
            submoni_i = na.omit(moni_i)
            dat <- c(dat, cor(submoni_i$sulfate, submoni_i$nitrate))
        }
    }
    
    dat
}

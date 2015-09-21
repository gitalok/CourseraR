complete <- function(directory, id = 1:332) {
    
    # set working directory
    if(grep("specdata", directory) == 1) {
        directory <- ("./specdata/")
    }
    
    files_full <- list.files(directory, full.names = TRUE) 
    
    comp_data <- data.frame()
    
    for (i in id) {
        # Reading csv files
        ta = read.csv(files_full[i])
        # Adding to data frame
        tb = data.frame( i,sum(complete.cases(ta)) )
        # Adding rows to data frame
        comp_data <- rbind(comp_data, tb)
    }
    
    colnames(comp_data) <- c("id", "nobs")
    comp_data
}

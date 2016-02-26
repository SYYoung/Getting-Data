week3_1 <- function() {
    set.seed(13435)
    X <- data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
    print("before modification:")
    print(X)
    X <- X[sample(1:5),]; X$var2[c(1,3)]=NA
    print("after Modification:")
    X
    
    ##ordering with plyr
    #install.packages("plyr")
    library(plyr)
    arrange(X,var1)
    
    ##adding rows and columns
    X$var4 <- nrorm(5)
    # or use cbind
    Y <- cbind(X, nrorm(5))
}

week3_2 <- function() {
    if (!file.exists("./data")) {dir.create("./data")}
    fileUrl <-"https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
    download.file(fileUrl, destfile="./data/restaurants.csv",method="curl")
    restData <- read.csv("./data/restaurants.csv")
}
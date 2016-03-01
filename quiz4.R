quiz4_1 <- function() {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
    download.file(fileUrl, destfile="./data/idaho.csv",method="curl")
    
    data1 <- read.csv("./data/idaho.csv",stringsAsFactors=FALSE)
    splitNames <- strsplit(names(data1),"wgtp")
    splitNames
}

quiz4_2_old <- function() {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
    download.file(fileUrl, destfile="./data/gdp.csv",method="curl")
    
    data1 <- read.csv("./data/gdp.csv",stringsAsFactors=FALSE)
    
    removeComma <- function(x) {gsub(",","",x)}
    d2 <- sapply(data1[,"X.3"], removeComma)
    meanNum <- mean(as.numeric(d2),na.rm=TRUE)
    print(meanNum)
    
    d3 <- gsub(",","",data1[,"X.3"])
    d3 <- as.numeric(d3)
    print(mean(d3,na.rm=TRUE))
    print(sum(d3,na.rm=TRUE)/190)
}

quiz4_2 <- function() {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
    download.file(fileUrl, destfile="./data/gdp.csv",method="curl")
    
    data1 <- read.csv("./data/gdp.csv",stringsAsFactors=FALSE)
    
    gdp_amt <- data1[,"X.3"]
    gdp_amt <- gsub(",","",gdp_amt)
    meanNum <- mean(as.numeric(gdp_amt),na.rm=TRUE)
    meanNum
    
}

quiz4_4 <- function() {
    library(dplyr)
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
    download.file(fileUrl, destfile="./data/gdp.csv",method="curl")
    gdp <- read.csv("./data/gdp.csv",stringsAsFactors=FALSE)
    
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
    download.file(fileUrl, destfile="./data/edu.csv",method="curl")
    edu <- read.csv("./data/edu.csv",stringsAsFactors=FALSE)
    
    # answer merge list
    two_df <- merge(gdp,edu,by.x="X", by.y="CountryCode") 
    num <- length(grep("Fiscal year end: June",two_df[,"Special.Notes"]))
    num
    
}

quiz4_5 <- function() {
    #install.packages("quantmod")
    #library(quantmod)
    
    amzn = getSymbols("AMZN", auto.assign=FALSE)
    sampleTimes = index(amzn)
    
    year_2012_l <- grepl("2012",sampleTimes)
    year_2012 <- sampleTimes[year_2012_l]
    print(paste("number of 2012",length(year_2012)))
    
    # check if Mon 
    # library(lubridate)
    wk_2012 <- wday(year_2012,label=TRUE)
    mon_2012 <- wk_2012[grepl("Mon", wk_2012)]
    print(paste("number of Mon in 2012", length(mon_2012)))
}
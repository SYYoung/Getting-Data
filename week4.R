week4_1 <- function(){
    # editing text values
    # ... get the camera data after read.csv
    # this one split the string with . within
    splitNames = strsplit(names(cameraData),"\\.")
    
    # apply: sapply
    firstElement <- function(x) {x[1]}
    sapply(splitNames, firstElement)
    
    # substitute
    sub("_","",names(reviews),)
    # gsub() which substitues all
    gsub("_","",testName)
    
    # searching pattern
    grep("Alameda", cameraData$intersection)  
    table(grepl("Alameda",cameraDaa$intersection))
    cameraData2 <- cameraData[!grepl("Alameda",cameraData$intersection),]
    
    length(grep("JeffStreet",cameraData$intersection))
    
    libary(stringr)
    nchar("Jeffrey Leek")
    substr("Jeffrey Leek",1,7)
    paste("Jeffrey","Leek")
    # paste two strings without any space
    paste0("Jeffrey","Leek")
    str_trim("Jeff   ") # return "Jeff"
    
}

week4_2 <- function() {
    # regular expression I
    
}

week4_3 <- function() {
    
}

week4_4 <- function() {
    # working with dates
    d2 <- Sys.date()
    format(d2, "%a %b %d") #%a: weekday, %b: abbreviated month, %d:day as number
    # may return as: "Sun Jan 12"
    
    # creating dates
    x = c("1jan1960", "2jan1960", "31mar1960", "30jul1960"); z=as.Date(x,"%d%b%Y")
    # it will come out as: "1960-01-01""1960-01-02"...
    
    library(lubridate)
}
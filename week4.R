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
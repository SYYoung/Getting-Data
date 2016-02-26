week1 <- function(){
    if (!file.exists("data")) {
        dir.create("data")
    }
    
    ## download a file from internet
    ##fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
    fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
    download.file(fileUrl, destfile="./data/cameras.csv",method="curl")
    list.files("./data")
    
    dateDownloaded <- date()
    
    ## read data file
    cameraData <- read.table("./data/cameras.csv", sep=",", header=TRUE)
    
    ## read excel file
    fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
    download.file(fileUrl, destfile="./data/cameras.xlsx",method="curl")
    list.files("./data") 
    ## use package to read xlsx file
    ##library(xlsx)
    ##cameraData_excel <- read.xlsx("./data/cameras.xlsx",sheetIndex=1, header=TRUE)
    ##head(cameraData_excel)
    
    ## read xml file
    library(XML)
    fileUrl <- "http://www.w3schools.com/xml/simple.xml"
    doc <- xmlTreeParse(fileUrl, useInternal=TRUE)
    rootNode <- xmlRoot(doc)
    xmlName(rootNode)
    
    names(rootNode)
    rootNode[[1]][[1]]
    xmlSApply(rootNode, xmlValue)
    xpathSApply(rootNode, "//name", xmlValue)
    
    fileUrl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
    doc <- htmlTreeParse(fileUrl, useInternal=TRUE)
    scores <- xpathSApply(doc,"//li[@class='score']",xmlValue)
    teams <- xpathSApply(doc,"//li[@class='team-name']",xmlValue)
    scores
    
    ##read JSON 
    library(jsonlite)
    jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
    names(jsonData)
    
    ## data table
    library(data.table)
    DF = data.table(x=rnorm(9),y=rep("a","b","c"),each=3),z=rnorm(9))
    head(DF,3)
    tables()

}
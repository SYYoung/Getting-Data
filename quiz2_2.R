quiz2_2 <- function() {
    
	##download.file(fileUrl, destfile="./data/quiz2_2.csv",method="curl")
	##acs <- read.csv("./data/quiz2_2.csv")
    
	con = url("http://biostat.jhsph.edu/~jleek/contact.html")
	htmlCode = readLines(con)
    ten_ch <- nchar(htmlCode[10])
    twenty_ch <- nchar(htmlCode[20])
    thirth_ch <- nchar(htmlCode[30])
    hundred_ch <- nchar(htmlCode[100])
	close(con)
	
    print(paste("ten_ch: ",ten_ch,"twenty_ch: ",twenty_ch,"thirth_ch :",thirth_ch,
                "hundred_ch: ",hundred_ch))
    
    ### question #5
    
    ##fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
    fileUrl <- "http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for"
    download.file(fileUrl, destfile="./data/quiz2_5.csv",method="curl")
    d1 <- read.csv("./data/quiz2_5.csv")
    col4 <- d1[,4]
    print(paste("sum is", sum(col4)))
}
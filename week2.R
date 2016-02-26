week2 <- function() {
    ## install.packages("RMySQL")
    ucscDb <- dbConnect(MySQL(), user="genome",
        host="genome-mysql.cse.ucsc.edu")
    result <- dbGetQuery(ucscDb,"show databases;"); dbDisconnect(ucscDb);

    result
    
    hg19 <- dbConnect(MySQL(), user="genome",db="hg19",
                      host="genome-mysql.cse.ucsc.edu")
    allTables <- dbListTables(hg19)
    length(allTables)
    
    dbListFields(hg19,"affyU133Plus2")
    
    dbGetQuery(hg19,"select count(*) from affyU133Plus2")
    
    affyData <- dbReadTable(hg19, "affyU133Plus2")
    
    ## HDF5
    source("http://bioconductor.org/biocLite.R")
    biocLite("rhdf5")
    
    library(rhdf5)
    created = h5createFile("example.h5")
    created
    created = h5creaetGroup("example.h5","foo")
    created = h5createGroup("example.h5","baa")
    created = h5createGroup("example.h5","foo/foobaa")
    h5ls("example.h5")
    
    readA = h5read("example.h5","foo/A")
    readB = h5read("example.h5","foo/foobaa/B")
    readdf = h5read("example.h5","df")
    readA
    
    h5Write(c(12,13,14),"example.h5","foo/A",index=list(1:3,1))
    h5read("example.h5","foo/A")
    
    ## getting data off webpages - readLines
    con = url("http://scholar.google.com/citations?user=HK-I6C0AAAAJ&hl=en")
    htmlCode = readLines(con)
    close(con)
    htmlCode
    
}
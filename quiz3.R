quiz3_1 <- function() {
    library(dplyr)
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
    download.file(fileUrl, destfile="./data/idaho.csv",method="curl")
    
    idaho_df <- read.csv("./data/idaho.csv")
    idaho_tbl <- tbl_df(idaho_df)
    
    agricultureLogical <- (idaho_df$ACR==3 & idaho_df$AGS==6)
    which(agricultureLogical)
}

quiz3_2 <- function() {
    library(jpeg)
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
    download.file(fileUrl, destfile="./data/quiz3.jpg",method="curl")
    data_arry <- readJPEG("./data/quiz3.jpg",native=TRUE)
    quantile(data_arry, probs=c(0.3,0.8))
}

quiz3_3 <- function() {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
    download.file(fileUrl, destfile="./data/gdp.csv",method="curl")
    gdp <- read.csv("./data/gdp.csv",stringsAsFactors=FALSE)
    
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
    download.file(fileUrl, destfile="./data/edu.csv",method="curl")
    edu <- read.csv("./data/edu.csv",stringsAsFactors=FALSE)
    
    # answer merge list
    two_df <- merge(gdp,edu,by.x="X", by.y="CountryCode")
    
    # answer the 13th country
    two_df[,"Gross.domestic.product.2012"] <- as.numeric(two_df[,"Gross.domestic.product.2012"])
    
    gdb_edu_tbl <- tbl_df(two_df)
    g2 <- arrange(gdb_edu_tbl, desc(Gross.domestic.product.2012))
    target <- filter(g2, Gross.domestic.product.2012==max(Gross.domestic.product.2012,
                                              na.rm=TRUE)-12)
    target
    
    # answer question 4
    # convert Income.Group as factor
    two_df[,"Income.Group"] <- as.factor(two_df[,"Income.Group"])
    gdb_edu_tbl <- tbl_df(two_df)
    income_grp <- group_by(gdb_edu_tbl,Income.Group)
    summarize(income_grp,n(),mean(Gross.domestic.product.2012,na.rm=TRUE))
    
    # answer question 5: cut GDP ranking 5 quantile groups
    d2 <- filter(gdb_edu_tbl, Gross.domestic.product.2012<=38)
    income_d2 <- group_by(d2,Income.Group)
    #summarize(income_d2,n())
    # break into different GDP ranking groups. each has 38
    income_rank <- summarize(income_grp, top_38=get_grp(income_grp,38,1),
                             second_38=get_grp(income_grp,76,38))
    
    income_rank
    
}

get_grp <- function(data,upper_bound=190,lower_bound=1) {
    vec <- ((data$Gross.domestic.product.2012 > lower_bound) &
            (data$Gross.domestic.product.2012 <= upper_bound))
    res <- sum(vec, na.rm=TRUE)
    res
}
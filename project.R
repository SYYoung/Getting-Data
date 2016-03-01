merge_data <- function() {
    # read the attribute list. it will be used as the column names
    fileName <- "./UCI HAR Dataset/features.txt"
    d1 <- read.table(fileName, colClasses=c("numeric","character"))
    feature_name <- d1[,2]
    
    # read training set data
    testFileName <- "./UCI HAR Dataset/test/X_test.txt"
    data1 <- read.table(testFileName, colClasses=c("numeric"), col.names=feature_name)
    print(str(data1))
    
    # read training set data: subject
    testFileName <- "./UCI HAR Dataset/test/subject_test.txt"
    d1 <- read.table(testFileName, colClasses=c("numeric"), col.names="volunteer")
    subject <- as.numeric(d1[,1])
    print(str(subject))
    
    
}

project <- function() {
    merge_data()
}
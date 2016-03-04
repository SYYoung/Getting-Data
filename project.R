get_data <- function(filepath) {
    print(filepath)
    # read the attribute list. it will be used as the column names
    fileName <- "./UCI HAR Dataset/features.txt"
    d1 <- read.table(fileName, colClasses=c("numeric","character"))
    feature_name <- d1[,2]
    
    # read set data
    testFileName <- filepath["data"]
    data1 <- read.table(testFileName, colClasses=c("numeric"), col.names=feature_name)
    
    # read set data: subject
    testFileName <- filepath["name"]
    d1 <- read.table(testFileName, colClasses=c("numeric"), col.names="volunteer")
    subject <- as.numeric(d1[,1])
    
    testFileName <- filepath["act"]
    d1 <- read.table(testFileName, colClasses=c("numeric"), col.names="activity")
    activity <- as.numeric(d1[,1])
    
    # integrate all three sets of data
    allData <- cbind(subject,activity,data1)
    
    allData
}

project <- function() {
    # 1. step 0: read both test data set and training data set
    # get the training data set
    filepath <- c(name="./UCI HAR Dataset/train/subject_train.txt",
                  data="./UCI HAR Dataset/train/X_train.txt",
                  act="./UCI HAR Dataset/train/y_train.txt")
    trainData <- get_data(filepath)
    
    # get the test data set
    filepath <- c(name="./UCI HAR Dataset/test/subject_test.txt",
                  data="./UCI HAR Dataset/test/X_test.txt",
                  act="./UCI HAR Dataset/test/y_test.txt")
    testData <- get_data(filepath)
    
    # 2. step 1: merges the training and test sets to creat one data set
    wholeData <- rbind(trainData, testData)
    
    # 3. step 2: extracts only the measurements on mean/std for each measurement
    library(dplyr)
    wholeDatatf <- tbl_df(wholeData)
    coredata <- select(wholeDatatf, subject, activity, contains("mean"))
    coredata <- select(coredata, subject, activity, contains("Mag"))
    cored2 <- select(wholeDatatf, contains("std"))
    cored2 <- select(cored2, contains("Mag"))
    coredata <- cbind(coredata, cored2)
    print(str(coredata))
    
    # 4. step 3: uses descriptive activity names to name the activities
    actList = c("walking","walking up", "walking down", "sitting",
                "standing", "laying")
    coredata <- mutate(coredata,activityname=actList[activity])
    coredata <- select(coredata, -activity)
    
    # 5. step 5: create a 2nd independent tidy data set with the average of each
    #   variable for each activity and each subject
    indiv_data <- group_by(coredata,subject,activityname)
    print(str(indiv_data))
 
    summarise_each(indiv_data, funs(mean))
    
    indiv_data

}
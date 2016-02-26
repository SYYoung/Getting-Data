mani_data <- function() {
    ## use tbl from package dplyr. 
    library(dplyr)
    # in order to use the functions inside dplyr, we must convert db to tbl
    cran <- tbl_df(mydf)
    
    ## dplyr provides 5 functions: select, filter, arrange, mutate and
    ## summarize
    
    ## select: keeps only the variables you mention
    # cran has following fields: X, date, time,size, r_version,r_arch,r_os,
    # package, version, country, ip_id
    # select only a few columns:
    # select(cran, ip_id, package, country)
    # select(cran, rarch:country)
    # select(cran, -time): to omit the column time
    
    ## filter: select a subset of rows which select gets a subset of columns
    # filter(cran, "package=="swirl")
    # filter(cran, r_version=="3.1.1",country=="US")
    # filter(cran, country=="US" | country=="IN")
    # filter(cran, !is.na(r_version))
    
    # arrange: order the rows of a dataset according to the values of a 
    # particular variable
    # arrange the rows in which the ip_id in ascending order:
    # arrange(cran, ip_id)
    # arrange(cran, package, ip_id)
    
    # mutate: create new variable based on the value of one/more variables 
    # already in a dataset
    # mutate(cran, size_mb=size/2^20)
    
    # summarize: collapses the dataset to a single row.
    # summarize(cran, avg_bytes=mean(size))
    
    ## lesson: grouping and chaining with dplyr
    # group by the package
    # by_package <- group_by(cran, package)
    # get the mean of size for each group of package:
    # summarize(by_package, mean(size))
    # pack_sum <- summarize(by_package,
    #                      count = n(),
    #                      unique = n_distinct(ip_id),
    #                      countries = n_distinct(country),
    #                      avg_bytes = mean(size))
    
    # to get the top 1%
    # quantile(pack_sum$count, probs=0.99)
    # filter the top 1%
    # top_counts <- filter(pack_sum, count>679)
    # top_counts_sorted <- arrange(top_counts, desc(count))\
    
    # chain
    # cran %>%
    #   select() %>%
    #       print
    
}

tidy_exercise <- function() {
    # tidy data which does not satisfy the conditions of "tidy data"
    # 1. column headrs are values, not variable names
    # 2. Variables are stored in both rows and columns
    # 3. A single observational unit is stored in multiple tables
    # 4. Multiple types of observational units are stored in the same table
    # 5. Multiple variables are stored in one column
    
    library(tidyr)
    # case 1: students look like this: grade, male, female: 1. A, 1, 5, 2. B, 5, 0
    # gather(students, sex, count, -grade)
    # now new data look like: grade, sex, count: 1. A/male/1 2. B/male/5..
    
    # case 2: #5
    # students2 look like: grade/male_1/female_1/male_2/female_2: A/3/4/3/4..
    # res <- gather(students2, sex_class, count, -grade)
    # res look like: grade/sex_class/count: A/male_1/3; B/male_1/6...
    # now need to split male_1 to male and class_1, use separate()
    # separate(res, sex_class, into=c("sex","class"))
    # now it look like: grade/sex/class/count: A/male/1/3; B/male/1/6...
    
    # case3: #2
    # students3 look like: name/test/class1/class2/class3/class4/class5:
    # Sally/midterm/A/NA/B/NA/NA; Sally/final/C/NA/C/NA/NA...
    # problems: class1..class5 should be values instead of variables
    # midterm and final should be variables
    # res <- gather(students3,class,count,-(name:test),na.rm=TRUE)
    # res look like: name/test/class/grade: Sally/midterm/class1/A...
    # midterm/final should be variables.
    # separate(res, test,grade). now look like: name/class/final/midterm:
    # Brian/class1/B/B, Brian/class5/C/A...
    # next break class1...class5 to 1..5
    # mutate(class=extract_numeric("class"))
    # now data look like: name/class/final/midterm: Brian/1/B/B, Jeff/2/E/D...
    
    # case 4: #4
    # students4: id/name/sex/class/midterm/final:168/Brian/F/1/B/B; 
    # 168/Brian/F/5/A/C...
    # therefore, the table should be split into 2 tables
    # table 1: id/name/sex, table 2: id/class/midterm/final
    # table1 <- select(students4, id,name,sex)
    # remove duplicate rows:
    # unique(table1)
    
    # case 5: #5: a single observational table is in multiple tables
    # 
    
   
}
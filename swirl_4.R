swirl_4 <- function() {
    library(lubridate)
    
    this_day <- today()
    year(this_day)
    wkday(this_day,label=TRUE)
}
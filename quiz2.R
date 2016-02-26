quiz2_1 <- function() {
library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at at
#    https://github.com/settings/applications. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "8aac5181f4651b4dccca",
                   secret = "c5f1c0351b8dd203903353c62080bd9bb6623a15")
##                   key = "56b637a5baffac62cad9",
##                 secret = "8e107541ae1791259e9987d544ca568633da2ebf")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
# my token is: 7b643dc1c49095021c2d3324c5613d7003c3cff2

# 4. Use API
gtoken <- config(token = github_token)
#req <- GET("https://api.github.com/rate_limit", gtoken)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
con = content(req)
con

# OR:
#req <- with_config(gtoken, GET("https://api.github.com/rate_limit"))
#stop_for_status(req)
#content(req)

}
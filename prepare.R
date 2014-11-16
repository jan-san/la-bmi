require(devtools)
install_github("slidify", "ramnathv")
install_github("slidifyLibraries", "ramnathv")

library(slidify)

author("la-bmi")
slidify('index.Rmd')
browseURL('index.html')

publish(user = "jan-san", repo = "REPO")
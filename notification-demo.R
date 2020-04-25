
# take the package from cran directly
url <- "https://cran.rstudio.com/src/contrib/Archive/notifier/notifier_1.0.0.tar.gz"
install.packages(url, type = "source", repos = NULL)

library(notifier)
#install.packages("randquotes")
#devtools::install_github("amrrs/randquotes")
#library(randquotes)
#simple notification
notify(title="my hero", msg=c("great work!"))

#composing a slightly complex and also useful notification
notify(title = "World Clock",
  msg = c(paste0("Afghanistan:", format(Sys.time(), format = "%a %b %d %X" ,tz = "Asia/Kabul"),"\n",
  paste0("Singapore:", format(Sys.time(), format = "%a %b %d %X" ,tz = "Asia/Singapore"),"\n",
  paste0("India:", format(Sys.time(),format = "%a %b %d %X", tz = "Asia/Calcutta"),"\n"
  )))))

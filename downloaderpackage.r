
library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
filename <- "msleep_ggplot2.csv"
#----------
if (!file.exists(filename)) download(url,filename)
msleep <- read.csv("msleep_ggplot2.csv")
#---------
View(head(msleep))

#--------
library(dplyr)
#--------
sleepdata <- select(msleep, name, vore, sleep_total) %>% group_by(Sum = sum(sleep_total))
View(sleepdata)

#--------
sleepdata <- select(msleep, -name, -order, -awake)

sleepdata
#----------
View(head(select(msleep, -name)))

#----------
View(head(select(msleep, name:order)))

#----------
View(head(select(msleep, starts_with("sl"))))

#----------
View(filter(msleep, sleep_total >= 16))

#-----------
View(filter(msleep, sleep_total >= 16, bodywt >= 1))

#-----------
View(filter(msleep, order %in% c("Perissodactyla", "Primates")))

#-----------
View(msleep %>%
  select(name, order, sleep_total) %>%
  arrange(order, sleep_total) %>%
  head)

#-----------
View(msleep %>%
  select(name, order, sleep_total) %>%
  arrange(order, sleep_total) %>%
  filter(sleep_total >= 16))

#-----------
msleep %>%
  select(name, order, sleep_total) %>%
  arrange(order, desc(sleep_total)) %>%
  filter(sleep_total >= 16)

#----------
View (msleep %>%
  mutate(rem_proportion = sleep_rem / sleep_total) %>%
  head)

#---------
msleep %>%
  mutate(rem_proportion = sleep_rem / sleep_total,
         bodywt_grams = bodywt * 1000) %>%
  head

#--------Summarise dataset
msleep %>%
summarise(avg_sleep = mean(sleep_total))

#-------
msleep %>%
  summarise(avg_sleep = mean(sleep_total),
            min_sleep = min(sleep_total),
            max_sleep = max(sleep_total),
            total = n())

#------group by with summarise
msleep %>%
  group_by(order) %>%
  summarise(avg_sleep = mean(sleep_total),
            min_sleep = min(sleep_total),
            max_sleep = max(sleep_total),
            total = n())


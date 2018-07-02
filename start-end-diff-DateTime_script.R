library(tidyverse)
library(lubridate)


#create a combined field for start date and start time, start_dt

ff_steam_work <- ff_steam_work %>%
  mutate(start_dt = paste(StartDate, StartTime, sep = " ", collapse = NULL)) %>%
  mutate(start_dt = mdy_hms(start_dt))

#create a combined field for end date and end time, end_dt

ff_steam_work <- ff_steam_work %>%
  mutate(end_dt = paste(End_Date, End_Time, sep = " ", collapse = NULL)) %>%
  mutate(end_dt = mdy_hms(end_dt))

#create a field for outage duration, out_duration, measured in hours

ff_steam_work <- ff_steam_work %>%
  mutate(out_duration = ((end_dt - start_dt) / 60))


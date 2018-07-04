library(tidyverse)
library(lubridate)
library(openxlsx)

#create a combined field for start date and start time, start_dt

ff_steam_work <- ff_steam_work %>%
  mutate(start_dt = paste(StartDate, StartTime, sep = " ", collapse = NULL)) %>%
  mutate(start_dt = mdy_hms(start_dt))

c_cycle_work <- c_cycle_work %>%
  mutate(start_dt = paste(StartDate, StartTime, sep = " ", collapse = NULL)) %>%
  mutate(start_dt = mdy_hms(start_dt))

s_cycle_work <- s_cycle_work %>%
  mutate(start_dt = paste(StartDate, StartTime, sep = " ", collapse = NULL)) %>%
  mutate(start_dt = mdy_hms(start_dt))

#create a combined field for end date and end time, end_dt

ff_steam_work <- ff_steam_work %>%
  mutate(end_dt = paste(End_Date, End_Time, sep = " ", collapse = NULL)) %>%
  mutate(end_dt = mdy_hms(end_dt))

c_cycle_work <- c_cycle_work %>%
  mutate(end_dt = paste(End_Date, End_Time, sep = " ", collapse = NULL)) %>%
  mutate(end_dt = mdy_hms(end_dt))

s_cycle_work <- s_cycle_work %>%
  mutate(end_dt = paste(End_Date, End_Time, sep = " ", collapse = NULL)) %>%
  mutate(end_dt = mdy_hms(end_dt))

#create a field for outage duration, out_duration, measured in hours

ff_steam_work <- ff_steam_work %>%
  mutate(out_duration = ((end_dt - start_dt) / 60))

c_cycle_work <- c_cycle_work %>%
  mutate(out_duration = ((end_dt - start_dt) / 60))

s_cycle_work <- s_cycle_work %>%
  mutate(out_duration = ((end_dt - start_dt) / 60))

#create a new data frame with specific fields in new order

ff_steam_new <- ff_steam_work %>%
  select(Util_Unit, start_dt, Type, Cause_Code, end_dt,
         Time_To_Repair, TBF_Period_Hrs, IA_PH, 
         TBF_Service_Hrs, IA_SH, X_Derate)

c_cycle_work <- c_cycle_work %>%
  select(Util_Unit, start_dt, Type, Cause_Code, end_dt,
         Time_To_Repair, TBF_Period_Hrs, IA_PH, 
         TBF_Service_Hrs, IA_SH, X_Derate)

s_cycle_work <- s_cycle_work %>%
  select(Util_Unit, start_dt, Type, Cause_Code, end_dt,
         Time_To_Repair, TBF_Period_Hrs, IA_PH, 
         TBF_Service_Hrs, IA_SH, X_Derate)


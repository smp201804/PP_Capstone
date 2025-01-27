library(tidyverse)
library(lubridate)
library(openxlsx)

#convert Cause_Code iteger field to 4 character string/character field
ff_steam_exp <- ff_steam_worka

ff_steam_exp <- ff_steam_exp %>%
  mutate(Cause_Code = as.character(Cause_Code)) %>%
  mutate(Cause_Code = if_else(nchar(Cause_Code) == 2, paste0("00", Cause_Code),
                              if_else(nchar(Cause_Code) == 3, paste0("0", Cause_Code),
                                      if_else(nchar(Cause_Code) == 1, paste0("000", Cause_Code), Cause_Code))))

write.csv(ff_steam_exp, file = "ff_steam_expt.csv")


c_cycle_exp <- c_cycle_worka

c_cycle_exp <- c_cycle_exp %>%
  mutate(Cause_Code = as.character(Cause_Code)) %>%
  mutate(Cause_Code = if_else(nchar(Cause_Code) == 2, paste0("00", Cause_Code),
                              if_else(nchar(Cause_Code) == 3, paste0("0", Cause_Code),
                                      if_else(nchar(Cause_Code) == 1, paste0("000", Cause_Code), Cause_Code))))

write.csv(c_cycle_exp, file = "c_cycle_expt.csv")


s_cycle_expx <- s_cycle_worka

s_cycle_exp <- s_cycle_expx %>%
  mutate(Cause_Code = as.character(Cause_Code)) %>%
  mutate(Cause_Code = if_else(nchar(Cause_Code) == 2, paste0("00", Cause_Code),
                              if_else(nchar(Cause_Code) == 3, paste0("0", Cause_Code),
                                      if_else(nchar(Cause_Code) == 1, paste0("000", Cause_Code), Cause_Code))))

write.csv(s_cycle_exp, file = "s_cycle_expt.csv")


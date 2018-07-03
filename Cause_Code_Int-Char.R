library(tidyverse)
library(lubridate)
library(openxlsx)

#convert Cause_Code iteger field to 4 character string/character field
ff_steam_exp <- ff_steam_new

ff_steam_exp <- ff_steam_exp %>%
  mutate(Cause_Code = as.character(Cause_Code)) %>%
  mutate(Cause_Code = if_else(nchar(Cause_Code) == 2, paste0("00", Cause_Code),
                              if_else(nchar(Cause_Code) == 3, paste0("0", Cause_Code),
                                      if_else(nchar(Cause_Code) == 1, paste0("000", Cause_Code), Cause_Code))))
         

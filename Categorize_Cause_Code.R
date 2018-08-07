library(tidyverse)
library(lubridate)

ff_steam_dfb <- ff_steam_df

#Convert Cause_Code to numeric
#Create a new variable, System, that categorizes Cause_Code according to NERC GADS Appendix
ff_steam_dfb <- ff_steam_dfb %>%
  mutate(Cause_Code = as.numeric(Cause_Code)) %>%
  mutate(System = 
            if_else(Cause_Code>=10 & Cause_Code<=1999, "Boiler",
            if_else((Cause_Code>=3110 & Cause_Code<=3549 | Cause_Code>=3800 & Cause_Code<=3999), "Balance_of_Plant",
            if_else(Cause_Code>=3600 & Cause_Code<=3730, "Electrical",
            if_else(Cause_Code>=4000 & Cause_Code<=4499, "Steam_Turbine",
            if_else(Cause_Code>=4500 & Cause_Code<=5298, "Generator",
            if_else(Cause_Code>=8000 & Cause_Code<=8845, "PCR",
            if_else((Cause_Code>=9000 & Cause_Code<=9340 | Cause_Code==0), "External",
            if_else(Cause_Code>=9504 & Cause_Code<=9720, "Regulatory",
            if_else(Cause_Code>=9900 & Cause_Code<=9960, "Personnel",
            if_else((Cause_Code==2 | Cause_Code>=9990 & Cause_Code<=9991), "Inactive", "Performance")))))))))))



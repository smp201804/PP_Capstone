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
            if_else(Cause_Code>=8000 & Cause_Code<=8845, "PCE",
            if_else((Cause_Code>=9000 & Cause_Code<=9340 | Cause_Code==0), "External",
            if_else(Cause_Code>=9504 & Cause_Code<=9720, "Regulatory",
            if_else(Cause_Code>=9900 & Cause_Code<=9960, "Personnel",
            if_else((Cause_Code==2 | Cause_Code>=9990 & Cause_Code<=9991), "Inactive", "Performance")))))))))))

cc_dfb <- cc_df
cc_dfb <- cc_dfb %>% 
  mutate(Cause_Code = as.numeric(Cause_Code)) %>% 
  mutate(System = 
           if_else((Cause_Code>=111 & Cause_Code<=1999 | Cause_Code>=6000 & Cause_Code<=6183), "HRSG",
           if_else((Cause_Code>=3110 & Cause_Code<=3549 | Cause_Code>=3800 & Cause_Code<=3899 | Cause_Code>=3950 & Cause_Code<=3999 | Cause_Code==6299 | Cause_Code==6399), "Balance_of_Plant",
           if_else(Cause_Code>=3600 & Cause_Code<=3730, "Electrical",
           if_else(Cause_Code>=4000 & Cause_Code<=4499, "Steam_Turbine",
           if_else(Cause_Code>=4500 & Cause_Code<=4750, "Generator",
           if_else(Cause_Code>=5000 & Cause_Code<=5299, "Gas_Turbine",
           if_else(Cause_Code>=5400 & Cause_Code<=5699, "Jet_Engine",
           if_else(Cause_Code==6200, "Miscellaneous",
           if_else(Cause_Code>=7800 & Cause_Code<=7960, "Expander_Turbine",
           if_else(Cause_Code>=8700 & Cause_Code<=8845, "PCE",
           if_else((Cause_Code>=9000 & Cause_Code<=9340 | Cause_Code==0), "External",
           if_else(Cause_Code>=9504 & Cause_Code<=9720, "Regulatory",
           if_else(Cause_Code>=9900 & Cause_Code<=9960, "Personnel",
           if_else((Cause_Code>=9990 & Cause_Code<=9991 | Cause_Code==2), "Inactive", "Performance")))))))))))))))

ss_dfb <- ss_df
ss_dfb <- ss_dfb %>% 
  mutate(Cause_Code = as.numeric(Cause_Code)) %>% 
  mutate(System =
           if_else(Cause_Code>=3600 & Cause_Code<=3730, "Electrical",
           if_else(Cause_Code>=3810 & Cause_Code<=3999, "Balance_of_Plant",
           if_else(Cause_Code>=4500 & Cause_Code<=4899, "Generator",
           if_else(Cause_Code>=5000 & Cause_Code<=5299, "Gas_Turbine",
           if_else(Cause_Code>=7800 & Cause_Code<=7960, "Expander_Turbine",
           if_else(Cause_Code>=8656 & Cause_Code<=8845, "PCE",
           if_else((Cause_Code>=9000 & Cause_Code<=9340 | Cause_Code==0), "External",
           if_else(Cause_Code>=9504 & Cause_Code<=9720, "Regulatory",
           if_else(Cause_Code>=9900 & Cause_Code<=9960, "Personnel",
           if_else((Cause_Code>=9990 & Cause_Code<=9991 | Cause_Code==2), "Inactive",
           if_else(Cause_Code>=9997 & Cause_Code<=9999, "Performance", "Unknown"))))))))))))



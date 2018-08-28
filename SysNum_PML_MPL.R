library(tidyverse)
library(lubridate)

# Create binary numeric variables for cause code categories

ff_steam_dfb <- ff_steam_dfb %>% 
  mutate(BlrNum = as.numeric((System == "Boiler")),
         BoPNum = as.numeric((System == "Balance_of_Plant")),
         ElecNum = as.numeric((System == "Electrical")),
         STNum = as.numeric((System == "Steam_Turbine")),
         GenNum = as.numeric((System == "Generator")),
         PCENum = as.numeric((System == "PCE")),
         RegNum = as.numeric((System == "Regulatory")),
         PersNum = as.numeric((System == "Personnel")),
         InactNum = as.numeric((System == "Inactive")),
         PerfNum = as.numeric((System == "Performance")))

cc_dfb <- cc_dfb %>% 
  mutate(HRSGNum = as.numeric((System == "HRSG")),
         BoPNum = as.numeric((System == "Balance_of_Plant")),
         ElecNum = as.numeric((System == "Electrical")),
         STNum = as.numeric((System == "Steam_Turbine")),
         GenNum = as.numeric((System == "Generator")),
         GTNum = as.numeric((System == "Gas_Turbine")),
         JENum = as.numeric((System == "Jet_Engine")),
         MiscNum = as.numeric((System == "Miscellaneous")),
         ETNum = as.numeric((System == "Expander_Turbine")),
         PCENum = as.numeric((System == "PCE")),
         RegNum = as.numeric((System == "Regulatory")),
         PersNum = as.numeric((System == "Personnel")),
         InactNum = as.numeric((System == "Inactive")),
         PerfNum = as.numeric((System == "Performance")))

# Create probable maximal loss (PML): 30 days < Time_To_Repair <= 90 days
# Create maximum forseeable loss (MFL): Time_To_Repair > 90 days

ff_steam_dfb <- ff_steam_dfb %>% 
  mutate(PML = 
           if_else(Time_To_Repair > 720 & Time_To_Repair <= 2160, "1", "0")) %>% 
  mutate(MFL = 
           if_else(Time_To_Repair > 2160, "1", "0"))

cc_dfb <- cc_dfb %>% 
  mutate(PML = 
           if_else(Time_To_Repair > 720 & Time_To_Repair <= 2160, "1", "0")) %>% 
  mutate(MFL = 
           if_else(Time_To_Repair > 2160, "1", "0"))



library(tidyverse)
# clean column names for combined and simple cycle power plant data sets
# fossil fuel steam already cleaned

#   create data frame for combined cycle
c_cycle_edit <- read.csv("CC_GT_2011_2017.csv")

#   replace . or series of . with _
names(c_cycle_edit) <- gsub(x = names(c_cycle_edit),
                            pattern = "(\\.)+",
                            replacement = "_")

#   replace trailing _ with ""
names(c_cycle_edit) <- gsub(x = names(c_cycle_edit),
                            pattern = "(_)+$",
                            replacement = "")

#   create working combined cycle file
write.csv(c_cycle_edit, file = "c_cycle_work.csv")

#   create data frame for simple cycle
s_cycle_edit <- read.csv("GT_Jet_Engine_2013_2016.csv")

#   replace . or series of . with _
names(s_cycle_edit) <- gsub(x = names(s_cycle_edit),
                            pattern = "(\\.)+",
                            replacement = "_")

#   replace trailing _ with ""
names(s_cycle_edit) <- gsub(x = names(s_cycle_edit),
                            pattern = "(_)+$",
                            replacement = "")

#   create working combined cycle file
write.csv(s_cycle_edit, file = "s_cycle_work.csv")


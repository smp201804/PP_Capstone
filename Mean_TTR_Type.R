library(tidyverse)

# Fossil Fuel Steam
ff_steam_df <- read_csv("ff_steam_expt.csv")

# Filter for only forced, not planned or reserve shutdowns, outages and derates
type_filter <- c("D1", "D2", "D3", "D4", "SF", "U1", "U2", "U3")
ff_steam_df <- ff_steam_df %>%
  filter(ff_steam_df$Type %in% type_filter)

# Calculate mean Time_To_Repair for each outage Type
ff_steam_df %>% group_by(Type) %>%
  summarise(Mean_TTR_Type_ff = mean(Time_To_Repair, na.rm = TRUE)) %>%
  arrange(desc(Mean_TTR_Type_ff))

# Create a Box Plot graph, x = Type, y = Time_To_Repair
ggplot(data = ff_steam_df) +
  geom_boxplot(mapping = aes(x = Type, y = Time_To_Repair))

#Combined Cycle
cc_df <- read_csv("c_cycle_expt.csv")
# Filter for only forced, not planned or reserve shutdowns, outages and derates
cc_df <- cc_df %>%
  filter(cc_df$Type %in% type_filter)

# Calculate mean Time_To_Repair for each outage Type
cc_df %>% group_by(Type) %>%
  summarise(Mean_TTR_Type_cc = mean(Time_To_Repair, na.rm = TRUE)) %>%
  arrange(desc(Mean_TTR_Type_cc))

# Create a Box Plot graph, x = Type, y = Time_To_Repair
ggplot(data = cc_df) +
  geom_boxplot(mapping = aes(x = Type, y = Time_To_Repair))

# Simple Cycle
ss_df <- read_csv("s_cycle_expt.csv")

# Filter for only forced, not planned or reserve shutdowns, outages and derates
ss_df <- ss_df %>%
  filter(ss_df$Type %in% type_filter)

# Calculate mean Time_To_Repair for each outage Type
ss_df %>% group_by(Type) %>%
  summarise(Mean_TTR_Type_ss = mean(Time_To_Repair, na.rm = TRUE)) %>%
  arrange(desc(Mean_TTR_Type_ss))

# Create a Box Plot graph, x = Type, y = Time_To_Repair
ggplot(data = ss_df) +
  geom_boxplot(mapping = aes(x = Type, y = Time_To_Repair))

  



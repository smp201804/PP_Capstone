library(tidyverse)
ff_steam_df <- read_csv("ff_steam_expt.csv")

# Filter for only forced, not planned or reserve shutdowns, outages and derates
type_filter <- c("D1", "D2", "D3", "D4", "SF", "U1", "U2", "U3")
ff_steam_df <- ff_steam_df %>%
  filter(ff_steam_df$Type %in% type_filter)

# Calculate mean Time_To_Repair for each outage Type
ff_steam_df %>% group_by(Type) %>%
  summarise(Mean_TTR_Type = mean(Time_To_Repair, na.rm = TRUE)) %>%
  arrange(desc(Mean_TTR_Type))

# Create a Box Plot graph, x = Type, y = Time_To_Repair
ggplot(data = ff_steam_df, mapping = aes(x = Type, y = Time_To_Repair)) +
  geom_boxplot()

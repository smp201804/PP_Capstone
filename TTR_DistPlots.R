
ggplot(data = ff_steam_dfb, aes(x = Time_To_Repair)) +
         geom_density()
       
ggplot(data = ff_steam_dfb, aes(x = Time_To_Repair, color = Type)) +
  geom_density() +
  facet_grid(System ~ .)


ggplot(data = cc_dfb, aes(x = Time_To_Repair)) +           
  geom_density()

ggplot(data = cc_dfb, aes(x = Time_To_Repair, color = Type)) + 
  geom_density() +
  facet_grid(System ~ .)


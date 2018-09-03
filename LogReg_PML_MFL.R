

# Experimenting with logistic regression to determine which systems determine,
# or are associated with PML and MFL.
ff_steam_dfb <- ff_steam_dfb %>% 
  mutate(PML = factor(PML, levels = c("0","1"))) %>% 
  mutate(MFL = factor(MFL, levels = c("0","1")))

# PML
PML_mod_ffs <- glm(PML ~ BlrNum + BoPNum + ElecNum + STNum + GenNum + 
                     PCENum + RegNum + PersNum + InactNum + PerfNum, 
                   data = ff_steam_dfb, family = "binomial")

# Remove NA Variables
PML_mod_ffs2 <- glm(PML ~ BlrNum + BoPNum + ElecNum + STNum + GenNum + 
                     PersNum + PerfNum, data = ff_steam_dfb, family = "binomial")

# Remove PersNum
PML_mod_ffs3 <- glm(PML ~ BlrNum + BoPNum + ElecNum + STNum + GenNum + 
                      PerfNum, data = ff_steam_dfb, family = "binomial")

# Remove Elecnum
PML_mod_ffs4 <- glm(PML ~ BlrNum + BoPNum + STNum + GenNum + 
                      PerfNum, data = ff_steam_dfb, family = "binomial")


cc_dfb <- cc_dfb %>% 
  mutate(PML = factor(PML, levels = c("0","1"))) %>% 
  mutate(MFL = factor(MFL, levels = c("0","1")))

PML_mod_cc <- glm(PML ~ HRSGNum + BoPNum + ElecNum + STNum + GenNum + GTNum +  
                     JENum + MiscNum + ETNum + PCENum + RegNum + PersNum + 
                    InactNum + PerfNum, data = cc_dfb, family = "binomial")

# Remove NA Variables
PML_mod_cc2 <- glm(PML ~ HRSGNum + BoPNum + ElecNum + STNum + GenNum + GTNum +  
                    JENum + PersNum + PerfNum, data = cc_dfb, family = "binomial")

# Remove HRSGNum
PML_mod_cc3 <- glm(PML ~ BoPNum + ElecNum + STNum + GenNum + GTNum +  
                     JENum + PersNum + PerfNum, data = cc_dfb, family = "binomial")

# Remove PersNum
PML_mod_cc4 <- glm(PML ~ BoPNum + ElecNum + STNum + GenNum + GTNum +  
                     JENum + PerfNum, data = cc_dfb, family = "binomial")


#MFL Fossil Fuel Steam Turbine
MFL_mod_ffs <- glm(MFL ~ BlrNum + BoPNum + ElecNum + STNum + GenNum + 
                     PCENum + RegNum + PersNum + InactNum + PerfNum, 
                   data = ff_steam_dfb, family = "binomial")

# Remove NA Variables: PCENum, REGNum, and InactNum
MFL_mod_ffs2 <- glm(MFL ~ BlrNum + BoPNum + ElecNum + STNum + GenNum + 
                     PersNum + PerfNum,data = ff_steam_dfb, family = "binomial")

# Remove STNum
MFL_mod_ffs3 <- glm(MFL ~ BlrNum + BoPNum + ElecNum + GenNum + 
                      PersNum + PerfNum,data = ff_steam_dfb, family = "binomial")

# Remove BOPNum, checking for multiple colinearity
MFL_mod_ffs4 <- glm(MFL ~ BlrNum + ElecNum + GenNum + 
                      PersNum + PerfNum,data = ff_steam_dfb, family = "binomial")


# MFL Combined Cycle (cc)
MFL_mod_cc <- glm(PML ~ HRSGNum + BoPNum + ElecNum + STNum + GenNum + GTNum +  
                    JENum + MiscNum + ETNum + PCENum + RegNum + PersNum + 
                    InactNum + PerfNum, data = cc_dfb, family = "binomial")

# Remove NA Variables: MiscNum, ETNum, PCENum, RegNum, InactNum
MFL_mod_cc2 <- glm(PML ~ HRSGNum + BoPNum + ElecNum + STNum + GenNum + GTNum +  
                    JENum + PersNum + PerfNum, data = cc_dfb, family = "binomial")

# Remove HRSGNum, highest Pr(>|z|)
MFL_mod_cc3 <- glm(PML ~ BoPNum + ElecNum + STNum + GenNum + GTNum +  
                     JENum + PersNum + PerfNum, data = cc_dfb, family = "binomial")

# Remove PersGNum, next highest Pr(>|z|)
MFL_mod_cc4 <- glm(PML ~ BoPNum + ElecNum + STNum + GenNum + GTNum +  
                     JENum + PerfNum, data = cc_dfb, family = "binomial")



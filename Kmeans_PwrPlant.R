
#Clustering

# Fossil Fuel Steam

#First select the variables of importance
ClData_ffs <- ff_steam_dfb %>% select(System, Time_To_Repair, TBF_Period_Hrs)
ClData_ffs <- ClData_ffs[complete.cases(ClData_ffs),]
ffs_df <- scale(ClData_ffs[-1])

wssplot <- function(data, nc=15, seed=144){
  wss <- (nrow(data)-1)*sum(apply(data,2,var))
  for (i in 2:nc){
    set.seed(seed)
    wss[i] <- sum(kmeans(data, centers=i)$withinss)}
  plot(1:nc, wss, type="b", xlab="Number of Clusters",
       ylab="Within groups sum of squares")}

wssplot(ffs_df) #Indicates use of 7 Clusters

library(NbClust)
ncF <- NbClust(ffs_df, min.nc=2, max.nc=15, method="kmeans")
fit.kmF <- kmeans(ffs_df, 7, nstart=25)
fit.kmF$size
fit.kmF$centers
aggregate(ClData_ffs[-1], by=list(cluster=fit.kmF$cluster), mean)
ct.kmF <- table(ClData_ffs$System, fit.kmF$cluster)
print(ct.kmF)

library(flexclust)
randIndex(ct.kmF)

#Using PAM
library(cluster)
set.seed(666)
fit.pamF <- pam(ClData_ffs[-1], k=7, stand=TRUE)


# Combined Cycle

#First select the variables of importance
ClData_cc <- cc_dfb %>% select(System, Time_To_Repair, TBF_Period_Hrs)
ClData_cc <- ClData_cc[complete.cases(ClData_cc),]
cc_df <- scale(ClData_cc[-1])

wssplot <- function(data, nc=15, seed=144){
  wss <- (nrow(data)-1)*sum(apply(data,2,var))
  for (i in 2:nc){
    set.seed(seed)
    wss[i] <- sum(kmeans(data, centers=i)$withinss)}
  plot(1:nc, wss, type="b", xlab="Number of Clusters",
       ylab="Within groups sum of squares")}

wssplot(cc_df) #Indicates use of 3 Clusters

ncC <- NbClust(cc_df, min.nc=2, max.nc=15, method="kmeans")
fit.kmC <- kmeans(cc_df, 3, nstart=25)
fit.kmC$size
fit.kmC$centers
aggregate(ClData_cc[-1], by=list(cluster=fit.kmC$cluster), mean)
ct.kmC <- table(ClData_cc$System, fit.kmC$cluster)
print(ct.kmC)

randIndex(ct.kmC)

#Using PAM
set.seed(666)
fit.pamC <- pam(ClData_cc[-1], k=3, stand=TRUE)




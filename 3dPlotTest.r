#install.packages("plotly")
library(plotly)
#install.packages("Rpdb")
library(Rpdb)
library(datasets)

#Read PDB File
#filename<-readline(prompt = "Enter File Name: ")
filename<-"3ptb.pdb"
#filename<-"4x0l.pdb"
textMat<-read.pdb(filename, ATOM = TRUE, HETATM = TRUE)

#Make Datasets
d <- data.frame(textMat$atoms$x1,textMat$atoms$x2,textMat$atoms$x3)

#Testing for Cluster Size 5
c <- kmeans(d,5)
d2 <- data.frame(textMat$atoms$x1,textMat$atoms$x2,textMat$atoms$x3,c$cluster)
plot_ly(d2, x = ~textMat.atoms.x1, y = ~textMat.atoms.x2, z = ~textMat.atoms.x3, color = ~c.cluster)

#WSS to determine optimum clusters 
maxClusters <- 50
wss <- numeric(maxClusters)
#Squaring WSS values to get sharper changes
for (i in 2:maxClusters){wss[i] <- sum(kmeans(d,i)$withinss)*sum(kmeans(d,i)$withinss)}
plot(1:maxClusters, wss, type = "b")
optClusters <- 15

#Plot K-Means for Optimum Clusters 
c <- kmeans(d,optClusters)
d2 <- data.frame(textMat$atoms$x1,textMat$atoms$x2,textMat$atoms$x3,c$cluster)
plot_ly(d2, x = ~textMat.atoms.x1, y = ~textMat.atoms.x2, z = ~textMat.atoms.x3, color = ~c.cluster)

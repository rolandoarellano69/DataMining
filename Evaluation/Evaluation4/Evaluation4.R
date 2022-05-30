getwd()
setwd("Z:\\tec\\8vo\\mineria\\practicas\\evaluatoria4")

#read dataset
dataset <- read.csv("Iris.csv")
#since significant variables where not specified, we asume all features are significant
dataset = dataset 

#set and wcss vector for elbow method
set.seed(6)
wcss = vector()

#transformation to factor from categorical variable, needed for the clustering
dataset$species = factor(dataset$species,
       levels = c('setosa', 'versicolor', 'virginica'),
       labels = c(1, 2, 3))

#elbow method, we must make a plot and see where the cluster incrementation stops being optimal
for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)
plot(1:10,
     wcss,
     type= 'b',
     main = paste('Elbow method'),
     xlab = 'n clusters',
     ylab = 'WCSS')

# k optimal, k = 3
# applying k means, centers = k
set.seed(36)
kmeans = kmeans(x = dataset, centers = 3, iter.max = 100)
y_kmeans = kmeans$cluster

# see additional data of the model as how many elements fell in every cluster
kmeans

#visualization of the clusters
library(cluster)
clusplot(dataset,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of Iris'),
         xlab = 'features',
         ylab = 'species')
#where 1: setosa, 2: versicolor, 3: virginica

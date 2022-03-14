#Sample Size
sampleSize<-50


#Sample
sampleSize.sample<-rnorm(sampleSize,mean=0,sd=1)

#Percentage of interest
percentOfInterest<-sum((sampleSize.sample>=-1)&(sampleSize.sample<=1))/sampleSize

#Print percentage

for(i in rnorm(sampleSize)){
  print(percentOfInterest * 100)
}

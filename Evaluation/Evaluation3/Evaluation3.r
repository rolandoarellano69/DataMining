# set working directory
getwd()
setwd("/home/edgar/Desktop/Tec/mineria/Evaluatoria3/")

#load the set of data and view it
data <- read.csv("Social_Network_Ads.csv")
data

library(e1071)

# split data 70% for training, 30% for testing
set.seed(123)
library("caTools")
split = sample.split(data$Purchased, SplitRatio = 0.70)
train = subset(data, split == TRUE)
test = subset(data, split == FALSE)

train
test
# naivebayes model using the classification column as factor and the train data as source
model = naiveBayes(as.factor(train$Purchased) ~., data=train)
model

# predict function called using the model made and the test data is used
model_pred <- predict(model, test)
model_pred #show the vector with the prediction
con_matrix <- table(model_pred, test$Purchased) #generate confusion matrix
con_matrix

# plot of the confusion matrix
fourfoldplot(con_matrix, color = c("orange", "green"), main="Matriz de confusión para Social_Network_Ads")

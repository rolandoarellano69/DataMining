# Evaluation Practice No. 3
## Naive Bayes

## [Video](https://youtu.be/JXaromZGqXw)

### Explanation

We enter the working directory where the csv file with the data is and load in into the data variable.
```r
# set working directory
getwd()
setwd("/home/edgar/Desktop/Tec/mineria/Evaluatoria3/")

#load the set of data and view it
data <- read.csv("Social_Network_Ads.csv")
data
```

Then we load the library e1071 to use its Naive Bayes function, we set the seed with the number 123 and load the library caTools to be used for spliting the data into 2 subsets: training to train the model with and test to apply the resulting model to. The split ratio is 70% to 30% respectively. Both sets are shown, with the total data being 400 entries the train subset has 280 elements while test has 120.

```r
library(e1071)

# split data 70% for training, 30% for testing
set.seed(123)
library("caTools")
split = sample.split(data$Purchased, SplitRatio = 0.70)
train = subset(data, split == TRUE)
test = subset(data, split == FALSE)

train
test
```

The model is created by calling the function naiveBayes using the Purchased col as the variable to be classified, converting it into a vector first to make the models job easier.

```r
# naivebayes model using the classification column as factor and the train data as source
model = naiveBayes(as.factor(train$Purchased) ~., data=train)
model
```

Once we have the model trained we proceed to generate a prediction, the predict function is called using the model generated previously and setting the data for testing as the ones in the varaible test. We then generate a confusion matriz to see how many errors the model had at the time of predicting the classification for the Purchased column.

```r
# predict function called using the model made and the test data is used
model_pred <- predict(model, test)
model_pred #show the vector with the prediction
con_matrix <- table(model_pred, test$Purchased) #generate confusion matrix
con_matrix
```

The caret library is loaded, this library helps to display detailed information about confusion matrixes. Using the function confusionMatrix we can see various statistics about the confusion matriz, such as the accuracy, in this case, for this run, the accuracy was of 87%, which we'll see in the results area.

```r
library("caret")

confusionMatrix(con_matrix)

# plot of the confusion matrix
fourfoldplot(con_matrix, color = c("orange", "green"), main="Matriz de confusión para Social_Network_Ads")
```

### Results

Confusion matrix statistics
![](https://github.com/rolandoarellano69/DataMining/blob/Unit3/Evaluation/Evaluation3/img/statistics_cm.png)

Vector of prediction results
![](https://github.com/rolandoarellano69/DataMining/blob/Unit3/Evaluation/Evaluation3/img/vector_results.png)

Four fold plot of the confusion matrix
![](https://github.com/rolandoarellano69/DataMining/blob/Unit3/Evaluation/Evaluation3/img/matrix_confusion.png)

### Full Code
```r
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

library("caret")

confusionMatrix(con_matrix)

# plot of the confusion matrix
fourfoldplot(con_matrix, color = c("orange", "green"), main="Matriz de confusión para Social_Network_Ads")
```

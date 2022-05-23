# Practice 4, Unit 3
## K- Nearest Neighbor

Analize the code for data visualization of the machine learning algorithm K Nearest Neighbor, this code is in the class' repository, the link is provided here.

The data is loaded from a csv called "Social_Network_Ads.csv"
```r
# Importing the dataset
getwd()
setwd("Z:\\tec\\8vo\\mineria\\practicas\\practica4\\")
dataset = read.csv('./Social_Network_Ads.csv')
dataset = dataset[3:5]
```

The factor values are described as 0 and 1 for the column Purchased
```r
# Encoding the target feature as factor
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
```

Splitting for test and training data is made, in this case the ratio is 75  to 25.

```r
# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```

Scaling of features to make the models job easy
```r
# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```

Applying the k-nearest-neighbor algorithm, the test data is specified as well as the training data and the k variable is given a value of 5.

```r
# Fitting K-NN to the Training set and Predicting the Test set results
library(class)
y_pred = knn(train = training_set[, -3],
             test = test_set[, -3],
             cl = training_set[, 3],
             k = 5,
             prob = TRUE)
 
# Making the Confusion Matrix
cm = table(test_set[, 3], y_pred)
```

Visualization of the results for training data.
```r
# Visualising the Training set results
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = knn(train = training_set[, -3], test = grid_set, cl = training_set[, 3], k = 5)
plot(set[, -3],
     main = 'K-NN (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

Visualization of results for test data
```r
# Visualising the Test set results
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = knn(train = training_set[, -3], test = grid_set, cl = training_set[, 3], k = 5)
plot(set[, -3],
     main = 'K-NN (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

### Results

For k = 5

For training data:

![](https://github.com/rolandoarellano69/DataMining/blob/Unit3/Practice/Unit3/Practice4/img/resultados1.png)

For testing data:

![](https://github.com/rolandoarellano69/DataMining/blob/Unit3/Practice/Unit3/Practice4/img/resultados2.png)

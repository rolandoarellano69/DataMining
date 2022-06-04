# Practce 2, Unit 3
# Backwards Elimination

```r
# Building the optimal model using Backward Elimination
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
               data = dataset )
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
               data = dataset )
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset )
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset )
summary(regressor)

y_pred = predict(regressor, newdata = test_set)
y_pred
```

Whats been gettin done here is the process of backwards elimination, where different columns from the data (or variables) and fed to a regressor, this with the goal of finding the correlation there is between the variables, if any. After these eliminations have been made, the function predict is called using the used regressor and the test data to get forecasts


```r
backwardElimination <- function(x, sl) {
  numVars = length(x)
  for (i in c(1:numVars)){
    regressor = lm(formula = Profit ~ ., data = x)
    maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
    if (maxVar > sl){
      j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
      x = x[, -j]
    }
    numVars = numVars - 1
  }
  return(summary(regressor))
}

SL = 0.05
#dataset = dataset[, c(1,2,3,4,5)]
training_set
backwardElimination(training_set, SL)
```
After that, a function called backwardElimination is made, using the regressor mentioned earlier, this function automates the process of checking the columns for any correlation that might exist between them, returning a summary of the final regressor. After this, the function is call and the result is a summary of the test data used for testing, from statistics values to residual error, it is shown that the degreees of freedom are 38.

## Results
![](https://github.com/rolandoarellano69/DataMining/blob/Unit3/Practice/Unit3/Practice2/backwards_elim.png)

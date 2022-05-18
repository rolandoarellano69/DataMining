## Conclusion 

Analyze the code corresponding to the data visualization of machine learning model data linear regression of the code


#### The graph Salary Vs Experince (tranining set)
What we could see at the moment of running the code, we saw that at the moment of showing us the training graph that represents on the x-axis the salary and on the y-axis the years of experience, in this we could see that it showed in the linear regression graph some data, which in this case are put with red points that were very dispersed in the linear regression, this makes us understand that this graph has a good performance but it could be improved and be more faithful to what we need to represent. 
```r
library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$YearsExperience, y=training_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary vs Experience (Training Set)') +
  xlab('Years of experience') +
  ylab('Salary')
```
 

#### The graph Salary Vs Experince (test set)
In the following graph Salary versus experience Test set, we can see that the dispersion in the linear regression is more accurate and we could say that it is filtered and is more accurate by showing the cardinal points that represent the relationship between years and experience.

```r
ggplot() +
  geom_point(aes(x=test_set$YearsExperience, y=test_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary vs Experience (Test Set)') +
  xlab('Years of experience') +
  ylab('Salary')
```


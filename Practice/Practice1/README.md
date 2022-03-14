# Practice 1

## Code
```r
n <- 1000000
c <- 0
for(i in rnorm(n)){
  if(i >= -1.0 & i <= 1.0) {
  c = c + 1
    }
 }
 result <- (c / n) *100
 print (result)
 
```
## Run 1 with n=10
```r
n <- 10
c <- 0
for(i in rnorm(n)){
  if(i >= -1.0 & i <= 1.0) {
  c = c + 1
    }
 }
 result <- (c / n) *100
 print (result)
 [1] 80
 ```
 
 ## Run 2 with n=1000
 ```r
 n <- 1000
c <- 0
for(i in rnorm(n)){
  if(i >= -1.0 & i <= 1.0) {
  c = c + 1
    }
 }
 result <- (c / n) *100
 print (result)
 [1] 68.2
 ```
 ## Run 3 with n=100000
 ```r
 n <- 100000
c <- 0
for(i in rnorm(n)){
  if(i >= -1.0 & i <= 1.0) {
  c = c + 1
    }
 }
 result <- (c / n) *100
 print (result)
 [1] 68.338
 ```
 

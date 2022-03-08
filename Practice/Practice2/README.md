# Practice 2

## 1. abs
Computes the absolute value of a numeri expression given.

```r
abs(-54) #returns 54
```

## 2. all.equal
Compares two objects given as parameters. It doesnt only returns a boolean but a report of equality between the objects, if the objects 
are equal true will be return, if not a string as a report.

```r
all.equal(0, 2) #returns 'mean absolute difference: 2'
```

## 3. any
Given a vector of logical values it will return true if at least one of the values is true.

```r
any(c(FALSE, FALSE, TRUE, FALSE)) #returns true
```

## 4. approx
Returns a list of linearly interpolated points given a set of x values and y values

```r
approx(1:10, rnorm(10)) #returns a collection of interpolated points
```

## 5. apply
Returns a list, vector or array obtained applying a function to the margins of a given array of matrix.

```r
x <- cbind(x1 = 3, x2 = c(4:1, 2:5))
apply(x, 2, sort)
```

## 6. attr
Sets or gets a specific attribute for an object.
```r
x <- 1:10
attr(x, "dim") <- c(2,5)
```

## 7. barplot
Creates a bar graph for a set of data

```r
barplot(cbind(x1 <- 1:10, x2 <- 1:15)) # a graph with a bar for x1 and another one for x2
```

## 8. alarm
Notifies the user with a sound or generates an scape character \a in console

```r
alarm() #beeps or shows a \a in console
```

## 9. box
Draws a box around the graph youre currently working with

```r
box(col='blue')
```

## 10. boxplot
Produces a diagrama of boxes and whiskers given a set of data

```r
x <- c(8, 5, 14, 9, -9, 4, 6, 8, 7, -2, 0, 0, 0, 1)
boxplot(x, horizontal = TRUE)

```
## 11.factorial of a number
Factorize a selected number
```r
factorial(4)  = (24)
```
##12. round a number up
The data rounds it down
```r
ceiling (9.9) = 10
```
##13. round a number down 
```r
 floor(9.4)=9
 ```
 ##14. count the total charecters including scapes
 ```r
 totalCaracteres <- nchar("Total de caracteres incluyendo espacios")
print(totalCaracteres)=39
```
##15. uppercase characters
 ```r
 
textoMayusculas <- toupper("Texto en mayúsculas")
print(textoMayusculas) = TEXTO EN MAYÚSCULAS
```
##16. lowcase charecters
```r
TextoMinusculas <- tolower("Texto en minúsculas")
print(TextoMinusculas)= texto en minúsculas 
```
##17. round out
round decimal numbers
```r
round(15.6876,2)
```
##18. allows to display a graph
```r
layout(matrix(1:4, 2, 2))
layout.show(4)
```
##19. Show details of objects in memory
```r
ls.str()
```
##20. delete object in memory
```r
rm(name)
```


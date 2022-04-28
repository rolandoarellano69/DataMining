c <- c(43, 55, 40)
append(c, c(10, 5, 1))
d <- append(c,c(10, 5, 1))
c
d
abs(-43)
all.equal(3, 1)
any(FALSE, FALSE, TRUE)
approx(c(0, 1, 2), c(2, 3, 4))

abs(-54)
all.equal(0, 2)
any(c(FALSE, FALSE, TRUE, FALSE))
approx(1:10, rnorm(10))
?apply

x <- cbind(x1 = 3, x2 = c(4:1, 2:5))
apply(x, 2, sort)

?attr
x <- 1:10
attr(x, "dim") <- c(2,5)

?barplot
barplot(cbind(x1 <- 1:10, x2 <- 1:15))

?alarm
alarm()

?box
box(col='blue')

?boxplot
x <- c(8, 5, 14, 9, -9, 4, 6, 8, 7, -2, 0, 0, 0, 1)
boxplot(x, horizontal = TRUE)

#11.
factorial(4)
#12.
ceiling(9.9)
#13.
floor(9.4)
#14. 
totalCaracteres <- nchar("Total de caracteres incluyento espacios")
print(totalCaracteres)
#15.
textoMayusculas <- toupper("Texto en mayusculas")
print(textoMayusculas)
#16.
TextoMinusculas <- tolower("Texto en minusculas")
print(TextoMinusculas)
#17. 
round(15.6876,2)
#18. 
layout(matrix(1:4, 2, 2))
layout.show(4)
#19. 
ls.str()
#20.
rm(name)
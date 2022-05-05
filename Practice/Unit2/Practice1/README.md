![](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4Dze8yYYzBPaBVPf7j9Mx9NkHZDDzKXzavCoUnkZuO0xqHG3__mjVJOearB9bEeY4sg&usqp=CAU)
# Instituto Tecnológico de Tijuana
### Ingeniería en Sistemas Computacionales
### Unidad 2
### Práctica 1
#### Gramática de las gráficas
### Materia:
#### Minería de datos
### Docente:
#### Jose Christian Romero Hernandez
### Alumnos:
- Arellano Munguia Rolando 18210453
- Regalado Lopez Edgar Eduardo 18212254

# Practica 1

### 1. Look for a datasource in csv format.

The datasource found is about weather in various cities in Australia. And can be found [here](https://github.com/rolandoarellano69/DataMining/blob/Unit2/Practice/Unit2/Practice1/Weather.csv)


### 2. Read the data and analyze it with R
```r
archivo <- "Z:\\tec\\8vo\\mineria\\data\\Weather.csv"
datos <- read.csv(archivo)
str(datos)
datos_clean <- na.omit(datos) #omitir renglones incompletos
str(datos_clean)
```

#### 2.1 Make a scatterplot

```r
#primera grafica: scatterplot
f <- ggplot(datos_clean, aes(x=month, y= avg_temp)) + geom_point() + scale_x_continuous(breaks=c(1,2,3,4,5,6,7,8,9,10,11,12))
f
```

##### Resultado:

![](https://github.com/rolandoarellano69/DataMining/tree/Unit2/Practice/Unit2/Practice1/plot_scatter.png)

#### 2.2 Make some facets

```r
#segunda grafica: facetas de ciudad
f2 <- f + facet_grid(city~.)
f2
```

##### Resultado:

#### 2.3 Make some themes and layers

```r
#tercera grafica: temas/capas
f3 <- f2 + aes(color=events) + geom_point(aes(size=avg_humidity)) +
  labs(x="Month", y="Average Temperature (F)", size="Average Humidity")
f3
            
```

##### Resultado:

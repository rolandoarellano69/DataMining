![](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4Dze8yYYzBPaBVPf7j9Mx9NkHZDDzKXzavCoUnkZuO0xqHG3__mjVJOearB9bEeY4sg&usqp=CAU)
# Instituto Tecnológico de Tijuana
### Ingeniería en Sistemas Computacionales
### Unidad 2
### Práctica Evaluatoria
#### Gramática de las gráficas
### Materia:
#### Minería de datos
### Docente:
#### Jose Christian Romero Hernandez
### Alumnos:
- Arellano Munguia Rolando 18210453
- Regalado Lopez Edgar Eduardo 18212254

### Fecha:
#### Tijuana Baja California a 04 de 05  del 2022 


# Evaluation Practice No. 2

The goal of this practice was to replicate the graph shown here:
![](https://github.com/rolandoarellano69/DataMining/blob/Unit2/Evaluation/Evaluation2/goal_graph.png)

with our own R code, which can be found [here](https://github.com/rolandoarellano69/DataMining/blob/Unit2/Evaluation/Evaluation2/practica_eval2.R)

The dataset used for this practice was provided by the teacher and can be found [here](https://github.com/rolandoarellano69/DataMining/blob/Unit2/Evaluation/Evaluation2/project_data.csv)

### Code

```r
#load needed fonts
library(extrafont) 
font_import()
loadfonts(device = "win")

archivo <- "Z:\\tec\\8vo\\mineria\\evaluaciones\\unidad_2\\project_data.csv" #read csv
datos <- read.csv(archivo)
str(datos) 
frame <- data.frame( #make a data frame from read data
  GROSS_PERC_US = datos["Gross...US"],
  GENRE = datos["Genre"],
  BUDGET_MILL = datos["Budget...mill."],
  STUDIO = datos["Studio"]
)

genre_filter <- c("action", "adventure", "animation", "comedy", "drama") 
studio_filter <- c("Buena Vista Studios", "Fox", "Paramount Pictures", "Sony", "Universal", "WB")
frame <- frame[frame$Genre %in% genre_filter,] #filter genres
frame <- frame[frame$Studio %in% studio_filter,] #filter studios


points <- ggplot(frame, aes(x=Genre, y=`Gross...US`)) + #scatterplot
  geom_point( #points
    aes(color=Studio,size=`Budget...mill.`), #size with budget millions and color groups by studio
      position=position_jitter( w=0.3) #this makes the values disperse sideways
  )

boxes <- points + #boxplots
  geom_boxplot(alpha=0.5, aes(group=Genre)) #group by genre and give transparency
boxes <- boxes + ggtitle("Domestic Gross % by Genre") + #main title
  labs(size="Budget $M") +
  ylab("Gross % US") +
  theme(plot.title = element_text(hjust=0.5, size=20, family="Comic Sans MS"), #center main title
        axis.title.x = element_text(color = "purple", size=16, family="Comic Sans MS"), #label themes
        axis.title.y = element_text(color = "purple", size=16, family="Comic Sans MS")) 

boxes

```

### Resulting Graph
![](https://github.com/rolandoarellano69/DataMining/blob/Unit2/Evaluation/Evaluation2/resultado_practica2.png)
The Resulting graph is similar to the one on the assignment, using boxplots applied to the genres and a scatterplot grouped by the studios producing the movies. The labels and colors where also replicated. The size of the dots in the scatterplot represent the budget in millions. X is the genre classification while Y is the gross percentaje in the US

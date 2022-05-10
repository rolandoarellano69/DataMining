#cargar fuentes adicionales
library(extrafont) 
font_import()
loadfonts(device = "win")

archivo <- "Z:\\tec\\8vo\\mineria\\evaluaciones\\unidad_2\\project_data.csv"
datos <- read.csv(archivo)
datos
str(datos)
datos["Gross...US"]
frame <- data.frame(
  GROSS_PERC_US = datos["Gross...US"],
  GENRE = datos["Genre"],
  BUDGET_MILL = datos["Budget...mill."],
  STUDIO = datos["Studio"]
)

genre_filter <- c("action", "adventure", "animation", "comedy", "drama")
studio_filter <- c("Buena Vista Studios", "Fox", "Paramount Pictures", "Sony", "Universal", "WB")
frame <- frame[frame$Genre %in% genre_filter,] #filter genres
frame <- frame[frame$Studio %in% studio_filter,] #filter studios


points <- ggplot(frame, aes(x=Genre, y=`Gross...US`)) +
  geom_point( #points
    aes(color=Studio,size=`Budget...mill.`), #size with budget millions and color groups by studio
      position=position_jitter( w=0.3) #this makes the values disperse sideways
  )

boxes <- points +
  geom_boxplot(alpha=0.5, aes(group=Genre)) #boxplots
boxes <- boxes + ggtitle("Domestic Gross % by Genre") + #main title
  labs(size="Budget $M") +
  ylab("Gross % US") +
  theme(plot.title = element_text(hjust=0.5, size=20, family="Comic Sans MS"), #center main title
        axis.title.x = element_text(color = "purple", size=16, family="Comic Sans MS"),
        axis.title.y = element_text(color = "purple", size=16, family="Comic Sans MS")) 

boxes

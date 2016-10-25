library(knitr)
library(knitr)
library(dplyr)
library(ggplot2)
library(ggvis)

library(shiny)
library(rmarkdown)



# Uvozimo funkcije za delo z datotekami XML.
 source("lib/xml.r", encoding = "UTF-8")

# Uvozimo funkcije za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r", encoding = "UTF-8")

library(ggplot2)
library(dplyr)

pretvori.zemljevid <- function(zemljevid) {
  fo <- fortify(zemljevid)
  data <- zemljevid@data
  data$id <- as.character(0:(nrow(data)-1))
  return(inner_join(fo, data, by="id"))
}

mesta <- uvozi.zemljevid("http://biogeo.ucdavis.edu/data/gadm2.8/shp/ESP_adm_shp.zip",
                         "ESP_adm2", encoding = "UTF-8")
m1 <- match(mesta$NAME_2, podatki$Team)
mesta$points <- podatki$Points[m1]
mesta$gol_tekma <- podatki$`Goals_per_match`[m1]
mesta$pol <- pozicije$X19[m1]
mesta$povprecje <- pozicije$povprecna[m1]
mst <- pretvori.zemljevid(mesta)
zem1 <- ggplot() + geom_polygon(data = mst, aes(x=long, y=lat, group = group, fill=points),
                                color = "grey") + xlim(-10, 5) + ylim(35, 45) +
    scale_fill_continuous(low = "#69b8f6", high = "#142d45") + ggtitle("Spain")

zem3 <- ggplot() + geom_polygon(data = mst, aes(x=long, y=lat, group = group, fill=pol),
                                       color = "grey") + xlim(-10, 5) + ylim(35, 45) +
       scale_fill_continuous(low = "#69b8f6", high = "#142d45") + ggtitle("Spain")
  

zem2 <- zem3 + geom_point(data = mst %>% group_by(id, gol_tekma) %>% summarise(x = mean(long), y = mean(lat)),
                  aes(x = x, y = y, size=gol_tekma),color="green")
  
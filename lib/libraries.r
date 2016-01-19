library(knitr)
library(knitr)
library(dplyr)
library(ggplot2)
library(ggvis)

library(shiny)
library(rmarkdown)


library(ggplot2)
library(dplyr)


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
                         "ESP_adm1", encoding = "UTF-8")
mesta$Pozicija <- podatki$Position
mst <- pretvori.zemljevid(mesta)
zem1 <- ggplot() + geom_polygon(data = mst, aes(x=long, y=lat, group = group),
                                color = "grey", title = "Spain", fill=Pozicija) + xlim(-10, 5) + ylim(35, 45)
  scale_fill_continuous(low = "#69b8f6", high = "#142d45")

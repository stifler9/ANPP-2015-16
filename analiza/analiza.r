# 4. faza: Analiza podatkov
library(shiny)

barve <- rainbow(length(levels(obcine[[7]])))
names(barve) <- levels(obcine[[7]])

runApp("shiny")



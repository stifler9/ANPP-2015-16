# 4. faza: Analiza podatkov
library(shiny)

barve <- rainbow(length(levels(obcine[[7]])))
names(barve) <- levels(obcine[[7]])

shinyServer(
  server <- function(input, output) {
    
    output$pozicija <- renderPlot({
      ggplot(pozicije %>% aes(x = input$obdobje, y = c(1:20))) + 
        scale_fill_continuous(low = "#69b8f6", high = "#142d45") + 
        geom_bar(stat ="identity") + 
        theme(axis.text.x = element_text(angle = 90, vjust = 0.5)) +
        ggtitle("Pozicije ekip skozi leto")})
)
  
shinyUI(
  ui <- fluidPage(
        
    titlePanel("Analiza pozicij ekip skozi leto"),
    tabsetPanel(
      tabPanel("Pozicija",
               radioButtons("obdobje","Obdobje",inline=TRUE,choices = c("X1",'X2',"X3","X4","X5","X6",'X7',"X8","X9","X10","X11",'X12',"X13","X14","X15","X16",'X17',"X18","X19","X20","X21",'X22',"X23","X24","X25","X26",'X27',"X28","X29","X30","X31",'X32',"X33","X34","X35","X36",'X37',"X38","povprečna")),
               plotOutput("pozicija"))
    )
  )
)

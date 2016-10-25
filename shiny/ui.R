library(shiny)

shinyUI(
  ui <- fluidPage(
    
    titlePanel("Analiza pozicij ekip skozi leto"),
    tabsetPanel(
      tabPanel("Točke",
               sliderInput(inputId="izenaceni",label="Draws",min=0,max=14,value=3,sep=""),
               plotOutput("tocke"))
    )
  )
)
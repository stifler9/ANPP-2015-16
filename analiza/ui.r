shinyUI(
  ui <- fluidPage(
    
    titlePanel("Analiza tveganja ekip"),
    tabsetPanel(
      tabPanel("Točke",
               sliderInput(inputId="izenaceni",label="Draws",min=0,max=14,value=3,sep=""),
               plotOutput("tocke")),
      
      tabPanel("Goli na tekmo",
               sliderInput(inputId="zmage",label="Zmage/porazi",min=0,max=6.5,value=1.0,sep=""),
               plotOutput("goli na tekmo"))
    )
  )
)
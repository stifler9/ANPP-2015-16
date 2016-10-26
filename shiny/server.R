library(shiny)
shinyServer(
  server <- function(input, output) {
    output$tocke <- renderPlot({
      ggplot(podatki %>% filter(Draws >= input$izenaceni), aes(x = Team, y = Points)) + 
        scale_fill_continuous(low = "#69b8f6", high = "#142d45") + 
        geom_bar(stat ="identity") + 
        theme(axis.text.x = element_text(angle = 90, vjust = 0.5)) +
        ggtitle("Katere ekipe imajo več izenačenih izidov")})
    
    names(podatki)[11] <- "Win_Lose"
    
    output$goli <- renderPlot({
      ggplot(podatki %>% filter(Win_Lose >= input$zmage), aes(x = Team, y = Goals_per_match), color="Blue") + 
        scale_fill_continuous(low = "#69b8f6", high = "#142d45") + 
        geom_bar(stat ="identity") + 
        theme(axis.text.x = element_text(angle = 90, vjust = 0.5)) +
        ggtitle("Goli na tekmo")})
  }
)
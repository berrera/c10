library(shiny)
library(graphics)
library(wordcloud)

#server.R
shinyServer(function(input, output) {
  # Summing up numbers
  moneyIn    <-reactive(as.numeric(input$Salary)+as.numeric(input$Income))
  moneyItems <-reactive(c(as.numeric(input$Food),as.numeric(input$Other),as.numeric(input$Consume),as.numeric(input$Petrol),as.numeric(input$Car),as.numeric(input$School),as.numeric(input$Sport),as.numeric(input$Tax),as.numeric(input$Savings),as.numeric(input$Rent),as.numeric(input$Bills),as.numeric(input$Insure1),as.numeric(input$Insure2),as.numeric(input$Insure3),as.numeric(input$Insure4)))
  moneyOut   <-reactive(sum(moneyItems()))
  moneyRest  <-reactive(moneyIn() - moneyOut())
  
  output$moneyIn  <-renderText({paste(moneyIn(),input$radio)})
  output$moneyOut <-renderText({paste(moneyOut(),input$radio)})
  output$rest     <-renderText({paste((moneyIn() - moneyOut()),input$radio)})
  output$cloud    <-renderPlot({if (moneyRest() >= 0) {
    wordcloud(c("Food","Other","Consume","Petrol","CarFix","School","Sport","Tax","Savings","Rent","Bills","HouseInsure","CarInsure","LifeInsure","HealthInsure","MONEY2SPEND"),
                          freq=c(moneyItems(), moneyRest()),
                          scale=c(4,0.5),
                          min.freq=0,
                          colors=rainbow(16), ordered.colors=TRUE)
    } else {
      wordcloud("OUTofBuget", freq=c(1), colors="black")
    }
  })
})

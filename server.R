library(shiny)
library(graphics)

#server.R
shinyServer(function(input, output) {
  # Summing up numbers
  output$moneyIn<-renderText({as.numeric(input$Salary)+as.numeric(input$Income)})
  output$curr<-renderText({input$radio})
  output$moneyOut<-renderText({as.numeric(input$Consume)+as.numeric(input$Petrol)+as.numeric(input$Car)+as.numeric(input$School)+as.numeric(input$Sport)+as.numeric(input$Tax)+as.numeric(input$Savings)+as.numeric(input$Rent)+as.numeric(input$Bills)+as.numeric(input$Insure1)+as.numeric(input$Insure2)+as.numeric(input$Insure3)+as.numeric(input$Insure4)})
  output$rest<-renderText({as.numeric(input$Salary)+as.numeric(input$Income)-(as.numeric(input$Consume)+as.numeric(input$Petrol)+as.numeric(input$Car)+as.numeric(input$School)+as.numeric(input$Sport)+as.numeric(input$Tax)+as.numeric(input$Savings)+as.numeric(input$Rent)+as.numeric(input$Bills)+as.numeric(input$Insure1)+as.numeric(input$Insure2)+as.numeric(input$Insure3)+as.numeric(input$Insure4))})
})

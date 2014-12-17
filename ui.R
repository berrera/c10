library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Family budjet"),
    
  sidebarPanel(
    helpText("Documentation: this to to have a summary of the family budject, money in and out, to know if you will get to the end of the month begging for food and hiding from creditors. Write your figures in the following fields."),
# Currency
    h2("Currency"),
    radioButtons("radio", label=h3("Your currency"), choices=list("EUR"="euro", "USD"="dollars", "my$"="my money"), selected="my money"),
# money coming in
    h2("Money In"),
    textInput("Salary", label=h4("Main income (salary or pension)"), value=0),
    textInput("Income", label=h4("Other income (Investments, ..)"), value=0),
# money going out
    h2("Money Out"),
    textInput("Rent", label=h4("Rent or mortage"), value=0),
    textInput("Bills", label=h4("House bills (electricity, ..)"), value=0),
    textInput("Consume", label=h4("House maintaincance"), value=0),
    textInput("Insure1", label=h4("House Insurance"), value=0),
    textInput("Insure2", label=h4("Car Insurance"), value=0),
    textInput("Insure3", label=h4("Life Insurance"), value=0),
    textInput("Insure4", label=h4("Health Insurance"), value=0),
    textInput("Petrol", label=h4("Petrol"), value=0),
    textInput("Car", label=h4("Car maintaincance"), value=0),
    textInput("School", label=h4("Children school"), value=0),
    textInput("Sport", label=h4("Recreative activities"), value=0),
    textInput("Tax", label=h4("Tax"), value=0),
    textInput("Savings", label=h4("Setting aside for rainy days"), value=0)
  ),
  mainPanel(
    h3("Your currency is"),
    textOutput('curr'),
    h3("Total money In", align="left"),
    textOutput('moneyIn'),
    h3("Total money Out", align="left"),
    textOutput('moneyOut'),
    h3("What remains", align="left"),
    textOutput('rest')
  )
))

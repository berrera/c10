#
library(shiny)

#shinyUI(pageWithSidebar(
shinyUI(fluidPage(
  # Application title
  headerPanel("Family budget"),
    
  sidebarPanel(width=12,
    fluidRow(
      # Currency
      column (1,
        h6 ("Your currency"),
        radioButtons("radio", label="select:", choices=list("EUR"="euro", "USD"="$", "MY$"="my money"), selected="my money")
      ),
      column(1),
      # money coming in
      column (2,
        h6 ("Money In incomes"),
        numericInput("Salary", label="Salary or pension", value=1000, min=0, max=NA, step=1),
        numericInput("Income", label="Other incomes", value=50, min=0, max=NA, step=1)
      ),
      # money going out
      column (2,
        h6 ("In-house costs"),
        numericInput("Rent", "Rent or Mortage", value=200, min=0, max=NA, step=1),
        numericInput("Bills", label="House bills", value=35, min=0, max=NA, step=1),
        numericInput("Consume", label="Consumables", value=30, min=0, max=NA, step=1),
        numericInput("Food", label="Food", value=250, min=0, max=NA, step=1)
      ),
      column (2,
        h6 ("Out-door costs"),
        numericInput("Sport", label="Recreative activities", value=30, min=0, max=NA, step=1),
        numericInput("Petrol", label="Petrol", value=20, min=0, max=NA, step=1),
        numericInput("Car", label="Car fixes", value=5, min=0, max=NA, step=1),
        numericInput("School", label="School", value=100, min=0, max=NA, step=1)
      ),
      column (2,
        h6 ("Insurance premiums"),
        numericInput("Insure3", label="Life or pension", value=10, min=0, max=NA, step=1),
        numericInput("Insure1", label="House", value=25, min=0, max=NA, step=1),
        numericInput("Insure2", label="Car", value=15, min=0, max=NA, step=1),
        numericInput("Insure4", label="Health", value=35, min=0, max=NA, step=1)
      ),
      column (2,
        h6 ("Misc / Other costs"),
        numericInput("Savings", label="For rainy days", value=100, min=0, max=NA, step=1),
        numericInput("Tax", label="Tax", value=150, min=0, max=NA, step=1),
        numericInput("Other", label="Other", value=5, min=0, max=NA, step=1)
      )
    )
  ),
  mainPanel(width=12,
    tabsetPanel(type="tab",
      tabPanel("Results", 
        fluidRow (
          column (4,
            h5("Total money In", align="left"),
            textOutput('moneyIn')
          ),
          column (4,
            h5("Total money Out", align="left"),
            textOutput('moneyOut')
          ),
          column (4,
            h5("What remains", align="left"),
            textOutput('rest')
          )
        ),
        plotOutput("cloud")
      ),
      tabPanel("Help",
        h5("Documentation"),
        hr(),
        p("This to to have a summary of the family budget, money in and out, to know if you will get to the end of the month begging for food and hiding from creditors. Write your figures in the following fields.")
      )
    )
  )
))

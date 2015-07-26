library(shiny)
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Esophageal Cancer prediction"),
    sidebarPanel(
      selectInput("ageGroup", label = h3("Choose 1 of the Age Groups (years)"), 
                  choices = list("25 - 34" = 1, "35 - 44" = 2, "45 - 54" = 3, "55 - 64" = 4, "65 - 74" = 5, 
                                 "75+" = 6), selected = 1),
      selectInput("alcGroup", label = h3("Choose 1 of the Alcohol consumption Level (gm/day)"), 
                  choices = list("0 - 39" = 1, "40 - 79" = 2, "80 - 119" = 3, "120+" = 4), 
                                selected = 1),
      selectInput("tobGroup", label = h3("Choose 1 of the Tabacco consumption Level (gm/day)"), 
                  choices = list("0 - 9" = 1, "10 - 19" = 2, "20 - 29" = 3, "30+" = 4), 
                                selected = 1),
      submitButton('Submit')
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Result", 
                 h3('Results of prediction'),
                 h4('You entered Age Group'),
                 verbatimTextOutput("inputAgeGroup"),
                 h4('You entered Alcohol consumption Level'),
                 verbatimTextOutput("inputAlcoholGroup"),
                 h4('You entered Tabacco consumption Level'),
                 verbatimTextOutput("inputTobaccoGroup"),
                 
                 h4('Which resulted in a prediction of '),
                 verbatimTextOutput("prediction")), 
        tabPanel("Help", h3("How to use the Esophageal Cancer prediction webpage"),
                 p("Enter your Age Group, Alcohol Level and Tabacco Level."), 
                 p("Click on the submit button. "), 
                 p("The prediction uses Logistic Regression model to produce a probablity of cancer."))
      )
    )
  )
)
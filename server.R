library(shiny)
library(datasets)
require(stats)

model1 <- glm(cbind(ncases, ncontrols) ~ agegp + tobgp * alcgp,
              data = esoph, family = binomial())
sample <- esoph[1,]
agegpLvl <- levels(sample$agegp)
alcgpLvl <- levels(sample$alcgp)
tobgpLvl <- levels(sample$tobgp)

cancerRisk <- function(ageLvl, alcLvl, tobLvl) {
  sample$agegp <- agegpLvl[ageLvl]
  sample$alcgp <- alcgpLvl[alcLvl]
  sample$tobgp <- tobgpLvl[tobLvl]
  result <- predict(model1, newdata = sample, type = "response")
  unname(result)
}
shinyServer(
  function(input, output) {
    output$inputAgeGroup <- renderPrint({agegpLvl[as.numeric(input$ageGroup)]})
    output$inputAlcoholGroup <- renderPrint({alcgpLvl[as.numeric(input$alcGroup)]})
    output$inputTobaccoGroup <- renderPrint({tobgpLvl[as.numeric(input$tobGroup)]})
    output$prediction <- renderPrint({cancerRisk(as.numeric(input$ageGroup), as.numeric(input$alcGroup), 
                                                 as.numeric(input$tobGroup))})
  }
)
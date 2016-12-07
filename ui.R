library(shiny)
library(UsingR)
data(father.son)
shinyUI(fluidPage(
    titlePanel("Predicting son's height from father's height"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderFH", "What is the father's height?", 50, 80, value = 65),
            checkboxInput("showModel", "Show/Hide Model", value = TRUE)
        ),
        mainPanel(
            h3("Documentation"),
            h4("Select the father's height on the slider, and it will return the son's height based on our linear model!"),
            plotOutput("plot"),
            h3("Predicted son's height"),
            textOutput("pred")
        )
    )
))
library(shiny)
library(UsingR)
data(father.son)
shinyServer(function(input, output) {
    model <- lm(sheight ~ fheight, data = father.son)
    
    modelpred <- reactive({
        FHInput <- input$sliderFH
        predict(model, newdata = data.frame(fheight = FHInput))
    })
    output$plot <- renderPlot({
        FHInput <- input$sliderFH
        
        plot(father.son$fheight, father.son$sheight, xlab = "Father's height (inches)", 
             ylab = "Son's height (inches)", bty = "n", pch = 19,
             xlim = c(50, 80), ylim = c(50, 80))
        if(input$showModel){
            abline(model, col = "blue", lwd = 2)
        }
    })
    
    output$pred <- renderText({
        modelpred()
    })
})
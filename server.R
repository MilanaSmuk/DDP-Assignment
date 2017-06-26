library(shiny)
shinyServer(function(input, output) {
        model <- reactive({
                brushed_data <- brushedPoints(cars, input$brush1,
                                              xvar = "speed", yvar = "dist")
                if(nrow(brushed_data) < 2){
                        return(NULL)
                }
                lm(dist ~ speed, data = brushed_data)
        })
        
        output$slopeOut <- renderText({
                if(is.null(model())){
                        "No Model Found"
                } else {
                        model()[[1]][2]
                }
        })
        
        output$intOut <- renderText({
                if(is.null(model())){
                        "No Model Found"
                } else {
                        model()[[1]][1]
                }
        })
        
        output$plot1 <- renderPlot({
                plot(cars$speed, cars$dist, xlab = "Speed in mph",
                     ylab = "Stopping distance in ft", main = "Speed of Cars in 1920s",
                     cex = 1.5, pch = 16, bty = "n")
                if(!is.null(model())){
                        abline(model(), col = "red", lwd = 2)
                }
        })
        
        
})
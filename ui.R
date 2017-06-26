library(shiny)
shinyUI(fluidPage(
        titlePanel("Different Models Visualisation"),
        sidebarLayout(
                sidebarPanel(
                        h3("Slope"),
                        textOutput("slopeOut"),
                        h3("Intercept"),
                        textOutput("intOut"),
                        submitButton("Submit")
                ),
                mainPanel(
                        plotOutput("plot1", brush = brushOpts(
                                id = "brush1"
                        ))
                )
        )
))
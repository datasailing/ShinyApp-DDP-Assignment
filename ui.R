
library(shiny)

## This application predicts the value of the german equity index Dax
## based on the value of the french equity index Cac.


shinyUI(fluidPage(
    
    
    titlePanel("Linear Regression Prediction of Dax from Cac"),
    h1(""),
    h5("Use this app by selecting a value for the Cac equity index
       in the slider below, by using linear regression the Dax equity
       index will be predicted and displayed below the plot."),
    h1(""),
    h5("By default the model fitted line is displayed on the plot, but it 
       can be hidden using the checkbox."),
    h1(""),
    h5("Once the options have been selected hit the Click me! button to recalculate."),
    h1(""),
   
    
    
    sidebarLayout(
        
        sidebarPanel(
            sliderInput("sliderCAC", "Please select value for CAC", 2000, 4000, value = 3000),
            checkboxInput("showModel", "Hide regression line", value = FALSE),
            submitButton("Click me")
        ),
       
      
        
        mainPanel(
            
            tabsetPanel(type = "tabs",
                        tabPanel("Plot", plotOutput("plot1"),
                                 h4("Predicted Dax from linear regression:"),
                                 h3(textOutput("pred")),
                                 h2(),
                                 h5("Disclaimer:"),
                                 h5("This app was created for educational purposes and it
                                    should not be used for investment.")),
                        
                        tabPanel("Summary", h5("Dax summary:"),
                                 verbatimTextOutput("summary1"),
                                 h5("Cac summary:"),
                                 verbatimTextOutput("summary2")),
                        
                        tabPanel("Table", h5("First 50 lines of data"),
                                 tableOutput("table"))
            )
            
            
        )
    )
))



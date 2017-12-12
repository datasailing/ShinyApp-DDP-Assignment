
shinyServer(function(input, output) {
    
    d <- as.data.frame(EuStockMarkets)
    model <- lm(DAX ~ CAC, data = d)
    
    
    modelpred <- reactive({
        cacInput <- input$sliderCAC
        predict(model, newdata = data.frame(CAC = cacInput))
    })
    

    
    
    output$plot1 <- renderPlot({
        cacInput <- input$sliderCAC
        
        plot(d$CAC, d$DAX, xlab = "CAC", 
             ylab = "DAX", bty = "n", pch = 16,
             xlim = c(2000, 4000), ylim = c(1500, 6000))
        if(!input$showModel){
            abline(model, col = "red", lwd = 2)
        }
       
        points(cacInput, modelpred(), col = "red", pch = 16, cex = 3)
    })
    
    output$pred <- renderText({
        round(modelpred(),0)
    })
    
    output$summary1 <- renderPrint({ 
        summary(d$DAX)
    })
    
    output$summary2 <- renderPrint({ 
        summary(d$CAC)
    })
    
    output$table <- renderTable({
        head(d,50)
    })
    
    
})


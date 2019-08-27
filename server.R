#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#


library(shiny) 
library(shinydashboard)
library(ggplot2)
library(ggdark)

DataSet <- as.data.frame(quakes)
cols <- colnames(DataSet)
clrs <- c("#00ceff", "#006bff", "#0300ff", "#d201b0", "#ff0100", "#ffff00")

# Define server logic
shinyServer(function(input, output) {
   
        output$theplot <- renderPlot({
                x_var <- input$varX
                y_var <- input$varY
                smot <- input$smooth
                fact_var <- input$fact
                if(smot=="off"){
                        G <- ggplot(data = DataSet, mapping=aes( x=DataSet[[x_var]], y=DataSet[[y_var]], color=DataSet[[fact_var]] )) +
                                geom_point() + xlab(x_var) + ylab(y_var) + suppressMessages(dark_theme_gray()) +
                                scale_colour_gradientn(colours=clrs) +
                                labs(color = fact_var)
                }else{
                        G <- ggplot(data = DataSet, mapping=aes( x=DataSet[[x_var]], y=DataSet[[y_var]], color=DataSet[[fact_var]] )) +
                                geom_point() + xlab(x_var) + ylab(y_var) + suppressMessages(dark_theme_gray()) +
                                scale_colour_gradientn(colours=clrs) +
                                geom_smooth(color="green", method=smot) +
                                labs(color = fact_var)
                }
                suppressMessages(print(G))
        })
})

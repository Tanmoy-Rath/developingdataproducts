#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#


library(shiny) 
library(shinydashboard)
library(ggplot2)

DataSet <- as.data.frame(quakes)
cols <- colnames(DataSet)

# Define UI for application
shinyUI(dashboardPage(skin = "green",
                      dashboardHeader(title = "quakes dataset"),
                      dashboardSidebar(
                              sidebarMenu(
                                      selectInput("varX", "Choose variable X", size = 4, selectize = FALSE, choices = cols, selected = "long"),
                                      selectInput("varY", "Choose variable Y", size = 4, selectize = FALSE, choices = cols, selected = "lat"),
                                      selectInput("fact", "Choose 'color by'", size = 4, selectize = FALSE, choices = cols, selected = "depth"),
                                      
                                      radioButtons(inputId="smooth", label="Choose Smoother type:",
                                                   choices = c("OFF" = "off",
                                                               "glm" = "glm",
                                                               "loess" = "loess",
                                                               "auto" = "auto"
                                                   ),
                                                   selected = "auto"
                                      )
                              )
                      ),
                      dashboardBody(
                              tabsetPanel(type="pills",
                                          tabPanel("Plot",
                                                   h4("Please see the ",strong("Documentation tab")," first, (next of the Plot tab)"),
                                                   plotOutput("theplot", height="500px")
                                          ),
                                          tabPanel("Documentation",
                                                   h2("App Documentation"),
                                                   h4("The ",strong("Plot tab")," displays a plot on quakes dataset, which can be manipulated by the sidebar controls. The options displayed in the select boxes are the columns in the quakes dataset."),
                                                   fluidRow(
                                                           column(
                                                                   width=3,
                                                                   tags$img(src="x.jpg")
                                                           ),
                                                           column(
                                                                   width=2,
                                                                   h4("Select a column, to plot it as x-axis (default = \"long\").")
                                                           ),
                                                           column(
                                                                   width=1
                                                           ),
                                                           column(
                                                                   width=3,
                                                                   tags$img(src="y.jpg")
                                                           ),
                                                           column(
                                                                   width=2,
                                                                   h4("Select a column, to plot it as y-axis (default = \"lat\").")
                                                           )
                                                   ),br(),
                                                   fluidRow(
                                                           column(
                                                                   width=3,
                                                                   tags$img(src="color.jpg")
                                                           ),
                                                           column(
                                                                   width=2,
                                                                   h4("Select a column, to plot it as color variable (default = \"depth\").")
                                                           ),
                                                           column(
                                                                   width=1
                                                           ),
                                                           column(
                                                                   width=3,
                                                                   tags$img(src="smooth.jpg")
                                                           ),
                                                           column(
                                                                   width=2,
                                                                   h4("Select a type of geom_smooth(), to plot it (default = \"auto\").")
                                                           )
                                                   ),
                                                   br(),
                                                   h4("Begin by clicking on the ",strong("Plot tab")," (as shown below)."),
                                                   tags$img(src="nbi.jpg"),
                                                   HTML("(before the \"Documentation\" tab)"),
                                                   h4("Clicking on the \"Plot\" tab displays the plot (as shown below)."),
                                                   fluidRow(
                                                           tags$img(src="plot.jpg", width="100%")
                                                   )
                                          ),
                                          tabPanel("dataset info",
                                                   h4(em("source: ",strong("https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/quakes.html"))),
                                                   h2("Locations of Earthquakes off Fiji"),
                                                   h3("Description"),
                                                   h4("The data set gives the locations of 1000 seismic events of MB > 4.0. The events occurred in a cube near Fiji since 1964."),
                                                   h3("Format"),
                                                   h4("A data frame with 1000 observations on 5 variables."),
                                                   
                                                   
                                                   h4(  HTML("&nbsp;&nbsp;&nbsp;"),"[,1]",HTML("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"),"lat",HTML("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"),"numeric",HTML("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"),"Latitude of event",
                                                        br(),HTML("&nbsp;&nbsp;&nbsp;"),"[,2]",HTML("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"),"long",HTML("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"),"numeric",HTML("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"),"Longitude",
                                                        br(),HTML("&nbsp;&nbsp;&nbsp;"),"[,3]",HTML("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"),"depth",HTML("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"),"numeric",HTML("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"),"Depth (km)",
                                                        br(),HTML("&nbsp;&nbsp;&nbsp;"),"[,4]",HTML("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"),"mag",HTML("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"),"numeric",HTML("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"),"Richter Magnitude",
                                                        br(),HTML("&nbsp;&nbsp;&nbsp;"),"[,5]",HTML("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"),"stations",HTML("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"),"numeric",HTML("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"),"Number of stations reporting"),
                                                   
                                                   
                                                   
                                                   h3("Details"),
                                                   h4("There are two clear planes of seismic activity. One is a major plate junction; the other is the Tonga trench off New Zealand. These data constitute a subsample from a larger dataset of containing 5000 observations.")
                                          )
                              )
                      )
))

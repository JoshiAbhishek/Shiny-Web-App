
library(shiny)
library(plotly)

shinyUI(
  navbarPage(

    title = 'Iris Species Data Visualization',
    
    tabPanel('Scatterplot',
             sidebarLayout(
               
               sidebarPanel( "Species Scatterplot"
               ),
               
               mainPanel(
                 plotlyOutput("scatter_plot")
               )
             )
    ),
    
    tabPanel('Petal Data',
             sidebarLayout(
               
               sidebarPanel( "Species Petal Lengths and Widths",
                             
                             selectInput("petals", label = h4("Choose species"), 
                                         choices = list("Setosa" = 'setosa_data', 
                                                        "Versicolor" = 'versicolor_data', 
                                                        "Virginica" = 'virginica_data'),
                                         selected = "Setosa"),
                             
                             radioButtons("color", label = h4("Color"),
                                          choices = list("Green" = 'green', "Blue" = 'blue'), 
                                          selected = 'green')
               ),
               
               mainPanel(
                 plotlyOutput("petal_length"),
                 plotlyOutput("petal_width")
               )
             )
    ),
    
    tabPanel('Sepal Data',
             sidebarLayout(
               
               sidebarPanel( "Species Sepal Lengths and Widths",
                             
                             selectInput("sepals", label = h4("Choose species"), 
                                         choices = list("Setosa" = 'setosa_data', 
                                                        "Versicolor" = 'versicolor_data', 
                                                        "Virginica" = 'virginica_data'),
                                         selected = "Setosa"),
                             
                             radioButtons("colors", label = h4("Choose a color"),
                                          choices = list("Blue" = 'Blue', "Red" = 'Red'))
               ),
               
               mainPanel(
                 plotlyOutput("sepal_length"),
                 plotlyOutput("sepal_width")
               )
             )
    )

    
  ))
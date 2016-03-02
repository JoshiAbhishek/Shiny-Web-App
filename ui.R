#Use libraries
library(shiny)
library(plotly)

#Begin Shiny UI
shinyUI(
  #Navbar Page
  navbarPage(

    #App Title
    title = 'Iris Species Data Visualization',
    
    #Scatterplot Tabpanel
    tabPanel('Scatterplot',
             sidebarLayout(
               
               #Sidebar
               sidebarPanel( "Species Scatterplot",
                             
                             #Select species type
                             selectInput("scatter", label = h4("Choose species"), 
                                         choices = list("All" = 'all_data',
                                                        "Setosa" = 'setosa_data', 
                                                        "Versicolor" = 'versicolor_data', 
                                                        "Virginica" = 'virginica_data'),
                                         selected = "All"),
                             
                             #Select scatterplot color
                             radioButtons("color", label = h4("Color"),
                                          choices = list('Set1', 'Set2'), 
                                          selected = 'Set1')
                             
               ),
               
               #Main Panel
               mainPanel(
                 #Plotly output for scatter plot
                 plotlyOutput("scatter_plot")
               )
             )
    ),
    
    #Petal Data Tabpanel
    tabPanel('Petal Data',
             sidebarLayout(
               
               #Sidebar
               sidebarPanel( "Species Petal Lengths and Widths",
                             
                             #Select species type
                             selectInput("petals", label = h4("Choose species"), 
                                         choices = list("Setosa" = 'setosa_data', 
                                                        "Versicolor" = 'versicolor_data', 
                                                        "Virginica" = 'virginica_data'),
                                         selected = "Setosa")
               ),
               
               #Main panel
               mainPanel(
                 #Plotly output for petal box plots
                 plotlyOutput("petal_length"),
                 plotlyOutput("petal_width")
               )
             )
    ),
    
    #Sepal Tabpanel
    tabPanel('Sepal Data',
             sidebarLayout(
               
               #Sidebar
               sidebarPanel( "Species Sepal Lengths and Widths",
                             
                             #Choose Species Type
                             selectInput("sepals", label = h4("Choose species"), 
                                         choices = list("Setosa" = 'setosa_data', 
                                                        "Versicolor" = 'versicolor_data', 
                                                        "Virginica" = 'virginica_data'),
                                         selected = "Setosa")
               ),
               
               #Main panel
               mainPanel(
                 #Plotly output for sepal box plots
                 plotlyOutput("sepal_length"),
                 plotlyOutput("sepal_width")
               )
             )
    )

    
  ))
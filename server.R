#Load libraries
library(plotly)
library(shiny)
library(dplyr)

#Main Data Sets
all_data <- iris
setosa_data <- iris %>% filter(Species == "setosa")
versicolor_data <- iris %>% filter(Species == "versicolor")
virginica_data <- iris %>% filter(Species == "virginica")

#Siny Server
shinyServer(function(input, output) {

  #Petal Length Plotly Box Plot
  output$petal_length <- renderPlotly({

    p <- plot_ly(eval(parse(text = input$petals)), 
                 y = eval(parse(text = "Petal.Length")), type = "box") %>% 

      layout(yaxis = list(title = "Petal Length"))
  })
  
  #Petal Width Plotly Box Plot
  output$petal_width <- renderPlotly({
    
    p <- plot_ly(eval(parse(text = input$petals)), 
                 y = eval(parse(text = "Petal.Width")),type = "box") %>% 
      
      layout(yaxis = list(title = "Petal Width"))
  })
  
  #Sepal Length Plotly Box Plot
  output$sepal_length <- renderPlotly({

    p <- plot_ly(eval(parse(text = input$sepals)), 
                 y = eval(parse(text = "Sepal.Length")),type = "box") %>% 

      layout(yaxis = list(title = "Sepal Length"))
  })
  
  #Speal Width Plotly Box Plot
  output$sepal_width <- renderPlotly({
    
    p <- plot_ly(eval(parse(text = input$sepals)), 
                 y = eval(parse(text = "Sepal.Width")),type = "box") %>% 
      
      layout(yaxis = list(title = "Sepal Width"))
  })
  
  #Plotly Scatter Plot
  output$scatter_plot <- renderPlotly({
    p <- plot_ly(
      data = eval(parse(text = input$scatter)),
      x = Sepal.Length,
      y = Petal.Length,
      mode = "markers",
      color = Species,
      colors = input$color #Chosen color from Shiny UI input
    )
  })
  
})



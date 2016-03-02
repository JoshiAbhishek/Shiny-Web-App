
library(plotly)
library(shiny)
library(dplyr)


setosa_data <- iris %>% filter(Species == "setosa")
versicolor_data <- iris %>% filter(Species == "versicolor")
virginica_data <- iris %>% filter(Species == "virginica")

shinyServer(function(input, output) {

  output$petal_length <- renderPlotly({

    p <- plot_ly(eval(parse(text = input$petals)), 
                 y = eval(parse(text = "Petal.Length")), type = "box") %>% 

      layout(yaxis = list(title = "Petal Length"))
  })
  
  output$petal_width <- renderPlotly({
    
    p <- plot_ly(eval(parse(text = input$petals)), 
                 y = eval(parse(text = "Petal.Width")),type = "box") %>% 
      
      layout(yaxis = list(title = "Petal Width"))
  })
  
  output$sepal_length <- renderPlotly({

    p <- plot_ly(eval(parse(text = input$sepals)), 
                 y = eval(parse(text = "Sepal.Length")),type = "box") %>% 

      layout(yaxis = list(title = "Sepal Length"))
  })
  
  output$sepal_width <- renderPlotly({
    
    p <- plot_ly(eval(parse(text = input$sepals)), 
                 y = eval(parse(text = "Sepal.Width")),type = "box") %>% 
      
      layout(yaxis = list(title = "Sepal Width"))
  })
  
  output$scatter_plot <- renderPlotly({
    p <- plot_ly(
      data = iris,
      x = Sepal.Length,
      y = Petal.Length,
      mode = "markers",
      color = Species,
      colors = "Set1"
    )
  })
  
})



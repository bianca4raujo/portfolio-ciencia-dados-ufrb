# PROJETO 4 - DASHBOARD SHINY SIMPLES

library(shiny)


ui <- fluidPage(
  
  # Título
  titlePanel("Dashboard Educacional"),
  
  # Layout 
  sidebarLayout(
    
    # Controles
    sidebarPanel(
      h4("Controles"),
      sliderInput("horas", "Horas de Estudo:", 1, 30, 15),
      actionButton("btn", "Atualizar")
    ),
    
    # Gráfico
    mainPanel(
      h4("Gráfico"),
      plotOutput("grafico"),
      h4("Estatísticas"),
      verbatimTextOutput("stats")
    )
  )
)

# Lógica 
server <- function(input, output) {
  
  # Dados
  dados <- reactive({
    data.frame(
      horas = rnorm(50, input$horas, 5),
      nota = 5 + 0.3 * rnorm(50, input$horas, 5)
    )
  })
  
  # Gráfico
  output$grafico <- renderPlot({
    df <- dados()
    plot(df$horas, df$nota, main = "Horas vs Nota", 
         xlab = "Horas", ylab = "Nota", col = "blue")
  })
  
  # Estatísticas
  output$stats <- renderPrint({
    df <- dados()
    cat("Média horas:", round(mean(df$horas), 2), "\n")
    cat("Média notas:", round(mean(df$nota), 2), "\n")
  })
}

shinyApp(ui = ui, server = server)


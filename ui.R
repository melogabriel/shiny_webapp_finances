library(shiny)
library(quantmod)
source("server.R")
library(readxl)
YahooTickersBrazil <- read_excel("YahooTickersBrazil.xlsx")

ui <- fluidPage(
  titlePanel("WebApp Ativos Brasil"),
  sidebarLayout(
    sidebarPanel(
      helpText("Selecione o ativo que deseja analisar. A informação será coletada do Yahoo Finanças."),
      selectInput("symb", 
                  label = "Symbol", 
                  choices = unique(YahooTickersBrazil$Symbol),
                  selected = "PETR4.SA"),
      
      dateRangeInput("dates",
                     "Date range",
                     start = "2020-01-01",
                     end = as.character(Sys.Date())),
      HTML("
        <h6>Autor: <a href='https://github.com/melogabriel' target='_blank'>github.com/melogabriel</a></h6>
        <h6>e-mail: <a href='mailto:gabriel-melo@outlook.com'>gabriel-melo@outlook.com</a></h6>
      ")
    ),
    
    mainPanel(plotOutput("plot"))
  )
)

# Run the app
shinyApp(ui, server)







# WebApp Ativos Brasil

This is a Shiny web application that allows you to analyze stock data for Brazilian assets. The application retrieves data from Yahoo Finance and provides interactive charts for the selected asset.

## Dependencies

The following packages are required to run the application:

- shiny
- quantmod
- readxl

Make sure to install these packages before running the application.

## Installation

1. Clone the repository or download the code files.

2. Ensure that the required dependencies are installed.

3. Run the following code in R to launch the application:

```R
library(shiny)
library(quantmod)
library(readxl)
source("server.R")

# Load the stock ticker data
YahooTickersBrazil <- read_excel("YahooTickersBrazil.xlsx")

# Define the user interface (UI)
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
```

## Usage

- Select the desired asset from the dropdown list.
- Specify the date range for the data.
- The application will retrieve the stock data and display an interactive chart.

## Author

- Gabriel Melo
- Email: gabriel-melo@outlook.com

Feel free to contact the author for any questions or feedback.

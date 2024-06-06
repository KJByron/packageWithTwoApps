#' toy app from mastering shiny, chap 1
#' @param ...  options passed to \code{shinyApp}.
#' @import shiny
#' @export
data_app <- function(...) {

  ui <- ui <- fluidPage(
    selectInput("dataset", label = "Dataset",
      choices = ls("package:datasets")),
    verbatimTextOutput("summary"),
    tableOutput("table")
  )

  server <- function(input, output, session) {
    output$summary <- renderPrint({
      dataset <- get(input$dataset, "package:datasets")
      summary(dataset)
    })

    output$table <- renderTable({
      dataset <- get(input$dataset, "package:datasets")
      dataset
    })
  }

  shinyApp(ui, server, ...)
}


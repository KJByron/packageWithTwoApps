#' toy app from mastering shiny, chap 20
#' @param ...  options pass to \code{shinyApp}.
#' @import shiny
#' @export
month_app <- function(...) {
  options(shiny.sanitize.errors = FALSE)
  addResourcePath(prefix = "www", directoryPath = system.file("www",
      package = "packageWithTwoApps"))

  months <- c(
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
  )
  stone_df <- data.frame(
    month	= months,
    stone = c(
      "garnet", "amethyst", "aquamarine", "diamond", "emerald", "perl",
      "ruby", "peridot", "sapphire", "opal", "topaz", "tanzanite")
  )

  ui <- navbarPage(
    title = tags$div(
      shiny::img(src = "www/BD_2-Color_RGB.png", height = 80, width = 146),
      "Sample app"
    ),
    tabPanel("Pick a month",
      selectInput("month", "What's your favourite month?",
        choices = months)
    ),
    tabPanel("Feedback", month_feedback_ui("tab1")),
    tabPanel("Birthstone", birthstone_ui("tab2"))
  )

  server <- function(input, output, session) {
    month_feedback_server("tab1", month = reactive(input$month))
    month_birthstone_server("tab2", month = reactive(input$month),
      stone_df = stone_df)
  }

  shinyApp(ui, server, ...)
}


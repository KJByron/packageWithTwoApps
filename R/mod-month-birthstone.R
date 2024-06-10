#' UI for birthstone
#'
#' @param id  UI id
#'
#' @return  html and text string with birthstone summary
#' @export
birthstone_ui <- function(id) {
  p(
    "The birthstone for ", textOutput(NS(id, "month"), inline = TRUE),
    " is ", textOutput(NS(id, "stone"), inline = TRUE)
  )
}


#' server function for birthstone
#'
#' @param id  server id
#' @param month  a vector of month names
#' @param stone_df  a data frame with a column for month and a column for stone
#'
#' @return outputs for month and stone based on input
#' @export
month_birthstone_server <- function(id, month, stone_df) {
  stopifnot(is.reactive(month))

  moduleServer(id, function(input, output, session) {
    stone <- reactive(stone_df$stone[stone_df$month == month()])
    output$month <- renderText(month())
    output$stone <- renderText(stone())
  })
}

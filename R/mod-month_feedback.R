#' UI for month
#'
#' @param id  ID
#'
#' @return  html for feedback string
#' @export
month_feedback_ui <- function(id) {
  textOutput(NS(id, "feedback"))
}


#' serve for month
#'
#' @param id  ID
#' @param month  unit character vector with chosen month
#'
#' @return  string with month feedback
#' @export
month_feedback_server <- function(id, month) {
  stopifnot(is.reactive(month))

  moduleServer(id, function(input, output, session) {
    output$feedback <- renderText({
      if (month() == "October") {
        "You picked a great month!"
      } else {
        "Eh, you could do better."
      }
    })
  })
}

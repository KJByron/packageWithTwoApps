#' UI for month
#'
#' @param id  ID
#'
#' @return  html for feedback string for a given month
#' @export
#' 
#' @examples
#' \dontrun{
#'   pos_feedback_demo <- function() {
#'     ui <- fluidPage(month_feedback_ui("x"))
#'     server <- function(input, output, session) {
#'       month_feedback_server("x", month = reactive("October"))
#'     }
#'   shinyApp(ui, server)
#'   }
#'   pos_feedback_demo()
#'   
#'   neg_feedback_demo <- function() {
#'     ui <- fluidPage(month_feedback_ui("x"))
#'     server <- function(input, output, session) {
#'       month_feedback_server("x", month = reactive("April"))
#'     }
#'   shinyApp(ui, server)
#'   }
#'   neg_feedback_demo()
#' }
month_feedback_ui <- function(id) {
  textOutput(NS(id, "feedback"))
}

#' server for month
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

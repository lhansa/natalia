#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  mod_suggest_illness_server("entrada_paciente_1")
  mod_show_illnesses_server("select_symptom_1")
  mod_show_treat_server("show_treat_1")
}

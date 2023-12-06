#' select_symptom UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList selectInput
mod_select_symptom_ui <- function(id){
  ns <- NS(id)
  tagList(
        selectInput(
          ns("sintoma"),
          label = "Selecciona síntoma",
          choices = natalia:::eess$Sintomat$Sintoma,
          multiple = TRUE
        )
  )
}

#' select_symptom Server Functions
#'
#' @noRd
mod_select_symptom_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_select_symptom_ui("select_symptom_1")

## To be copied in the server
# mod_select_symptom_server("select_symptom_1")

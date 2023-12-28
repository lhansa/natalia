#' select_illness UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_select_illness_ui <- function(id){
  ns <- NS(id)
  tagList(
        selectInput(
          ns("enfermedad"),
          label = "Selecciona enfermedad",
          choices = natalia:::eess$Enfermedades$NombEnferm1,
          multiple = FALSE
        )
  )
}

#' select_illness Server Functions
#'
#' @noRd
mod_select_illness_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_select_illness_ui("select_illness_1")

## To be copied in the server
# mod_select_illness_server("select_illness_1")

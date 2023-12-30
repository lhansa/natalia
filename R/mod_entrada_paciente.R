#' entrada_paciente UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#'
#' @importFrom shiny NS tagList selectInput h2
#' @importFrom bs4Dash column
mod_entrada_paciente_ui <- function(id){
  ns <- NS(id)

  tagList(
    fluidRow(
      bs4Dash::column(6,
        selectInput(
          ns("sexo"),
          label = "Sexo",
          choices = get_values("Sexo")
        ),
        selectInput(
          ns("raza"),
          label = "Raza",
          choices = get_values("Raza")
        )
      ),
      bs4Dash::column(6,
        selectInput(
          ns("edad"),
          label = "Edad",
          choices = get_values("Edad")
        ),
        selectInput(
          ns("peso"),
          label = "Peso",
          choices = get_values("Peso")
        )

      )
    )
  )
}

#' entrada_paciente Server Functions
#'
#' @noRd
mod_entrada_paciente_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_entrada_paciente_ui("entrada_paciente_1")

## To be copied in the server
# mod_entrada_paciente_server("entrada_paciente_1")

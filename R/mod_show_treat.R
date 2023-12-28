#' show_treat UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_show_treat_ui <- function(id){
  ns <- NS(id)
  tagList(
    uiOutput(ns("table_treat"))
  )
}

#' show_treat Server Functions
#'
#' @noRd
mod_show_treat_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$table_treat <- renderUI({
      if (is.null(input$enfermedad)) {
        df_tratamientos_validos <- data.frame()
      } else {
        # Get codEnf from eess$Enfermedades where NombEnferm1 == input$enfermedad
        cod_enfermedad <- natalia:::eess$Enfermedades$codigoEnf[
          natalia:::eess$Enfermedades$NombEnferm1 == input$enfermedad
        ]

        df_tratamientos_validos <- subset(
          natalia:::tt$TTTmedico,
          codigoEnf == cod_enfermedad,
          select = c(TTT.medico, Dosis)
        )

      }

      bs4Dash::bs4Table(
        cardWrap = TRUE,
        bordered = TRUE,
        striped = TRUE,
        df_tratamientos_validos
      )
    })

  })
}

## To be copied in the UI
# mod_show_treat_ui("show_treat_1")

## To be copied in the server
# mod_show_treat_server("show_treat_1")

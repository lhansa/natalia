#' show_illnesses UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom bs4Dash bs4Table
mod_show_illnesses_ui <- function(id){
  ns <- NS(id)
  tagList(
    uiOutput(ns("table_illnesses"))
  )
}

#' show_illnesses Server Functions
#'
#' @noRd
mod_show_illnesses_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$table_illnesses <- renderUI({
      if (is.null(input$sintoma)) {
        df_con_enfermedades <- data.frame()
      } else {
        df_con_enfermedades <- subset(
          natalia:::eess$Sintomat,
          Sintoma %in% input$sintoma
        )

        df_con_enfermedades <- subset(
          natalia:::eess$Enfermedades,
          subset = codigoEnf %in% df_con_enfermedades$codigoEnf,
          select = c(NombEnferm1, NombEnferm2, Frecuencia)
        )

      }

      bs4Dash::bs4Table(
        cardWrap = TRUE,
        bordered = TRUE,
        striped = TRUE,
        df_con_enfermedades
      )
    })

  })
}

## To be copied in the UI
# mod_show_illnesses_ui("show_illnesses_1")

## To be copied in the server
# mod_show_illnesses_server("show_illnesses_1")

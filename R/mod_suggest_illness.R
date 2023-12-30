#' suggest_illness UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList renderUI fluidRow
#' @importFrom bs4Dash actionButton
mod_suggest_illness_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      bs4Dash::actionButton(
        ns("suggest"),
        label = "¿Qué tiene?",
        status = "primary"
      )
    ),
    fluidRow(
      uiOutput(ns("table_illnesses"))
    )

  )
}

#' suggest_illness Server Functions
#'
#' @noRd
mod_suggest_illness_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    observeEvent(input$suggest, {

      output$table_illnesses <- renderUI({
        df_subset <- natalia:::eess$Predisp
        if(input$sexo != "NA") {
          df_subset <- subset(
            df_subset,
            subset = TipoPredisposicion == "Sexo" & Predisposicion == input$sexo
          )
        }
        if(input$raza != "NA") {
          df_subset <- subset(
            df_subset,
            subset = TipoPredisposicion == "Raza" & Predisposicion == input$raza
          )
        }
        if(input$edad != "NA") {
          df_subset <- subset(
            df_subset,
            subset = TipoPredisposicion == "Edad" & Predisposicion == input$edad
          )
        }
        if(input$peso != "NA") {
          df_subset <- subset(
            df_subset,
            subset = TipoPredisposicion == "Peso" & Predisposicion == input$peso
          )
        }
        bs4Dash::bs4Table(
          cardWrap = TRUE,
          bordered = TRUE,
          striped = TRUE,
          df_subset
        )

      })

    })


  })
}

## To be copied in the UI
# mod_suggest_illness_ui("suggest_illness_1")

## To be copied in the server
# mod_suggest_illness_server("suggest_illness_1")

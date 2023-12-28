#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom bs4Dash dashboardPage
#' @importFrom bs4Dash dashboardHeader
#' @importFrom bs4Dash dashboardBrand
#' @importFrom bs4Dash dashboardSidebar
#' @importFrom bs4Dash dashboardBody
#' @importFrom bs4Dash getAdminLTEColors
#' @importFrom bs4Dash box
#' @importFrom bs4Dash dashboardControlbar
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    # fluidPage(
    #   h1("natalia")
    # )
    dashboardPage(
      header = bs4Dash::dashboardHeader(
        title = bs4Dash::dashboardBrand(
          title = "My dashboard",
          color = "primary",
          href = "https://adminlte.io/themes/v3",
          image = "https://adminlte.io/themes/v3/dist/img/AdminLTELogo.png"
        )
      ),
      sidebar = bs4Dash::dashboardSidebar(
        bs4Dash::menuItem(
          text = "Síntomas",
          tabName = "symptoms"
        ),
        bs4Dash::menuItem(
          text = "Tratamientos",
          tabName = "treatments"
        )

      ),
      body = bs4Dash::dashboardBody(
        bs4Dash::tabItems(
          bs4Dash::tabItem(
            tabName = "symptoms",
            box(
              mod_select_symptom_ui("select_symptom_1"),
              collapsible = TRUE
            ),

            mod_show_illnesses_ui("select_symptom_1")

          ),
          bs4Dash::tabItem(
            tabName = "treatments",
            box(
              mod_select_symptom_ui("select_illness_1"),
              collapsible = TRUE
            ),

            mod_show_treat_ui("select_illness_1")
          )
        )


        # lapply(bs4Dash::getAdminLTEColors(), function(color) {
        #   bs4Dash::box(status = color)
        # })
      ),
      controlbar = bs4Dash::dashboardControlbar(),
      title = "Natalia"
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "natalia"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}

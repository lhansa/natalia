#' Get Values from Data
#'
#' These functions extract sets of possible values for
#' columns within the data
#'
#' @param case Which case you want extract data from?
#' @param include_na Should NA be an option? `TRUE` by default
#'
#' @export
#'
get_values <- function(case, include_na = TRUE) {
  which_ones <- eess$Predisp$TipoPredisposicion == case
  values <- unique(eess$Predisp$Predisposicion[which_ones])

  if (include_na) values <- c(NA, values)

  return(values)
}

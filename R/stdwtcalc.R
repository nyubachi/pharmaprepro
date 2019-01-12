#' Calculate standard weight
#'
#' @param height Unit is centimeter
#'
#' @export
#'
stdwtcalc <- function(height) {
  round((height / 100)^2 * 22, digits = 2)
}

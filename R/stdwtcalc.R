#' Calculate standard weight
#'
#' @param height Unit is centimeter
#' @param weight Unit is kilogram
#'
#' @export
#'
stdwtcalc <- function(height, weight) {
  round((height / 100)^2 * 22, digits = 2)
}

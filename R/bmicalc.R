#' Calculate body mass index
#'
#' @param height Unit is centimeter
#' @param weight Unit is kilogram
#'
#' @export
#'
bmicalc <- function(height, weight) {
  round(weight / (height / 100)^2, digits = 2)
}

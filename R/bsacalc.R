#' Calculate body surface area
#'
#' @param height Unit is centimeter
#' @param weight Unit is kilogram
#' @param formula 1:DuBois 2:Shintani 3:Fujimoto
#'
#' @export
#'
bsacalc <- function(height, weight, formula = 1) {
  if (formula == 1) {
    # DuBois
    bsa <- height^0.725 * weight^0.425 * 0.007184
  } else if (formula == 2) {
    # Shintani
    bsa <- height^0.725 * weight^0.425 * 0.007358
  } else if (formula == 3) {
    # Fujimoto
    bsa <- height^0.663 * weight^0.444 * 0.008883
  }

  return(round(bsa, digits = 2))
}

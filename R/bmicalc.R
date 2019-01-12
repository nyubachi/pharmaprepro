bmicalc <- function(height, weight) {
  round(weight / (height / 100)^2, digits = 2)
}

#' Calculate the age of the target day
#'
#' @param target_day Date for calculating age
#' @param birthday For example "1965/09/13"
#'
#' @importFrom lubridate ymd
#' @importFrom lubridate interval
#' @importFrom lubridate years
#'
#' @export
#'
agecalc <- function(target_day, birthday) {
  target_day <- lubridate::ymd(target_day)
  birthday <- lubridate::ymd(birthday)

  time_interval <- lubridate::interval(birthday, target_day)
  pre_age <- time_interval / lubridate::years(1)
  age <- trunc(pre_age)

  return(age)
}

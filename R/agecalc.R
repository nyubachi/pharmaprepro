#' Calculate the age of the target day
#'
#' @param birthday For example "1965/09/13" or "1965.09.13" or "1965-09-13"
#' @param target_day Date for calculating age. If you omit the argument, today is entered.
#'
#' @importFrom lubridate today
#' @importFrom lubridate ymd
#' @importFrom lubridate interval
#' @importFrom lubridate years
#'
#' @export
#'
agecalc <- function(birthday, target_day = today()) {
  birthday <- ymd(birthday)
  target_day <- ymd(target_day)

  time_interval <- interval(birthday, target_day)
  pre_age <- time_interval / years(1)
  age <- trunc(pre_age)

  return(age)
}

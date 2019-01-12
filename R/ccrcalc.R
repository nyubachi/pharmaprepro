#' Calculate creatinine clearance
#'
#' @param age Age of the subject
#' @param weight Unit is kilogram
#' @param scr Serum creatinine value. Unit is mg/dL.
#' @param gender female or male
#' @param correction When the value is 1, if scr is less than 0.6, scr is rounded up to 0.6. If the value is 0, it will not be rounded up. The default value is 1.
#'
#' @export
#'
ccrcalc <- function(age, weight, scr, gender, correction = 1) {
  # 性別の論理型ベクトルを作成
  female <- gender == "female"
  male <- gender == "male"

  # scrが0.6未満か否かの論理型ベクトルを作成
  scr_less_than_0.6 <- scr < 0.6

  # correction引数が1の場合は血清クレアチニン値を0.6補正する
  if (correction == 1) {
    scr[scr_less_than_0.6] <- 0.6
  }

  # ベースのccrを計算
  ccr_base <- (140 - age) * weight / (72 * scr)

  # ccrの空ベクトルを作成
  ccr <- rep(0, length(ccr_base))

  # 女性の場合はベースのccrを0.85倍する。
  ccr[female] <- 0.85 * ccr_base[female]
  ccr[male] <- ccr_base[male]

  return(round(ccr, digits = 2))
}

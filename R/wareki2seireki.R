wareki2seireki <- function(x) {
  # stringrライブラリの読み込み
  library(stringr)

  # 和暦の.を/に変換
  x2 <- str_replace_all(x, pattern="\\.", replacement="/")

  # 年号のアルファベットを取得
  nengo <- as.character(str_sub(x2, start=1, end=1))

  # 和暦の年数を取得
  wareki_year <- as.numeric(str_sub(x2, start=2, end=3))

  # 月日の数字を取得
  month_day <- str_sub(x2, start=4, end=9)

  # 西暦用の空ベクトルを作る
  seireki_year <- rep(0, length(x))
  seireki <- rep(0, length(x))

  # 論理型ベクトルを作成
  meiji <- nengo == "M"
  taisho <- nengo == "T"
  showa <- nengo == "S"
  heisei <- nengo == "H"

  # ベクトル演算で和暦の年を西暦の年に変換
  seireki_year[meiji] <- as.character(wareki_year[meiji] + 1867)
  seireki_year[taisho] <- as.character(wareki_year[taisho] + 1911)
  seireki_year[showa] <- as.character(wareki_year[showa] + 1925)
  seireki_year[heisei] <- as.character(wareki_year[heisei] + 1988)

  # 年と月日を結合
  seireki <- str_c(seireki_year, month_day, sep = "")
}

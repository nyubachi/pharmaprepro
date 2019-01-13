
<!-- README.md is generated from README.Rmd. Please edit that file -->

# pharmaprepro

This package is for medical staff such as pharmacists to use for
preprocessing clinical data.

## Installation

You can install the released version of pharmaprepro from
[GitHub](https://github.com/nyubachi/pharmaprepro) with:

``` r
install.packages("devtools")
require(devtools)
install_github("nyubachi/pharmaprepro")
```

## Example

``` r
# loading package
library(pharmaprepro)
```

``` r
# test data
x <- data.frame(age = c(109, 98, 72, 25),
                height = c(161.5, 182.5, 170.1, 155.4),
                weight = c(55.2, 70.2, 60.5, 54.8),
                scr = c(0.4, 0.9, 1.1, 0.5),
                gender = c("female", "male", "male", "female"),
                birthday = c("M43.09.12", "T10.11.05", "S22/03/31", "H06-12-29"),
                target_day = c("1990/06/10", "2010/04/22", "2018/12/03", "2015/10/03"))
```

### agecalc

Calculate the age on a specific date.

``` r
# Convert birthday from Japanese calendar to Christian calendar year.
birthday <- wareki2seireki(x$birthday)
```

``` r
# Calculate age from birthday and target date.
agecalc(birthday, x$target_day)
#> [1] 79 88 71 20
```

``` r
# If the second argument is omitted, today is entered.
agecalc(birthday)
#> [1] 108  97  71  24
```

### bmicalc

Calculate the body mass index from height and weight data.

``` r
bmicalc(x$height, x$weight)
#> [1] 21.16 21.08 20.91 22.69
```

### bsacalc

Calculate the body surface area from height and weight data.

``` r
# If the third argument is 1 (default), using the DuBois formula.
bsacalc(x$height, x$weight, 1)
#> [1] 1.58 1.91 1.70 1.53
```

``` r
# If the third argument is 2, using the Shintani formula.
bsacalc(x$height, x$weight, 2)
#> [1] 1.61 1.95 1.74 1.57
```

``` r
# If the third argument is 3, using the Fujimoto formula.
bsacalc(x$height, x$weight, 3)
#> [1] 1.53 1.85 1.65 1.49
```

### ccrcalc

Calculate creatinine
clearance.

``` r
# When the fifth argument is 1 (default), if scr is less than 0.6, it rounds up to 0.6.
ccrcalc(x$age, x$weight, x$scr, x$gender, 1)
#> [1]  33.67  45.50  51.94 124.00
```

``` r
# If the fifth argument is 0, scr is not corrected.
ccrcalc(x$age, x$weight, x$scr, x$gender, 0)
#> [1]  50.50  45.50  51.94 148.80
```

### stdwtcalc

Calculate standard weight from height data.

``` r
stdwtcalc(x$height)
#> [1] 57.38 73.27 63.65 53.13
```

### wareki2seireki

Convert Japanese calendar to Christian calendar.

``` r
wareki2seireki(x$birthday)
#> [1] "1910-09-12" "1921-11-05" "1947-03-31" "1994-12-29"
```

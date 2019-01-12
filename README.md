
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
x <- data.frame(age = c(109, 98, 47, 25),
                height = c(161.6, 182.5, 170.1, 155.4),
                weight = c(55.2, 70.2, 60.5, 54.8),
                scr = c(0.8, 1.2, 0.4, 0.5),
                gender = c("female", "male", "male", "female"),
                birthday = c("M43.09.12", "T10.11.05", "S47.03.31", "H06.12.29"))
```

### bmicalc

``` r
bmicalc(x$height, x$weight)
#> [1] 21.14 21.08 20.91 22.69
```

### ccrcalc

If scr is less than 0.6, it rounds up to 0.6.

``` r
ccrcalc(x$age, x$weight, x$scr, x$gender, 1)
#> [1]  25.25208  34.12500 130.24306 123.99769
```

No scr correction.

``` r
ccrcalc(x$age, x$weight, x$scr, x$gender, 0)
#> [1]  25.25208  34.12500 195.36458 148.79722
```

### stdwtcalc

``` r
stdwtcalc(x$height)
#> [1] 57.45 73.27 63.65 53.13
```

### wareki2seireki

``` r
wareki2seireki(x$birthday)
#> [1] "1910/09/12" "1921/11/05" "1972/03/31" "1994/12/29"
```

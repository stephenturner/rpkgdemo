
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rpkgdemo <a href='https://github.com/stephenturner/rpkgdemo'><img src='man/figures/logo.png' align="right" height="200" /></a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/stephenturner/rpkgdemo/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/stephenturner/rpkgdemo/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

This rpkgdemo package serves as a demonstration of how to structure an R
package. View the full tutorial in the vignette: `vignette("rpkgdemo")`.

To follow along the full tutorial you’ll need the following packages
installed:

``` r
install.packages(c(
  "devtools",
  "usethis",
  "roxygen2",
  "testthat",
  "knitr",
  "rmarkdown",
  "pkgdown",
  "available",
  "dplyr",
  "janitor",
  "readxl",
  "stringr"
))
```

## Installation

To install rpkgdemo, run:

``` r
devtools::install_github("stephenturner/rpkgdemo")
```

## Example

First, let’s load the package:

``` r
library(rpkgdemo)
```

Standardize sex variables:

``` r
standardize_sex(c("Male", "f", "Trans female", "nonbinary", "unknown", NA))
#> [1] "M" "F" "O" "O" "U" "U"
```

Read in some laboratory data:

``` r
fp <- system.file("extdata/rped.csv", package = "rpkgdemo", mustWork = TRUE)
labdat <- read_labdata(fp)
labdat
#> # A tibble: 1,000 × 6
#>       id sex          age zip    lab1  lab2
#>    <dbl> <chr>      <int> <chr> <dbl> <dbl>
#>  1     1 male          26 12345     4    13
#>  2     2 trans male    12 20108     2    12
#>  3     3 unk          130 20108     1     8
#>  4     4 unk           26 20109     1    13
#>  5     5 F             38 20109     5    13
#>  6     6 female        25 20109     0    15
#>  7     7 M             49 20110     6    12
#>  8     8 M             55 20111     4    10
#>  9     9 unk           55 20111     7     7
#> 10    10 F             30 20112     3    12
#> # ℹ 990 more rows
```

Prepare that data for analysis by annotating with city and state using
the zip code, standardizing sex, and normalizing lab values:

``` r
prep_lab_data(labdat)
#> Warning in prep_lab_data(labdat): Found 1 bad zip code(s).
#> Warning in prep_lab_data(labdat): Found 1 minor(s) in dataset.
#> Warning in prep_lab_data(labdat): Found 1 unrealistic age(s) in dataset.
#> # A tibble: 1,000 × 8
#>       id sex     age zip      lab1     lab2 city     state
#>    <dbl> <chr> <int> <chr>   <dbl>    <dbl> <chr>    <chr>
#>  1     1 M        26 12345  1.48    0.930   <NA>     <NA> 
#>  2     2 O        12 20108  0.0623  0.620   Manassas VA   
#>  3     3 U       130 20108 -0.646  -0.623   Manassas VA   
#>  4     4 U        26 20109 -0.646   0.930   Manassas VA   
#>  5     5 F        38 20109  2.19    0.930   Manassas VA   
#>  6     6 F        25 20109 -1.35    1.55    Manassas VA   
#>  7     7 M        49 20110  2.90    0.620   Manassas VA   
#>  8     8 M        55 20111  1.48   -0.00155 Manassas VA   
#>  9     9 U        55 20111  3.60   -0.933   Manassas VA   
#> 10    10 F        30 20112  0.771   0.620   Manassas VA   
#> # ℹ 990 more rows
```

View the full tutorial in the vignette: `vignette("rpkgdemo")`.

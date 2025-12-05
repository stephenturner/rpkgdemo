# Prepare lab data

Prepare lab data for analysis. Standardizes the `sex` variable, joins
with `zipcodes` data, centers and scales lab values.

## Usage

``` r
prep_lab_data(x, warnings = TRUE)
```

## Arguments

- x:

  A data frame containing lab data with at least `sex`, `zip`, and lab
  value columns starting with "lab".

- warnings:

  Logical. Whether to issue warnings for potential data issues (bad zip
  codes, minors, unrealistic ages). Default is `TRUE`.

## Value

A data frame with standardized `sex`, joined `zipcodes`, and scaled lab
values.

## Examples

``` r
prep_lab_data(rped)
#> Warning: Found 1 bad zip code(s).
#> Warning: Found 1 minor(s) in dataset.
#> Warning: Found 1 unrealistic age(s) in dataset.
#> # A tibble: 1,000 × 8
#>       id sex     age zip      lab1     lab2 city     state
#>    <int> <chr> <dbl> <chr>   <dbl>    <dbl> <chr>    <chr>
#>  1     1 M        26 12345  1.48    0.930   NA       NA   
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

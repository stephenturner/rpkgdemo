# Suppress Low Counts for Privacy

Replaces numeric counts below a threshold with a suppression character
(`NA`).

## Usage

``` r
suppress_counts(x, threshold = 5, symbol = NA)
```

## Arguments

- x:

  A numeric vector of counts.

- threshold:

  Numeric. Values strictly less than this are suppressed. Default 5.

- symbol:

  Character or `NA`. The symbol to use for suppression. Default is `NA`.

## Value

A vector.

## Examples

``` r
suppress_counts(c(1, 3, 5, 7, 9))
#> [1] NA NA  5  7  9
suppress_counts(c(10, 20, 3, 4, 5), threshold = 10)
#> [1] 10 20 NA NA NA
suppress_counts(1:10, threshold = 5, symbol = "*")
#>  [1] "*"  "*"  "*"  "*"  "5"  "6"  "7"  "8"  "9"  "10"
```

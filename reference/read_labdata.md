# Read laboratory data

Read laboratory data from a file

## Usage

``` r
read_labdata(file)
```

## Arguments

- file:

  A file path

## Value

A data frame

## Examples

``` r
fp <- system.file("extdata/rped.csv", package = "rpkgdemo", mustWork = TRUE)
read_labdata(fp)
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

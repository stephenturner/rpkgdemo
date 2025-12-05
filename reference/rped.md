# RPED: R Package Example Data

Simulated data for demonstrating the functionality of the rpkgdemo
package.

## Usage

``` r
rped
```

## Format

A data frame with 6 columns:

1.  `id`: A unique identifier for each individual.

2.  `sex`: The sex of the individual.

3.  `age`: The age of the individual.

4.  `zip`: The ZIP code of the individual's residence.

5.  `lab1`: A simulated lab value from a Poisson distribution with
    lambda=2.

6.  `lab2`: A simulated lab value from a Poisson distribution with
    lambda=10.

## Examples

``` r
rped
#> # A tibble: 1,000 × 6
#>       id sex          age zip    lab1  lab2
#>    <int> <chr>      <dbl> <chr> <int> <int>
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

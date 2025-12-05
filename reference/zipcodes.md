# ZIP code data

ZIP code data from the US Postal Service.

## Usage

``` r
zipcodes
```

## Format

A data frame with three columns

1.  `zip`: The ZIP code.

2.  `city`: The U.S. city for that zip code.

3.  `state`: The U.S. state for that zip code.

## Source

<https://postalpro.usps.com/ZIP_Locale_Detail>

## Examples

``` r
zipcodes
#> # A tibble: 37,961 × 3
#>    zip   city      state
#>    <chr> <chr>     <chr>
#>  1 00601 Adjuntas  PR   
#>  2 00602 Aguada    PR   
#>  3 00603 Aguadilla PR   
#>  4 00604 Aguadilla PR   
#>  5 00605 Aguadilla PR   
#>  6 00606 Maricao   PR   
#>  7 00610 Anasco    PR   
#>  8 00611 Angeles   PR   
#>  9 00612 Arecibo   PR   
#> 10 00613 Arecibo   PR   
#> # ℹ 37,951 more rows
```

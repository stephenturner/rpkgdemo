# Standardize Sex Variables

Maps various inputs (M, Male, f, Female) to standard HL7/ISO codes (M,
F, O, U).

## Usage

``` r
standardize_sex(x)
```

## Arguments

- x:

  A character vector of sex/gender inputs.

## Value

A character vector containing "M", "F", "O", or "U".

## Examples

``` r
standardize_sex(c("Male", "f", "Trans female", "nonbinary", "unknown", NA))
#> [1] "M" "F" "O" "O" "U" "U"
```

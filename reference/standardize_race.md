# Standardize race variable

Standardize race variable

## Usage

``` r
standardize_race(x, racecol = "race")
```

## Arguments

- x:

  A data frame containing a race column to harmonize

- racecol:

  The name of the race column. Default is "race".

## Value

A new data frame with an additional `.race_standardized` column

## See also

[racemap](https://stephenturner.github.io/rpkgdemo/reference/racemap.md)

## Examples

``` r
set.seed(123)
mydata <- data.frame(reported_race=sample(names(racemap), 20, replace=TRUE))
mydata$reported_race[15] <- "Martian"
mydata
#>                             reported_race
#> 1                                   White
#> 2                                   Other
#> 3                                      R4
#> 4          Native American/Alaskan Native
#> 5                                      R3
#> 6                                     UNK
#> 7  Native Hawaiian/Other Pacific Islander
#> 8                                   Asian
#> 9                      More Than One Race
#> 10                                     R4
#> 11                                  Asian
#> 12                                  Other
#> 13              Black or African American
#> 14         Native American/Alaskan Native
#> 15                                Martian
#> 16                 Black/African American
#> 17                                     R3
#> 18              Black or African American
#> 19                                  Other
#> 20                                     R1
standardize_race(mydata, racecol="reported_race")
#>                             reported_race
#> 1                                   White
#> 2                                   Other
#> 3                                      R4
#> 4          Native American/Alaskan Native
#> 5                                      R3
#> 6                                     UNK
#> 7  Native Hawaiian/Other Pacific Islander
#> 8                                   Asian
#> 9                      More Than One Race
#> 10                                     R4
#> 11                                  Asian
#> 12                                  Other
#> 13              Black or African American
#> 14         Native American/Alaskan Native
#> 15                                Martian
#> 16                 Black/African American
#> 17                                     R3
#> 18              Black or African American
#> 19                                  Other
#> 20                                     R1
#>                        .race_standardized
#> 1                                   White
#> 2                                   Other
#> 3  Native Hawaiian/Other Pacific Islander
#> 4           American Indian/Alaska Native
#> 5                  Black/African American
#> 6                                 Unknown
#> 7  Native Hawaiian/Other Pacific Islander
#> 8                                   Asian
#> 9                             Multiracial
#> 10 Native Hawaiian/Other Pacific Islander
#> 11                                  Asian
#> 12                                  Other
#> 13                 Black/African American
#> 14          American Indian/Alaska Native
#> 15                                   <NA>
#> 16                 Black/African American
#> 17                 Black/African American
#> 18                 Black/African American
#> 19                                  Other
#> 20          American Indian/Alaska Native
```

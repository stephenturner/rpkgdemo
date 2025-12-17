# Race mapping

A named character vector mapping various race categories to a harmonized
variable

## Usage

``` r
racemap
```

## Format

A named character vector.

## Examples

``` r
racemap
#>            American Indian/Alaska Native 
#>          "American Indian/Alaska Native" 
#>                                    AI/AN 
#>          "American Indian/Alaska Native" 
#>           Native American/Alaskan Native 
#>          "American Indian/Alaska Native" 
#>                                       R1 
#>          "American Indian/Alaska Native" 
#>                                    Asian 
#>                                  "Asian" 
#>                                       R2 
#>                                  "Asian" 
#>                   Black/African American 
#>                 "Black/African American" 
#>                                    Black 
#>                 "Black/African American" 
#>                Black or African American 
#>                 "Black/African American" 
#>                                       R3 
#>                 "Black/African American" 
#>   Native Hawaiian/Other Pacific Islander 
#> "Native Hawaiian/Other Pacific Islander" 
#>                                    NH/PI 
#> "Native Hawaiian/Other Pacific Islander" 
#>         Native Hawaiian/Pacific Islander 
#> "Native Hawaiian/Other Pacific Islander" 
#>                                       R4 
#> "Native Hawaiian/Other Pacific Islander" 
#>                                    White 
#>                                  "White" 
#>                                       R5 
#>                                  "White" 
#>                                  Unknown 
#>                                "Unknown" 
#>                                      UNK 
#>                                "Unknown" 
#>                                    Other 
#>                                  "Other" 
#>                       More Than One Race 
#>                            "Multiracial" 
#>                               Multi-race 
#>                            "Multiracial" 
racemap["AI/AN"]
#>                           AI/AN 
#> "American Indian/Alaska Native" 
racemap["Black"]
#>                    Black 
#> "Black/African American" 
racemap["Doesn't exist in the mapping"]
#> <NA> 
#>   NA 
table(racemap)
#> racemap
#>          American Indian/Alaska Native                                  Asian 
#>                                      4                                      2 
#>                 Black/African American                            Multiracial 
#>                                      4                                      2 
#> Native Hawaiian/Other Pacific Islander                                  Other 
#>                                      4                                      1 
#>                                Unknown                                  White 
#>                                      2                                      2 
```

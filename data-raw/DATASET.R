# zipcode data -----------------------------------------------------------

# It's okay to load a package in this file - it's not part of the package itself
library(dplyr)

# Download the USPS ZIP code data
tf <- tempfile()
url <- "https://postalpro.usps.com/mnt/glusterfs/2025-12/ZIP_Locale_Detail.xls"
download.file(url = url, destfile = tf)

# Read in the data
zipcodes_raw <- readxl::read_excel(tf, sheet = "ZIP_DETAIL")
zipcodes_raw

# select relevant columns and clean up
zipcodes <-
  zipcodes_raw |>
  select(
    zip = `DELIVERY ZIPCODE`,
    city = `PHYSICAL CITY`,
    state = `PHYSICAL STATE`
  ) |>
  distinct(zip, .keep_all = TRUE) |>
  mutate(city = stringr::str_to_title(city)) |>
  arrange(zip, city)
zipcodes

# Save the dataset in the package
usethis::use_data(zipcodes, overwrite = TRUE)


# example epidemiological data -------------------------------------------

# Create some sex variables to sample from
sexes <- c(
  "male",
  "female",
  "Male",
  "Female",
  "M",
  "F",
  "m",
  "f",
  "transgender",
  "trans male",
  "Trans Female",
  "non-binary",
  "Unknown",
  "unk",
  "???"
)
sexes

# Get only virginia zip codes
vazips <-
  zipcodes |>
  dplyr::filter(state == "VA") |>
  dplyr::pull(zip)
vazips

# Create a 1000 row dataset. Make sure to set a random seed!
n <- 1000
set.seed(20251205)
rped <-
  tibble::tibble(
    sex = sample(sexes, size = n, replace = TRUE),
    age = sample(20L:60L, size = n, replace = TRUE),
    zip = sample(vazips, size = n, replace = TRUE),
    lab1 = rpois(n, lambda = 2),
    lab2 = rpois(n, lambda = 10)
  ) |>
  arrange(zip) |>
  mutate(id = row_number(), .before = 1)
# Add some noise
rped$zip[1] <- "12345"
rped$age[2] <- 12
rped$age[3] <- 130
rped

# Save the dataset in the package
usethis::use_data(rped, overwrite = TRUE)

# Write as installed data
extdatadir <- here::here("inst/extdata")
dir.create(extdatadir, recursive = TRUE)
readr::write_csv(rped, here::here("inst/extdata/rped.csv"))

#' Suppress Low Counts for Privacy
#'
#' Replaces numeric counts below a threshold with a suppression character (`NA`).
#'
#' @param x A numeric vector of counts.
#' @param threshold Numeric. Values strictly less than this are suppressed. Default 5.
#' @param symbol Character or `NA`. The symbol to use for suppression. Default is `NA`.
#'
#' @return A vector.
#' @export
#'
#' @examples
#' suppress_counts(c(1, 3, 5, 7, 9))
#' suppress_counts(c(10, 20, 3, 4, 5), threshold = 10)
#' suppress_counts(1:10, threshold = 5, symbol = "*")
#'
suppress_counts <- function(x, threshold = 5, symbol = NA) {
  # Check if input is numeric
  if (!is.numeric(x)) {
    stop("Input x must be numeric.")
  }

  # Suppress counts below the threshold
  x[x < threshold] <- symbol

  # Return the modified vector
  return(x)
}


#' Standardize Sex Variables
#'
#' Maps various inputs (M, Male, f, Female) to standard HL7/ISO codes (M, F, O, U).
#'
#' @param x A character vector of sex/gender inputs.
#'
#' @return A character vector containing "M", "F", "O", or "U".
#' @export
#'
#' @examples
#' standardize_sex(c("Male", "f", "Trans female", "nonbinary", "unknown", NA))
standardize_sex <- function(x) {
  # Check if input is character
  if (!is.character(x)) {
    stop("Input x must be a character vector.")
  }

  # trim whitespace and make lowercase
  x <- trimws(tolower(as.character(x)))

  # Map various inputs to standard codes
  standardized <- dplyr::case_when(
    x %in% c("male", "m") ~ "M",
    x %in% c("female", "f") ~ "F",
    grepl("trans|non|binary", x) ~ "O",
    .default = "U"
  )

  return(standardized)
}

#' Read laboratory data
#'
#' Read laboratory data from a file
#'
#' @param file A file path
#'
#' @returns A data frame
#' @export
#'
#' @examples
#' fp <- system.file("extdata/rped.csv", package = "rpkgdemo", mustWork = TRUE)
#' read_labdata(fp)
#'
read_labdata <- function(file) {
  readr::read_csv(
    file,
    col_types = readr::cols(
      sex = readr::col_character(),
      age = readr::col_integer(),
      zip = readr::col_character(),
      .default = readr::col_guess()
    )
  )
}

#' Prepare lab data
#'
#' Prepare lab data for analysis. Standardizes the `sex` variable, joins with `zipcodes` data, centers and scales lab values.
#'
#' @param x A data frame containing lab data with at least `sex`, `zip`, and lab value columns starting with "lab".
#' @param warnings Logical. Whether to issue warnings for potential data issues (bad zip codes, minors, unrealistic ages). Default is `TRUE`.
#'
#' @returns A data frame with standardized `sex`, joined `zipcodes`, and scaled lab values.
#' @export
#'
#' @examples
#' prep_lab_data(rped)
#'
prep_lab_data <- function(x, warnings = TRUE, badoption="remove") {
  # Check for potential issues
  if (warnings) {
    # Check for bad zip codes
    badzips <- !(x$zip %in% rpkgdemo::zipcodes$zip)
    if (any(badzips)) {
      warning(paste0("Found ", sum(badzips), " bad zip code(s)."))
    }

    # Check for minors
    minors <- x$age < 18
    if (any(minors)) {
      warning(paste0("Found ", sum(minors), " minor(s) in dataset."))
    }

    # Check for unrealistic numbers
    unrealistic <- x$age < 0 | x$age > 120
    if (any(unrealistic)) {
      warning(paste0(
        "Found ",
        sum(unrealistic),
        " unrealistic age(s) in dataset."
      ))
    }
  }

  # Prepare the data
  result <-
    x |>
    dplyr::mutate(sex = standardize_sex(.data$sex)) |>
    dplyr::left_join(rpkgdemo::zipcodes, by = "zip") |>
    dplyr::mutate(dplyr::across(dplyr::starts_with("lab"), \(x) scale(x)[, 1]))
  return(result)
}

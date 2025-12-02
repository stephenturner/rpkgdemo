test_that("suppress_counts", {
  # Correct usage
  expect_silent(res <- suppress_counts(c(1, 3, 5, 7, 9)))
  expect_equal(res, c(NA, NA, 5, 7, 9))
  expect_silent(res <- suppress_counts(c(10, 20, 3, 4, 5), threshold = 10))
  expect_true(all(is.na(res[3:5])))
  expect_silent(res <- suppress_counts(1:10, threshold = 5, symbol = "*"))
  expect_true(all(res[1:4] == "*"))
  # Incorrect usage
  expect_error(suppress_counts("not numeric"))
})

test_that("standardize_sex", {
  result <- standardize_sex(c("Male", "male", "M", "m"))
  expect_equal(result, c("M", "M", "M", "M"))
  result <- standardize_sex(c("Female", "female", "F", "f"))
  expect_equal(result, c("F", "F", "F", "F"))
  result <- standardize_sex(c(
    "Trans female",
    "transgender",
    "nonbinary",
    "non-binary"
  ))
  expect_equal(result, c("O", "O", "O", "O"))
  result <- standardize_sex(c("unknown", "xyz", ""))
  expect_equal(result, c("U", "U", "U"))
  result <- standardize_sex(c("  Male  ", "  female  "))
  expect_equal(result, c("M", "F"))
  expect_error(
    standardize_sex(c(1, 2, 3)),
    "Input x must be a character vector."
  )
})

test_that("read_labdata", {
  fp <- system.file("extdata/rped.csv", package = "rpkgdemo", mustWork = TRUE)
  result <- read_labdata(fp)
  expect_s3_class(result, "data.frame")
  expect_true("sex" %in% names(result))
  expect_true("age" %in% names(result))
  expect_true("zip" %in% names(result))
})

test_that("prep_lab_data standardizes sex variable", {
  test_data <- data.frame(
    sex = c("Male", "female"),
    age = c(25, 30),
    zip = c("22903", "22904"),
    lab1 = c(100, 110)
  )
  expect_silent(result <- prep_lab_data(test_data, warnings = FALSE))
  expect_equal(result$sex, c("M", "F"))
  expect_equal(mean(result$lab1), 0, tolerance = 1e-10)
  expect_equal(sd(result$lab1), 1, tolerance = 1e-10)

  # test warnings about zip codes
  test_data <- data.frame(
    sex = c("M", "F"),
    age = c(25, 30),
    zip = c("99999", "88888"),
    lab1 = c(100, 200)
  )
  expect_warning(prep_lab_data(test_data), "bad zip code")

  # test warnings about minors
  test_data <- data.frame(
    sex = c("M", "F"),
    age = c(15, 30),
    zip = c("22903", "37212"),
    lab1 = c(100, 200)
  )
  expect_warning(prep_lab_data(test_data), "minor")

  # test warnings about unrealistic ages
  test_data <- data.frame(
    sex = c("M", "F"),
    age = c(25, 150),
    zip = c("22903", "96815"),
    lab1 = c(100, 200)
  )
  expect_warning(prep_lab_data(test_data), "unrealistic age")

  # test suppressing warnings
  test_data <- data.frame(
    sex = c("M", "F"),
    age = c(-5, 150),
    zip = c("99999", "88888"),
    lab1 = c(100, 200)
  )
  expect_no_warning(prep_lab_data(test_data, warnings = FALSE))
})

test_that("OxCal configure works properly", {
  skip_on_cran()
  skip_if_offline()

  expect_error(oxcal_configure(ask = TRUE), "Could not find OxCal")
})

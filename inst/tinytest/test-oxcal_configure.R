if (at_home()) {
  ## Check that OxCal configure works properly
  expect_error(oxcal_configure(ask = TRUE), "Could not find OxCal")
}

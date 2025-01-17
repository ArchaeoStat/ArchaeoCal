if (at_home()) {
  ## Check that OxCal configure works properly
  expect_error(oxcal_configure(install = FALSE), "OxCal was not installed.")
}

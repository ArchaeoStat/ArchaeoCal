## Check that OxCal configure works properly
expect_error(oxcal_configure(path = tempdir(), install = FALSE, verbose = FALSE), "OxCal was not installed.")

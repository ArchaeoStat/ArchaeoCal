# Get OxCal results
results <- structure(
  list(
    oxcal = system.file("tinytest", "results.oxcal", package = "ArchaeoCal"),
    js = system.file("tinytest", "results.js", package = "ArchaeoCal"),
    log = system.file("tinytest", "results.log", package = "ArchaeoCal"),
    txt = system.file("tinytest", "results.txt", package = "ArchaeoCal"),
    csv = character(0)
  ),
  class = "OxCalOutput"
)

# Parse results
parsed <- oxcal_parse(results)
expect_length(parsed, 3)

expect_identical(dim(as.data.frame(parsed)), c(42L, 11L))

.onLoad <- function(libname, pkgname) {
  ## Set package options
  op <- options()
  op.aion <- list(
    aion.verbose = TRUE,
    aion.oxcal = ""
  )
  toset <- !(names(op.aion) %in% names(op))
  if(any(toset)) options(op.aion[toset])

  invisible()
}

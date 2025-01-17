.onLoad <- function(libname, pkgname) {
  ## Set package options
  op <- options()
  op.ArchaeoCal <- list(
    ArchaeoCal.verbose = interactive(),
    ArchaeoCal.oxcal = ""
  )
  toset <- !(names(op.ArchaeoCal) %in% names(op))
  if(any(toset)) options(op.ArchaeoCal[toset])

  invisible()
}

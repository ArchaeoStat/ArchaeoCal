.onLoad <- function(libname, pkgname) {
  op <- options()
  op.ArchaeoCal <- list(
    ArchaeoCal.verbose = interactive()
  )
  toset <- !(names(op.ArchaeoCal) %in% names(op))
  if(any(toset)) options(op.ArchaeoCal[toset])

  invisible()
}

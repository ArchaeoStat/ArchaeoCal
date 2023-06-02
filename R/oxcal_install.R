#' Download OxCal
#'
#' @param install_url A [`character`] string specifying the url from which
#'  OxCal could be installed.
#' @param install_location A [`character`] string specifying the directory to
#'  extract OxCal files to. It will be created if necessary
#'  (see [utils::unzip()]).
#' @param verbose A [`logical`] scalar: should status updates be displayed?
#' @return Invisibly returns the path to the OxCal directory.
#' @example inst/examples/ex-oxcal-execute.R
#' @author N. Frerebeau
#' @family OxCal tools
#' @export
oxcal_install <- function(install_url = NULL, install_location = NULL,
                          verbose = getOption("ArchaeoCal.verbose")) {
  ## Default url
  if (is.null(install_url)) {
    install_url <- "https://c14.arch.ox.ac.uk/OxCalDistribution.zip"
  }

  if (verbose) {
    msg <- "Attempting to download OxCal from %s."
    message(sprintf(msg, install_url))
  }

  ## Download
  tmp <- tempfile()
  on.exit(unlink(tmp))
  utils::download.file(install_url, destfile = tmp, quiet = !verbose)

  ## Extract
  if (is.null(install_location)) install_location <- tempdir()
  utils::unzip(tmp, exdir = install_location) # TODO: extract only OxCal/bin/

  oxcal_location <- file.path(install_location, "OxCal")
  if (verbose) {
    msg <- "OxCal successfully downloaded and extracted to %s."
    message(sprintf(msg, oxcal_location))
  }

  invisible(oxcal_location)
}

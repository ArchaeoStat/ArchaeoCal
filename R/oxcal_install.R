# OXCAL INSTALL

#' Download and Install OxCal
#'
#' @param target A [`character`] string specifying the directory to
#'  extract OxCal files to. It will be created if necessary
#'  (see [utils::unzip()]).
#' @param source A [`character`] string specifying the url from which
#'  OxCal could be installed.
#' @param verbose A [`logical`] scalar: should \R report extra information on
#'  progress?
#' @param ... Currently not used.
#' @return
#'  `oxcal_install()` is called for its side-effect.
#'  Invisibly returns the path to the OxCal directory.
#' @example inst/examples/ex-oxcal-execute.R
#' @author N. Frerebeau
#' @export
oxcal_install <- function(target,
                          source = "https://c14.arch.ox.ac.uk/OxCalDistribution.zip",
                          verbose = getOption("ArchaeoCal.verbose"), ...) {
  if (!interactive()) {
    msg <- tr_("OxCal can only be installed during an interactive R session.")
    stop(msg, call. = FALSE)
  }

  if (verbose) {
    msg <- tr_("Attempting to download OxCal from %s...")
    message(sprintf(msg, source))
  }

  ## Download
  tmp <- tempfile()
  on.exit(unlink(tmp))
  utils::download.file(source, destfile = tmp, quiet = !verbose)

  ## Extract
  if (grepl("OxCal$", target)) target <- dirname(target)
  utils::unzip(tmp, exdir = target) # TODO: extract only OxCal/bin/
  target <- file.path(target, "OxCal")

  if (verbose) {
    msg <- tr_("OxCal successfully downloaded and extracted to %s.")
    message(sprintf(msg, target))
  }

  invisible(target)
}

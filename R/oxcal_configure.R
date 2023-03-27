#' Setup OxCal
#'
#' @param command A [`character`] string specifying the path to the OxCal
#'  directory.
#' @param os A [`character`] string specifying the operating system of the
#'  workstation. It must be one of "`Linux`", "`Windows`" or "`Darwin`".
#'  If `NULL` (the default), the operating system will be determined
#'  automatically (see [Sys.info()]).
#' @param ask A [`logical`] scalar: if OxCal is not installed, should the user
#'  be asked to download it?
#'  If `FALSE` and \R is being used interactively, will raise an error if the
#'  OxCal executable cannot be found.
#'  If `FALSE` and \R is not being used interactively, will try to download
#'  OxCal.
#' @inheritParams oxcal_install
#' @details
#'  Downloads the latest version of Oxcal (if needed) and sets the executable
#'  path correctly.
#' @return Invisibly returns the path to the OxCal executable.
#' @example inst/examples/ex-oxcal-execute.R
#' @author N. Frerebeau
#' @family OxCal tools
#' @export
oxcal_configure <- function(command = NULL, os = NULL, ask = TRUE,
                            install_location = NULL, install_url = NULL,
                            verbose = getOption("aion.verbose")) {
  if (is.null(command)) {
    ## Default list of possible locations
    command <- c(getOption("aion.oxcal"), "OxCal")
  }

  ## Try to construct the executable path
  operator <- if (is.null(os)) Sys.info()["sysname"] else os
  binary <- switch(
    operator,
    Linux = "OxCalLinux",
    Windows = "OxCalWin.exe",
    Darwin = "OxCalMac",
    stop(sprintf("Unknown operating system: %s.",
                 sQuote(operator)), call. = FALSE)
  )
  if (!any(grepl(pattern = binary, x = command))) {
    command <- file.path(command, "bin", binary)
  }

  ## Validation
  command <- setdiff(command, "")
  for (path in command) {
    if (file.exists(path)) {
      if (verbose) message(sprintf("OxCal binary found at %s", path))
      Sys.chmod(path, mode = "0777")
      options(aion.oxcal = path)
      return(invisible(path))
    }
  }

  ## Try to install?
  download <- ""
  if (ask && interactive()) {
    cat(
      "OxCal doesn't seem to be installed.",
      "Do you want to download it?",
      "1. Yes",
      "2. No",
      sep = "\n"
    )
    download <- readline("Choice: ")
  }
  if (!ask && !interactive()) {
    download <- "1"
  }
  if (download == "1") {
    ## Install
    oxcal_location <- oxcal_install(
      install_url = install_url,
      install_location = install_location,
      verbose = verbose
    )

    ## Configure
    invisible(
      oxcal_configure(
        command = oxcal_location,
        os = os, ask = ask,
        install_location = install_location,
        install_url = install_url
      )
    )
  } else {
    msg <- "Could not find OxCal binary at any of the following locations:\n%s."
    stop(sprintf(msg, paste0(command, collapse = "\n")), call. = FALSE)
  }
}

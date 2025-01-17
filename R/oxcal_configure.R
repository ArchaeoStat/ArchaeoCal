#' Setup OxCal
#'
#' @param command A [`character`] string specifying the path to the OxCal
#'  directory.
#' @param os A [`character`] string specifying the operating system of the
#'  workstation. It must be one of "`Linux`", "`Windows`" or "`Darwin`".
#'  If `NULL` (the default), the operating system will be determined
#'  automatically (see [Sys.info()]).
#' @param install A [`logical`] scalar: if OxCal binary is not found,
#'  should it be downloaded and installed?
#' @param ask A [`logical`] scalar: if OxCal is not installed, should the user
#'  be asked before downloading it?
#' @inheritParams oxcal_install
#' @details
#'  Downloads the latest version of Oxcal (if needed) and sets the executable
#'  path correctly.
#' @return Invisibly returns the path to the OxCal executable.
#' @example inst/examples/ex-oxcal-execute.R
#' @author N. Frerebeau
#' @family OxCal tools
#' @export
oxcal_configure <- function(command = NULL, os = NULL, install = TRUE,
                            install_location = NULL, install_url = NULL,
                            ask = TRUE,
                            verbose = getOption("ArchaeoCal.verbose")) {
  if (is.null(command)) {
    ## Default list of possible locations
    command <- c(getOption("ArchaeoCal.oxcal"), "OxCal")
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
      if (isTRUE(verbose)) message(sprintf("OxCal binary found at %s", path))
      Sys.chmod(path, mode = "0777")
      options(ArchaeoCal.oxcal = path)
      return(invisible(path))
    } else {
      if (isTRUE(verbose))
        message(sprintf("Could not find OxCal binary at %s", path))
    }
  }

  ## Try to install?
  download <- isTRUE(install)
  if (isTRUE(install) && isTRUE(ask)) {
    download <- utils::askYesNo(
      msg = paste0(c("OxCal doesn't seem to be installed.",
                     "Do you want to download it?"), collapse = "\n"),
      default = FALSE,
      prompts = gettext(c("Yes", "No", "Cancel"))
    )
  }
  if (isTRUE(download)) {
    ## Install
    oxcal_location <- oxcal_install(
      install_url = install_url,
      install_location = install_location,
      verbose = verbose
    )

    ## Configure
    path <- oxcal_configure(
      command = oxcal_location,
      os = os, ask = ask,
      install_location = install_location,
      install_url = install_url
    )
    return(invisible(path))
  } else {
    stop("OxCal was not installed.", call. = FALSE)
  }
}

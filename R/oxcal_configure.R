# OXCAL SETUP

#' Configure OxCal
#'
#' @param path A [`character`] string specifying the path to the OxCal
#'  directory.
#' @param os A [`character`] string specifying the operating system of the
#'  workstation. It must be one of "`Linux`", "`Windows`" or "`Darwin`".
#'  If `NULL` (the default), the operating system will be determined
#'  automatically (see [Sys.info()]).
#' @param install A [`logical`] scalar: if OxCal binary is not found,
#'  should it be downloaded and installed?
#' @param ask A [`logical`] scalar: if OxCal is not installed, should the user
#'  be asked before downloading it?
#' @param force A [`logical`] scalar: if OxCal is already installed, should
#'  reinstallation be forced?
#' @param verbose A [`logical`] scalar: should \R report extra information on
#'  progress?
#' @param ... Further arguments to be passed to [oxcal_install()].
#' @details
#'  Downloads the latest version of Oxcal (if needed) and sets the executable
#'  path correctly.
#' @return
#'  `oxcal_configure()` is called for its side-effect.
#'  Invisibly returns the path to the OxCal executable.
#' @example inst/examples/ex-oxcal-execute.R
#' @author N. Frerebeau
#' @export
oxcal_configure <- function(path = oxcal_path(), os = NULL,
                            install = TRUE, ask = interactive(), force = FALSE,
                            verbose = getOption("ArchaeoCal.verbose"), ...) {
  ## Look for OxCal
  ## Try to construct the executable path
  operator <- if (is.null(os)) Sys.info()["sysname"] else os
  binary <- switch(
    operator,
    Linux = "OxCalLinux",
    Windows = "OxCalWin.exe",
    Darwin = "OxCalMac",
    stop(sprintf(tr_("Unknown operating system: %s."),
                 dQuote(operator)), call. = FALSE)
  )
  if (!grepl(binary, path, ignore.case = TRUE)) {
    path_exe <- file.path(path, "bin", binary)
  } else {
    path_exe <- path
  }

  if (file.exists(path_exe)) {
    if (isTRUE(verbose)) {
      message(sprintf(tr_("OxCal binary found at %s."), path_exe))
    }
    Sys.chmod(path_exe, mode = "777")
    Sys.setenv(OXCAL_PATH = path_exe)
  } else {
    if (isTRUE(verbose)) {
      message(sprintf(tr_("Could not find OxCal binary at %s."), path_exe))
    }

    ## Try to install?
    download <- isTRUE(install)
    if (isTRUE(install) && isTRUE(ask)) {
      download <- utils::askYesNo(
        msg = paste(tr_("OxCal doesn't seem to be installed."),
                    tr_("Do you want to download it?"), sep = "\n"),
        default = FALSE
      )
    }
    if (isFALSE(download)) {
      stop(tr_("OxCal was not installed."), call. = FALSE)
    }

    ## Install
    path <- oxcal_install(target = path, verbose = verbose, ...)

    ## Configure
    path_exe <- oxcal_configure(path = path, ask = ask, ...)
  }

  return(invisible(path_exe))
}

#' Get OxCal Executable Path
#'
#' @param ... Currently not used.
#' @details
#'   Defaults to the R user directory.
#' @return
#'  A [`character`] string giving the path to OxCal executable.
#' @example inst/examples/ex-oxcal-execute.R
#' @seealso [tools::R_user_dir()]
#' @author N. Frerebeau
#' @export
oxcal_path <- function(...) {
  ## Get path
  default <- file.path(tools::R_user_dir("ArchaeoCal", which = "data"), "OxCal")
  Sys.getenv("OXCAL_PATH", unset = default)
}

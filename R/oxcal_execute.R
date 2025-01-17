#' Execute an Oxcal Script
#'
#' @param script A [`character`] string of instructions for OxCal.
#' @param file A [`character`] string naming a file (without extension) to
#'  write `script` to. Output files will be named after `file` and written to
#'  the same directory.
#' @param mcmc A [`character`] string giving the name of the output file for
#'  the MCMC samples (without extension). It must match the `Name` argument of
#'  OxCal's [`MCMC_Sample()`](https://intchron.org/tools/oxcalhelp/hlp_commands.html)
#'  function. Only used if `script` contains the `MCMC_Sample()` command.
#' @param verbose A [`logical`] scalar: should status updates be displayed?
#' @param ... Further parameters to be passed to [system2()].
#' @return
#'  A [`list`] with class `OxCalOutput` containing the following elements:
#'  \describe{
#'   \item{`oxcal`}{A [`character`] string giving the path to the .oxcal file.}
#'   \item{`js`}{A [`character`] string giving the path to the .js file.}
#'   \item{`log`}{A [`character`] string giving the path to the .log file.}
#'   \item{`txt`}{A [`character`] string giving the path to the .txt file.}
#'   \item{`csv`}{A [`character`] string giving the path to the .csv file.}
#'  }
#' @example inst/examples/ex-oxcal-execute.R
#' @references
#'  \url{https://c14.arch.ox.ac.uk/oxcalhelp/hlp_analysis_file.html}
#' @author N. Frerebeau
#' @family OxCal tools
#' @export
oxcal_execute <- function(script, file = NULL, mcmc = "MCMC_Sample",
                          verbose = getOption("ArchaeoCal.verbose"), ...) {
  ## Construct output path
  if (is.null(file)) {
    file <- tempfile()
  } else {
    direct <- dirname(file)
    dir.create(direct, showWarnings = FALSE, recursive = TRUE)
  }

  ## Write script
  oxcal <- sprintf("%s.oxcal", file)
  cat(script, file = oxcal, sep = "\n")

  ## Remove existing .work file (if any)
  work <- sprintf("%s.work", file)
  if (file.exists(work)) file.remove(work)

  ## Run OxCal
  out <- oxcal_call(oxcal, ...)
  if (verbose) cat(out)

  ## MCMC?
  csv <- sprintf("%s.csv", mcmc)
  csv <- if (file.exists(csv)) csv else character(0)

  ## Output files
  structure(
    list(
      oxcal = oxcal,
      js = assert_exists(sprintf("%s.js", file)),
      log = assert_exists(sprintf("%s.log", file)),
      txt = assert_exists(sprintf("%s.txt", file)),
      csv = csv
    ),
    class = "OxCalOutput"
  )
}

oxcal_call <- function(args, ...) {
  command <- oxcal_path() # Get OxCal path

  output <- tempfile()
  on.exit(unlink(output))
  code <- system2(command, args, stdout = output, ...)

  if (code != 0) stop("Something goes wrong...", call. = FALSE)

  ## Return output as a character vector
  if (file.exists(output)) {
    paste0(readLines(output), collapse = "\n")
  } else {
    ""
  }
}

#' Get OxCal Executable Path
#'
#' @return Returns the path to OxCal executable.
#' @example inst/examples/ex-oxcal-execute.R
#' @author N. Frerebeau
#' @family OxCal tools
#' @keywords internal
#' @noRd
oxcal_path <- function() {
  path <- getOption("ArchaeoCal.oxcal")
  if (is.null(path) || !file.exists(path)) {
    msg <- "OxCal not properly configured. Run oxcal_configure() to debug."
    stop(msg, call. = FALSE)
  }
  path
}

#' 14C Calibration with OxCal
#'
#' @param names A [`character`] vector specifying the names of the dates (e.g.
#'  laboratory codes).
#' @param dates A [`numeric`] vector giving the BP dates to be calibrated.
#' @param errors A [`numeric`] vector giving the standard deviation of the dates
#'  to be calibrated.
#' @param curve A [`character`] string specifying the calibration curve to be
#'  used.
#' @return An [`OxCalOutput-class`] object.
#' @example inst/examples/ex-oxcal-calibrate.R
#' @author N. Frerebeau
#' @family OxCal tools
#' @export
oxcal_calibrate <- function(names, dates, errors, curve = "IntCal20") {
  ## Validation
  n <- length(names)
  if (length(dates) != n || length(errors) != n) {
    msg <- sprintf("%s, %s and %s must have the same lenght.",
                   sQuote("names"), sQuote("dates"), sQuote("errors"))
    stop(msg, call. = FALSE)
  }
  if (length(curve) != 1) {
    stop("Please select one calibration curve.", call. = FALSE)
  }

  ## OxCal options
  curve <- tolower(curve)
  opt <- sprintf("Options()\n{\nCurve=\"%s.14c\"\n};", curve)

  ## R_Dates
  r_dates <- sprintf("R_Date(\"%s\",%g,%g);", names, dates, errors)
  r_dates <- paste0(r_dates, collapse = "\n")

  ## Execute OxCal
  script <- paste0(c(opt, r_dates), collapse = "\n")
  out <- oxcal_execute(script)

  ## Parse OxCal output
  oxcal_parse(out)
}

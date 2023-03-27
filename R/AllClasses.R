# CLASSES DEFINITION AND INITIALIZATION
NULL

#' OxCal Output Files
#'
#' An S4 class to represent OxCal output files.
#' @param oxcal A [`character`] string giving the path to the .oxcal file.
#' @param js A [`character`] string giving the path to the .js file.
#' @param log A [`character`] string giving the path to the .log file.
#' @param txt A [`character`] string giving the path to the .txt file.
#' @param csv A [`character`] string giving the path to the .csv file.
#' @author N. Frerebeau
#' @family classes
#' @docType class
#' @aliases OxCalFiles-class
#' @keywords internal
.OxCalFiles <- setClass(
  Class = "OxCalFiles",
  slots = c(
    oxcal = "character",
    js = "character",
    log = "character",
    txt = "character",
    csv = "character"
  )
)

#' OxCal Output
#'
#' An S4 class to represent OxCal output.
#' @param ocd A [`list`] of OxCal data which holds the ranges, probability
#'  distributions, etc. for each parameter.
#' @param model A [`list`] of information about the model.
#' @param calib A [`list`] of information about the calibration curve.
#' @section Coerce:
#'  In the code snippets below, `x` is an `OxCalOutput` object.
#'  \describe{
#'   \item{`as.data.frame(x)`}{Coerces to a [`data.frame`].}
#'  }
#' @author N. Frerebeau
#' @family classes
#' @docType class
#' @aliases OxCalOutput-class
#' @keywords internal
.OxCalOutput <- setClass(
  Class = "OxCalOutput",
  slots = c(
    ocd = "list",
    model = "list",
    calib = "list"
  )
)

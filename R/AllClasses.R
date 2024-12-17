# CLASSES DEFINITION AND INITIALIZATION
NULL

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

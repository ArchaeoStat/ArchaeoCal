# OXCAL OUTPUT

# Parse ========================================================================
#' Read and Parse OxCal Output
#'
#' @param path A [`character`] string naming a JavaScript file which the data
#'  are to be read from (or a `list` returned by [oxcal_execute()]).
#' @return
#'  A [`list`] with class `OxCalResults` containing the following elements:
#'  \describe{
#'   \item{`ocd`}{A [`list`] of OxCal data which holds the ranges, probability
#'   distributions, etc. for each parameter.}
#'   \item{`model`}{A [`list`] of information about the model.}
#'   \item{`calib`}{A [`list`] of information about the calibration curve.}
#'  }
#' @example inst/examples/ex-oxcal-execute.R
#' @references
#'  \url{https://c14.arch.ox.ac.uk/oxcalhelp/hlp_analysis_file.html}
#' @author N. Frerebeau
#' @export
oxcal_parse <- function(path) {
  UseMethod("oxcal_parse", path)
}

#' @export
#' @rdname oxcal_parse
oxcal_parse.OxCalOutput <- function(path) {
  js <- path$js
  if (is.null(js) || !file.exists(js)) {
    stop("Could not find the path.", call. = FALSE)
  }
  .oxcal_parse(js)
}

.oxcal_parse <- function(path) {
  arkhe::assert_package("V8")
  ox <- V8::v8()
  ox$eval("ocd={};")
  ox$eval("calib={};")
  ox$eval("model={};")
  ox$source(path)

  structure(
    list(
      ocd = ox$get("ocd"),
      model = ox$get("model"),
      calib = ox$get("calib")
    ),
    class = "OxCalResults"
  )
}

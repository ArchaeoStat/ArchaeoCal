# GENERIC METHODS
#' @include AllClasses.R
NULL

#' Read and Parse OxCal Output
#'
#' @param object A [`character`] string naming a JavaScript file which the data
#'  are to be read from (or a `list` returned by [oxcal_execute()]).
#' @return An [`OxCalOutput-class`] object.
#' @example inst/examples/ex-oxcal-execute.R
#' @references
#'  \url{https://c14.arch.ox.ac.uk/oxcalhelp/hlp_analysis_file.html}
#' @author N. Frerebeau
#' @docType methods
#' @family OxCal tools
#' @aliases oxcal_parse-method
setGeneric(
  name = "oxcal_parse",
  def = function(object) standardGeneric("oxcal_parse"),
  valueClass = "OxCalOutput"
)

#' Plot OxCal Output
#'
#' @param x An [`OxCalOutput-class`] object.
#' @param likelihood A [`logical`] scalar: should likelihood be drawn?
#' @param posterior A [`logical`] scalar: should posterior distribution be
#'  drawn?
#' @param warnings A [`logical`] scalar: should warnings be plotted?
#' @param col.likelihood,col.posterior A [`character`] string specifying the
#'  color of the density.
#' @param lty.likelihood,lty.posterior  A [`character`] string or [`numeric`]
#'  value specifying the line type of the lines.
#' @param main A [`character`] string giving a main title for the plot.
#' @param sub A [`character`] string giving a subtitle for the plot.
#' @param ann A [`logical`] scalar: should the default annotation (title and x,
#'  y and z axis labels) appear on the plot?
#' @param axes A [`logical`] scalar: should axes be drawn on the plot?
#' @param frame.plot A [`logical`] scalar: should a box be drawn around the
#'  plot?
#' @param panel.first An an `expression` to be evaluated after the plot axes are
#'  set up but before any plotting takes place. This can be useful for drawing
#'  background grids.
#' @param panel.last An `expression` to be evaluated after plotting has taken
#'  place but before the axes, title and box are added.
#' @param ... Other [graphical parameters][graphics::par] may also be passed as
#'  arguments to this function.
#' @return
#'  `plot()` is called it for its side-effects: it results in a graphic
#'  being displayed. Invisibly returns `x`.
#' @example inst/examples/ex-oxcal-calibrate.R
#' @author N. Frerebeau
#' @docType methods
#' @family OxCal tools
#' @name plot
#' @rdname plot
NULL

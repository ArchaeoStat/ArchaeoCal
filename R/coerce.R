# COERCE

#' Coerce to a Data Frame
#'
#' @param x A [`list`] returned by [`oxcal_parse()`].
#' @param row.names A [`character`] vector giving the row names for the data
#'  frame description, or `NULL`.
#' @param optional A [`logical`] scalar. If `FALSE` then the names of the
#'  variables in the data frame are checked to ensure that they are
#'  syntactically valid variable names and are not duplicated.
#' @param ... Currently not used.
#' @return A [`data.frame`] with the following columns:
#'  \describe{
#'   \item{`name`}{}
#'   \item{`operation`}{}
#'   \item{`type`}{}
#'   \item{`date`}{}
#'   \item{`error`}{}
#'   \item{`agreement`}{}
#'   \item{`convergence`}{}
#'   \item{`like_range`}{A `list` giving the confidence intervals of the likelihood.}
#'   \item{`like_density`}{A `list` giving the likelihood.}
#'   \item{`post_range`}{A `list` giving the confidence intervals of the posterior probability.}
#'   \item{`post_density`}{A `list` giving the posterior probability.}
#'  }
#' @export
as.data.frame.OxCalResults <- function(x, row.names = NULL,
                                       optional = FALSE, ...) {
  data.frame(
    name = oxcal_get_names(x),
    operation = oxcal_get_operation(x),
    type = oxcal_get_type(x),
    date = oxcal_get_bp_date(x),
    error = oxcal_get_bp_error(x),
    agreement = oxcal_get_agreement(x),
    convergence = oxcal_get_convergence(x),
    like_range = I(oxcal_get_range(x, prob = "likelihood")),
    like_density = I(oxcal_get_density(x, prob = "likelihood")),
    post_range = I(oxcal_get_range(x, prob = "posterior")),
    post_density = I(oxcal_get_density(x, prob = "posterior")),
    row.names = row.names,
    check.names = !optional
  )
}

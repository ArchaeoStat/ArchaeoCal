# COERCE
#' @include AllGenerics.R
NULL

# @return A [`data.frame`] with the following columns:
#  \describe{
#   \item{`name`}{}
#   \item{`operation`}{}
#   \item{`type`}{}
#   \item{`date`}{}
#   \item{`error`}{}
#   \item{`agreement`}{}
#   \item{`convergence`}{}
#   \item{`likelihood`}{}
#   \item{`posterior`}{}
#  }
#' @export
#' @method as.data.frame OxCalOutput
as.data.frame.OxCalOutput <- function(x, ...) {
  data.frame(
    name = oxcal_get_names(x),
    operation = oxcal_get_operation(x),
    type = oxcal_get_type(x),
    date = oxcal_get_bp_date(x),
    error = oxcal_get_bp_error(x),
    agreement = oxcal_get_agreement(x),
    convergence = oxcal_get_convergence(x),
    likelihood = I(oxcal_density(x, prob = "likelihood")),
    posterior = I(oxcal_density(x, prob = "posterior"))
  )
}

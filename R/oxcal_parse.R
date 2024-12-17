# PARSE OXCAL OUTPUT
#' @include AllGenerics.R
NULL

#' @export
#' @rdname oxcal_parse
#' @aliases oxcal_parse,list-method
setMethod(
  f = "oxcal_parse",
  signature = c(object = "list"),
  definition = function(object) {
    js <- object$js
    if (is.null(js)) stop("Could not find the path.", call. = FALSE)
    methods::callGeneric(js)
  }
)

#' @export
#' @rdname oxcal_parse
#' @aliases oxcal_parse,character-method
setMethod(
  f = "oxcal_parse",
  signature = c(object = "character"),
  definition = function(object) {
    ox <- V8::v8()
    ox$eval("ocd={};")
    ox$eval("calib={};")
    ox$eval("model={};")
    ox$source(object)

    ocd <- ox$get("ocd")
    model <- ox$get("model")
    calib <- ox$get("calib")

    .OxCalOutput(
      ocd = ocd,
      model = model,
      calib = calib
      # oxcal = ocd[[1]]$ref,
      # curve = calib[[1]]$ref
    )
  }
)

# SHOW
#' @include AllGenerics.R
NULL

setMethod(
  f = "show",
  signature = "OxCalOutput",
  definition = function(object) {
    com <- vapply(
      X = object@ocd[-1],
      FUN = function(x) {
        like <- paste0(x$likelihood$comment, collapse = "\n")
        post <- paste0(x$posterior$comment, collapse = "\n")
        c(like, post)
      },
      FUN.VALUE = character(2)
    )
    sep <- paste0(rep("-", length.out = getOption("width")), collapse = "")

    k <- paste(com, sep, sep = "\n")
    cat(k, sep = "\n")

    invisible(object)
  }
)

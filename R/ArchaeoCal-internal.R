# HELPERS

#' Default value for NULL
#'
#' Replaces `NULL` with a default value.
#' @param x,y An object.
#' @return If `x` is `NULL`, returns `y`; otherwise returns `x`.
#' @keywords internal
#' @noRd
`%||%` <- function(x, y) {
  if (is.null(x)) y else x
}

# Reexport from base on newer versions of R to avoid conflict messages
if (exists("%||%", envir = baseenv())) {
  `%||%` <- get("%||%", envir = baseenv())
}

assert_exists <- function(x) {
  if (length(x) == 1 && !file.exists(x)) {
    stop(sprintf("Could not find %s.", x), call. = FALSE)
  }
  invisible(x)
}

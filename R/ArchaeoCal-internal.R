# HELPERS

## https://michaelchirico.github.io/potools/articles/developers.html
tr_ <- function(...) {
  enc2utf8(gettext(paste0(...), domain = "R-aion"))
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

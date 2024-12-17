# CLASSES VALIDATION
#' @include AllClasses.R
NULL

setValidity(
  Class = "OxCalOutput",
  method = function(object) {
    # Get data
    ocd <- object@ocd

    for (i in ocd) {
      name_warn <- if (is.null(i$name)) i$name else sprintf("%s - ", i$name)

      like_warn <- i$likelihood$warning
      if (!is.null(like_warn))
        warning(paste0(name_warn, like_warn), call. = FALSE)

      post_warn <- i$posterior$warning
      if (!is.null(post_warn))
        warning(paste0(name_warn, post_warn), call. = FALSE)
    }
  }
)

assert_exists <- function(x) {
  if (length(x) == 1 && !file.exists(x)) {
    stop(sprintf("%s does not exist.", x), call. = FALSE)
  }
  invisible(x)
}

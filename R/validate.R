# CLASSES VALIDATION
#' @include AllClasses.R
NULL

# OxCal ========================================================================
setValidity(
  Class = "OxCalFiles",
  method = function(object) {
    # Get data
    oxcal <- object@oxcal
    js <- object@js
    log <- object@log
    txt <- object@txt
    csv <- object@csv

    cnd <- list(
      arkhe::validate(arkhe::assert_length(oxcal, 1)),
      arkhe::validate(assert_exists(oxcal)),
      arkhe::validate(arkhe::assert_length(js, 1)),
      arkhe::validate(assert_exists(js)),
      arkhe::validate(arkhe::assert_length(log, 1)),
      arkhe::validate(assert_exists(log)),
      arkhe::validate(arkhe::assert_length(txt, 1)),
      arkhe::validate(assert_exists(txt)),
      arkhe::validate(arkhe::assert_length(csv, 1, empty = TRUE)),
      arkhe::validate(assert_exists(csv))
    )

    # Return cnd, if any
    arkhe::check_class(object, cnd)
  }
)

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

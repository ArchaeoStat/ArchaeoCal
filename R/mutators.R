# MUTATORS

# Helpers ======================================================================
oxcal_get_density <- function(x, prob = c("likelihood", "posterior")) {
  prob <- match.arg(prob, several.ok = FALSE)
  lapply(
    X = x$ocd[-1],
    FUN = function(x, prob) {
      years <- seq.int(
        from = x[[prob]]$start,
        by = x[[prob]]$resolution,
        length.out = length(x[[prob]]$prob)
      )
      if (length(years) == 0) years <- NULL
      list(x = years, y = x[[prob]]$prob, warning = x[[prob]]$warning)
    },
    prob = prob
  )
}
oxcal_get_names <- function(x) {
  vapply(
    X = x$ocd[-1],
    FUN = function(x) x$name %||% NA_character_,
    FUN.VALUE = character(1)
  )
}
oxcal_get_operation <- function(x) {
  vapply(X = x$ocd[-1], FUN = `[[`, FUN.VALUE = character(1), i = "op")
}
oxcal_get_type <- function(x) {
  vapply(X = x$ocd[-1], FUN = `[[`, FUN.VALUE = character(1), i = "type")
}
oxcal_get_bp_date <- function(x) {
  vapply(
    X = x$ocd[-1],
    FUN = function(x) x[["date"]] %||% NA_real_,
    FUN.VALUE = numeric(1)
  )
}
oxcal_get_bp_error <- function(x) {
  vapply(
    X = x$ocd[-1],
    FUN = function(x) x[["error"]] %||% NA_real_,
    FUN.VALUE = numeric(1)
  )
}
oxcal_get_agreement <- function(x) {
  vapply(
    X = x$ocd[-1],
    FUN = function(x) x$posterior$agreement %||% NA_real_,
    FUN.VALUE = numeric(1)
  )
}
oxcal_get_convergence <- function(x) {
  vapply(
    X = x$ocd[-1],
    FUN = function(x) x$posterior$convergence %||% NA_real_,
    FUN.VALUE = numeric(1)
  )
}

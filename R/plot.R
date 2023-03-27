# PLOT
#' @include AllGenerics.R
NULL

#' @export
#' @method plot OxCalOutput
plot.OxCalOutput <- function(x, likelihood = TRUE, posterior = TRUE,
                             warnings = TRUE,
                             col.likelihood = "grey", col.posterior = "blue",
                             lty.likelihood = "solid", lty.posterior = "dashed",
                             main = NULL, sub = NULL, ann = graphics::par("ann"),
                             axes = TRUE, frame.plot = FALSE,
                             panel.first = NULL, panel.last = NULL, ...) {
  ## Drop first element (general information)
  ocd <- as.data.frame(x)
  ocd <- ocd[ocd$type == "date" | ocd$type == "model", , drop = FALSE]
  n <- nrow(ocd)

  ## Graphical parameters
  if (length(col.likelihood) != n)
    col.likelihood <- rep(col.likelihood, length.out = n)
  if (length(col.posterior) != n)
    col.posterior <- rep(col.posterior, length.out = n)
  fill.likelihood <- grDevices::adjustcolor(col.likelihood, alpha.f = 0.5)
  fill.posterior <- grDevices::adjustcolor(col.posterior, alpha.f = 0.5)

  ## Open new window
  grDevices::dev.hold()
  on.exit(grDevices::dev.flush(), add = TRUE)
  graphics::plot.new()

  ## Set plotting coordinates
  xlim <- oxcal_range(x, na.rm = TRUE)
  ylim <- c(n, -0.5)
  graphics::plot.window(xlim = xlim, ylim = ylim)

  ## Evaluate pre-plot expressions
  panel.first

  ## Plot
  ages <- seq_len(n)
  # graphics::abline(h = ages, col = "grey")
  for (i in ages) {
    if (likelihood) {
      d <- ocd$likelihood[[i]]
      if (!is.null(d$x)) {
        yi <- (d$y - min(d$y)) / max(d$y - min(d$y)) * -1.5  + i
        graphics::polygon(d$x, yi, border = NA, col = fill.likelihood[i])
        graphics::lines(d$x, yi, lty = lty.likelihood, col = "black")
      }
      if (warnings && !is.null(d$warning)) {
        graphics::text(x = xlim[1L], y = i, adj = c(0, 0),
                       labels = d$warning, col = "red")
      }
    }
    if (posterior) {
      d <- ocd$posterior[[i]]
      if (!is.null(d$x)) {
        yi <- (d$y - min(d$y)) / max(d$y - min(d$y)) * -1.5 + i
        graphics::polygon(d$x, yi, border = NA, col = fill.posterior[i])
        graphics::lines(d$x, yi, lty = lty.posterior, col = "black")
      }
      if (warnings && !is.null(d$warning)) {
        graphics::text(x = xlim[1L], y = i + 0.5, adj = c(0, 0),
                       labels = d$warning, col = "red")
      }
    }
  }
  if (warnings) {
    w <- x@ocd[[1]]$posterior$warning
    if (!is.null(w)) {
      graphics::mtext(w, side = 3, line = c(1, 0), adj = 0, col = "red")
    }
  }

  ## Evaluate post-plot and pre-axis expressions
  panel.last

  ## Construct Axis
  if (axes) {
    graphics::axis(side = 1)
    graphics::mtext(ocd$name, side = 2, at = ages, las = 2, padj = 0)
  }

  ## Plot frame
  if (frame.plot) {
    graphics::box()
  }

  ## Add annotation
  if (ann) {
    xlab <- "Year CE"
    ylab <- NULL
    graphics::title(main = main, sub = sub, xlab = xlab, ylab = ylab, ...)
    graphics::mtext(text = x@ocd[[1]]$ref, side = 1, line = 3, adj = 1, cex = 0.7)
    graphics::mtext(text = x@calib[[1]]$ref, side = 1, line = 4, adj = 1, cex = 0.7)
  }

  invisible(x)
}

#' @export
#' @rdname plot
#' @aliases plot,OxCalOutput,missing-method
setMethod("plot", c(x = "OxCalOutput", y = "missing"), plot.OxCalOutput)

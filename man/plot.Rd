% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R, R/plot.R
\docType{methods}
\name{plot}
\alias{plot}
\alias{plot,OxCalOutput,missing-method}
\title{Plot OxCal Output}
\usage{
\S4method{plot}{OxCalOutput,missing}(
  x,
  likelihood = TRUE,
  posterior = TRUE,
  warnings = TRUE,
  col.likelihood = "grey",
  col.posterior = "blue",
  lty.likelihood = "solid",
  lty.posterior = "dashed",
  main = NULL,
  sub = NULL,
  ann = graphics::par("ann"),
  axes = TRUE,
  frame.plot = FALSE,
  panel.first = NULL,
  panel.last = NULL,
  ...
)
}
\arguments{
\item{x}{An \code{\linkS4class{OxCalOutput}} object.}

\item{likelihood}{A \code{\link{logical}} scalar: should likelihood be drawn?}

\item{posterior}{A \code{\link{logical}} scalar: should posterior distribution be
drawn?}

\item{warnings}{A \code{\link{logical}} scalar: should warnings be plotted?}

\item{col.likelihood, col.posterior}{A \code{\link{character}} string specifying the
color of the density.}

\item{lty.likelihood, lty.posterior}{A \code{\link{character}} string or \code{\link{numeric}}
value specifying the line type of the lines.}

\item{main}{A \code{\link{character}} string giving a main title for the plot.}

\item{sub}{A \code{\link{character}} string giving a subtitle for the plot.}

\item{ann}{A \code{\link{logical}} scalar: should the default annotation (title and x,
y and z axis labels) appear on the plot?}

\item{axes}{A \code{\link{logical}} scalar: should axes be drawn on the plot?}

\item{frame.plot}{A \code{\link{logical}} scalar: should a box be drawn around the
plot?}

\item{panel.first}{An an \code{expression} to be evaluated after the plot axes are
set up but before any plotting takes place. This can be useful for drawing
background grids.}

\item{panel.last}{An \code{expression} to be evaluated after plotting has taken
place but before the axes, title and box are added.}

\item{...}{Other \link[graphics:par]{graphical parameters} may also be passed as
arguments to this function.}
}
\value{
\code{plot()} is called it for its side-effects: it results in a graphic
being displayed. Invisibly returns \code{x}.
}
\description{
Plot OxCal Output
}
\examples{
\dontrun{
## Download OxCal
oxcal_configure()

## Calibrate 14C dates
cal <- oxcal_calibrate(
  names = c("X","Y"),
  dates = c(5000, 4500),
  errors = c(45, 35)
)

plot(cal)
}
}
\seealso{
Other OxCal tools: 
\code{\link{oxcal_calibrate}()},
\code{\link{oxcal_configure}()},
\code{\link{oxcal_execute}()},
\code{\link{oxcal_install}()},
\code{\link{oxcal_parse}()}
}
\author{
N. Frerebeau
}
\concept{OxCal tools}

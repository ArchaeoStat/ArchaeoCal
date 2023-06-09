% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/oxcal_configure.R
\name{oxcal_configure}
\alias{oxcal_configure}
\title{Setup OxCal}
\usage{
oxcal_configure(
  command = NULL,
  os = NULL,
  ask = TRUE,
  install_location = NULL,
  install_url = NULL,
  verbose = getOption("ArchaeoCal.verbose")
)
}
\arguments{
\item{command}{A \code{\link{character}} string specifying the path to the OxCal
directory.}

\item{os}{A \code{\link{character}} string specifying the operating system of the
workstation. It must be one of "\code{Linux}", "\code{Windows}" or "\code{Darwin}".
If \code{NULL} (the default), the operating system will be determined
automatically (see \code{\link[=Sys.info]{Sys.info()}}).}

\item{ask}{A \code{\link{logical}} scalar: if OxCal is not installed, should the user
be asked to download it?
If \code{FALSE} and \R is being used interactively, will raise an error if the
OxCal executable cannot be found.
If \code{FALSE} and \R is not being used interactively, will try to download
OxCal.}

\item{install_location}{A \code{\link{character}} string specifying the directory to
extract OxCal files to. It will be created if necessary
(see \code{\link[utils:unzip]{utils::unzip()}}).}

\item{install_url}{A \code{\link{character}} string specifying the url from which
OxCal could be installed.}

\item{verbose}{A \code{\link{logical}} scalar: should status updates be displayed?}
}
\value{
Invisibly returns the path to the OxCal executable.
}
\description{
Setup OxCal
}
\details{
Downloads the latest version of Oxcal (if needed) and sets the executable
path correctly.
}
\examples{
\dontrun{
## Download OxCal
oxcal_configure()

## Custom script
scr <- 'Plot()
 {
  Sequence("Sequence1")
  {
   Boundary("Begin");
   Phase("Phase1")
   {
    R_Date("Lab-1",5000,25);
    R_Date("Lab-2",4900,37);
   };
   Boundary("Between");
   Phase("Phase2")
   {
    R_Date("Lab-3",4800,43);
   };
   Boundary("End");
  };
 };'
out <- oxcal_execute(scr)
res <- oxcal_parse(out)

plot(res)
plot(res, likelihood = TRUE, posterior = FALSE)
plot(res, likelihood = FALSE, posterior = TRUE)
}
}
\seealso{
Other OxCal tools: 
\code{\link{oxcal_calibrate}()},
\code{\link{oxcal_execute}()},
\code{\link{oxcal_install}()},
\code{\link{oxcal_parse}()},
\code{\link{plot}()}
}
\author{
N. Frerebeau
}
\concept{OxCal tools}

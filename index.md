# ArchaeoCal

[![r-universe](https://archaeostat.r-universe.dev/badges/ArchaeoCal)](https://archaeostat.r-universe.dev)
[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)

## Overview

An R Interface to [OxCal](https://c14.arch.ox.ac.uk/oxcal.html) (Bronk
Ramsey 2009).

## Installation

You can install the latest version of **ArchaeoCal** from [our
repository](https://ArchaeoStat.r-universe.dev) with:

``` r
options(repos = c(CRAN = "https://cloud.r-project.org",
                  universe = "https://archaeostat.r-universe.dev"))

install.packages("ArchaeoCal")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("ArchaeoStat/ArchaeoCal")
```

## Usage

This example uses data available through the
[**ArchaeoData**](https://github.com/ArchaeoStat/ArchaeoData) package
which is available in a [separate
repository](https://archaeostat.r-universe.dev). **ArchaeoData**
provides OxCal input models.

``` r
## Install the latest version
install.packages("ArchaeoData", repos = "https://archaeostat.r-universe.dev")
```

``` r
## Load package
library(ArchaeoCal)

## Download and install OxCal
oxcal_configure()
```

``` r
## Construct the path to the OxCal script
path <- file.path("oxcal", "ksarakil", "ksarakil.oxcal")
file <- system.file(path, package = "ArchaeoData")

## Read the script from Bosch et al. 2015
scr <- readLines(file)

## Print
# cat(scr, sep = "\n")

## Execute
## /!\ this may take a while /!\
out <- oxcal_execute(scr, file = "path/to/my/results")

## Parse OxCal output
res <- oxcal_parse(out)
as.data.frame(res)
```

## References

Bronk Ramsey, Christopher. 2009. “Bayesian Analysis of Radiocarbon
Dates.” *Radiocarbon* 51 (1): 337–60.
<https://doi.org/10.1017/S0033822200033865>.

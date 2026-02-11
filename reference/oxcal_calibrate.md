# 14C Calibration with OxCal

14C Calibration with OxCal

## Usage

``` r
oxcal_calibrate(names, dates, errors, curve = "IntCal20")
```

## Arguments

- names:

  A [`character`](https://rdrr.io/r/base/character.html) vector
  specifying the names of the dates (e.g. laboratory codes).

- dates:

  A [`numeric`](https://rdrr.io/r/base/numeric.html) vector giving the
  BP dates to be calibrated.

- errors:

  A [`numeric`](https://rdrr.io/r/base/numeric.html) vector giving the
  standard deviation of the dates to be calibrated.

- curve:

  A [`character`](https://rdrr.io/r/base/character.html) string
  specifying the calibration curve to be used.

## Value

A [`list`](https://rdrr.io/r/base/list.html) with class `OxCalResults`
(see
[`oxcal_parse()`](https://archaeostat.github.io/archaeocal/reference/oxcal_parse.md)).

## See also

[`oxcal_execute()`](https://archaeostat.github.io/archaeocal/reference/oxcal_execute.md)

## Author

N. Frerebeau

## Examples

``` r
if (FALSE) { # \dontrun{
## Download OxCal
oxcal_configure()

## Calibrate 14C dates
cal <- oxcal_calibrate(
  names = c("X","Y"),
  dates = c(5000, 4500),
  errors = c(45, 35)
)

as.data.frame(cal)
} # }
```

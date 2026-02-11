# Read and Parse OxCal Output

Read and Parse OxCal Output

## Usage

``` r
oxcal_parse(path)

# S3 method for class 'OxCalOutput'
oxcal_parse(path)
```

## Arguments

- path:

  A [`character`](https://rdrr.io/r/base/character.html) string naming a
  JavaScript file which the data are to be read from (or a `list`
  returned by
  [`oxcal_execute()`](https://archaeostat.github.io/archaeocal/reference/oxcal_execute.md)).

## Value

A [`list`](https://rdrr.io/r/base/list.html) with class `OxCalResults`
containing the following elements:

- `ocd`:

  A [`list`](https://rdrr.io/r/base/list.html) of OxCal data which holds
  the ranges, probability distributions, etc. for each parameter.

- `model`:

  A [`list`](https://rdrr.io/r/base/list.html) of information about the
  model.

- `calib`:

  A [`list`](https://rdrr.io/r/base/list.html) of information about the
  calibration curve.

## References

<https://c14.arch.ox.ac.uk/oxcalhelp/hlp_analysis_file.html>

## Author

N. Frerebeau

## Examples

``` r
if (FALSE) { # \dontrun{
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

as.data.frame(res)
} # }
```

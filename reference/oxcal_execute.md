# Execute an Oxcal Script

Execute an Oxcal Script

## Usage

``` r
oxcal_execute(
  script,
  file,
  path = oxcal_path(),
  mcmc = NULL,
  verbose = getOption("ArchaeoCal.verbose"),
  ...
)
```

## Arguments

- script:

  A [`character`](https://rdrr.io/r/base/character.html) string of
  instructions for OxCal.

- file:

  A [`character`](https://rdrr.io/r/base/character.html) string naming a
  file (without extension) to write `script` to. Output files will be
  named after `file` and written to the same directory.

- path:

  A [`character`](https://rdrr.io/r/base/character.html) string giving
  the path to OxCal executable.

- mcmc:

  A [`character`](https://rdrr.io/r/base/character.html) string giving
  the name of the output file for the MCMC samples (without extension).
  It must match the `Name` argument of OxCal's
  [`MCMC_Sample()`](https://intchron.org/tools/oxcalhelp/hlp_commands.html)
  function. Only used if `script` contains the `MCMC_Sample()` command.

- verbose:

  A [`logical`](https://rdrr.io/r/base/logical.html) scalar: should R
  report extra information on progress?

- ...:

  Further parameters to be passed to
  [`system2()`](https://rdrr.io/r/base/system2.html).

## Value

A [`list`](https://rdrr.io/r/base/list.html) with class `OxCalOutput`
containing the following elements:

- `oxcal`:

  A [`character`](https://rdrr.io/r/base/character.html) string giving
  the path to the .oxcal file.

- `js`:

  A [`character`](https://rdrr.io/r/base/character.html) string giving
  the path to the .js file.

- `log`:

  A [`character`](https://rdrr.io/r/base/character.html) string giving
  the path to the .log file.

- `txt`:

  A [`character`](https://rdrr.io/r/base/character.html) string giving
  the path to the .txt file.

- `csv`:

  A [`character`](https://rdrr.io/r/base/character.html) string giving
  the path to the .csv file.

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

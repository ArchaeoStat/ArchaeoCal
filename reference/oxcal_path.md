# Get OxCal Executable Path

Get OxCal Executable Path

## Usage

``` r
oxcal_path(...)
```

## Arguments

- ...:

  Currently not used.

## Value

A [`character`](https://rdrr.io/r/base/character.html) string giving the
path to OxCal executable.

## Details

Defaults to the R user directory.

## See also

[`tools::R_user_dir()`](https://rdrr.io/r/tools/userdir.html)

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

# Configure OxCal

Configure OxCal

## Usage

``` r
oxcal_configure(
  path = oxcal_path(),
  os = NULL,
  install = TRUE,
  ask = interactive(),
  force = FALSE,
  verbose = getOption("ArchaeoCal.verbose"),
  ...
)
```

## Arguments

- path:

  A [`character`](https://rdrr.io/r/base/character.html) string
  specifying the path to the OxCal directory.

- os:

  A [`character`](https://rdrr.io/r/base/character.html) string
  specifying the operating system of the workstation. It must be one of
  "`Linux`", "`Windows`" or "`Darwin`". If `NULL` (the default), the
  operating system will be determined automatically (see
  [`Sys.info()`](https://rdrr.io/r/base/Sys.info.html)).

- install:

  A [`logical`](https://rdrr.io/r/base/logical.html) scalar: if OxCal
  binary is not found, should it be downloaded and installed?

- ask:

  A [`logical`](https://rdrr.io/r/base/logical.html) scalar: if OxCal is
  not installed, should the user be asked before downloading it?

- force:

  A [`logical`](https://rdrr.io/r/base/logical.html) scalar: if OxCal is
  already installed, should reinstallation be forced?

- verbose:

  A [`logical`](https://rdrr.io/r/base/logical.html) scalar: should R
  report extra information on progress?

- ...:

  Further arguments to be passed to
  [`oxcal_install()`](https://archaeostat.github.io/archaeocal/reference/oxcal_install.md).

## Value

`oxcal_configure()` is called for its side-effect. Invisibly returns the
path to the OxCal executable.

## Details

Downloads the latest version of Oxcal (if needed) and sets the
executable path correctly.

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

# Download and Install OxCal

Download and Install OxCal

## Usage

``` r
oxcal_install(
  target,
  source = "https://c14.arch.ox.ac.uk/OxCalDistribution.zip",
  verbose = getOption("ArchaeoCal.verbose"),
  ...
)
```

## Arguments

- target:

  A [`character`](https://rdrr.io/r/base/character.html) string
  specifying the directory to extract OxCal files to. It will be created
  if necessary (see
  [`utils::unzip()`](https://rdrr.io/r/utils/unzip.html)).

- source:

  A [`character`](https://rdrr.io/r/base/character.html) string
  specifying the url from which OxCal could be installed.

- verbose:

  A [`logical`](https://rdrr.io/r/base/logical.html) scalar: should R
  report extra information on progress?

- ...:

  Currently not used.

## Value

`oxcal_install()` is called for its side-effect. Invisibly returns the
path to the OxCal directory.

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

# Coerce to a Data Frame

Coerce to a Data Frame

## Usage

``` r
# S3 method for class 'OxCalResults'
as.data.frame(x, row.names = NULL, optional = FALSE, ...)
```

## Arguments

- x:

  A [`list`](https://rdrr.io/r/base/list.html) returned by
  [`oxcal_parse()`](https://archaeostat.github.io/archaeocal/reference/oxcal_parse.md).

- row.names:

  A [`character`](https://rdrr.io/r/base/character.html) vector giving
  the row names for the data frame description, or `NULL`.

- optional:

  A [`logical`](https://rdrr.io/r/base/logical.html) scalar. If `FALSE`
  then the names of the variables in the data frame are checked to
  ensure that they are syntactically valid variable names and are not
  duplicated.

- ...:

  Currently not used.

## Value

A [`data.frame`](https://rdrr.io/r/base/data.frame.html) with the
following columns:

- `name`:

- `operation`:

- `type`:

- `date`:

- `error`:

- `agreement`:

- `convergence`:

- `like_range`:

  A `list` giving the confidence intervals of the likelihood.

- `like_density`:

  A `list` giving the likelihood.

- `post_range`:

  A `list` giving the confidence intervals of the posterior probability.

- `post_density`:

  A `list` giving the posterior probability.

# Vignettes that depend on internet access/eavy computation are precompiled
old_wd <- setwd("./vignettes")
knitr::knit("aion.Rmd.orig", output = "aion.Rmd")
setwd(old_wd)

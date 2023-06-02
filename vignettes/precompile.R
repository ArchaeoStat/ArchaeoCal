# Vignettes that depend on internet access/eavy computation are precompiled
old_wd <- setwd("./vignettes")
knitr::knit("ArchaeoCal.Rmd.orig", output = "ArchaeoCal.Rmd")
setwd(old_wd)

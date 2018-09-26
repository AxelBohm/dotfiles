#!/usr/bin/r

if (is.null(argv) | length(argv)<1) {
  cat("Usage: installr.r pkg1 [pkg2 pkg3 ...]\n")
  q()
}

repos <- "http://cran.rstudio.com"

# lib.loc <- "/usr/local/lib/R/site-library" # need to be run as root
# install.packages(argv, lib.loc, repos)

# install into whatever default location R chooses
install.packages(argv, repos = repos)

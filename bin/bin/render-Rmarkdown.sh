#!/bin/bash
Rscript -e "library(rmarkdown);render('$1')"

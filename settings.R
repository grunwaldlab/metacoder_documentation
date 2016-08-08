# This file stores parameters shared by multiple Rmd files in this directory.

# shared settings
input_folder <- "raw_input"
output_folder <- "results"
output_format <- ".pdf"

# display
options(width = 120)
set.seed(1)

# Knitr settings
library(knitr)
opts_chunk$set(cache = TRUE, dev='png', fig.width = 7, fig.height = 7, warning = FALSE, message = FALSE, dpi = 300, cache.lazy=FALSE)

# Citation settings
library(knitcitations)
cite_options(max.names = 2)

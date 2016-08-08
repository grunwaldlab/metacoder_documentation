# This file stores parameters shared by multiple Rmd files in this directory.
input_folder <- "databases"
output_folder <- "results"
output_format <- ".pdf"
max_taxonomy_depth <- 4
min_seq_count <- NULL
just_bacteria <- TRUE
max_mismatch <- 10 # percentage mismatch tolerated in pcr
pcr_success_cutoff <- 0.80 # Used to subset for graphing
forward_primer = c("515F" = "GTGYCAGCMGCCGCGGTAA")
reverse_primer = c("806R" = "GGACTACNVGGGTWTCTAAT")
pcr_success_color_scale = c("red", "orange", "yellow", "green", "cyan")
options(width = 120)
set.seed(1)

# imports
library(metacoder)
library(knitr)

# Knitr settings
opts_chunk$set(cache = TRUE, dev='png', fig.width = 7, fig.height = 7, warning = FALSE, message = FALSE, dpi = 300, cache.lazy=FALSE)
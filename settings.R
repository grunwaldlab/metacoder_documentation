## ---- rendering_settings ----
# display
options(width = 100)
set.seed(1)
# Knitr
library(knitr)
library(grid)
opts_chunk$set(cache = TRUE, dev = 'png', fig.width = 7, fig.height = 7, warning = FALSE, message = FALSE, 
               dpi = 300, cache.lazy = FALSE, autodep = TRUE)
# Citations
library(knitcitations)
cite_options(max.names = 2)

## ---- io_settings ----
input_folder <- "raw_input"
output_folder <- "results"
output_format <- ".pdf"


## ---- database_comparison_settings ----
max_taxonomy_depth <- 4
min_seq_count <- NULL
just_bacteria <- TRUE
max_mismatch <- 10 # percentage mismatch tolerated in pcr
pcr_success_cutoff <- 0.90 # Used to subset for graphing
min_seq_length <- 1200 # Use to encourage full length sequences
forward_primer = c("515F" = "GTGYCAGCMGCCGCGGTAA")
reverse_primer = c("806R" = "GGACTACNVGGGTWTCTAAT")
pcr_success_color_scale = c("red", "orange", "yellow", "green", "cyan")

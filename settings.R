
## ---- rendering_settings ----
# Knitr settings
knitr::opts_chunk$set(echo = TRUE, warning = FALSE, autodep = TRUE,
                      dev = 'png', fig.width = 10, fig.height = 10,
                      cache.lazy = FALSE, fig.align = "center")
options(crayon.enabled = TRUE, tibble.max_extra_cols = 10)

# Citation options (might not be used)
library("knitcitations")
cite_options(citation_format = "pandoc", max.names = 3, style = "html", hyperlink = "to.doc")
bib <- read.bibtex("bibliography.bibtex")

# Knitr hooks
knitr::knit_hooks$set(
  hide_button = function(before, options, envir) {
    if (is.character(options$hide_button)) {
      button_text = options$hide_button
    } else {
      button_text = "Show solution"
    }
    block_label <- paste0("hide_button", options$label)
    if (before) {
      return(paste0(sep = "\n",
                    '<button class="btn btn-danger" data-toggle="collapse" data-target="#', block_label, '"> ', button_text, ' </button>\n',
                    '<div id="', block_label, '" class="collapse">\n'))
    } else {
      return("</div><br />\n")
    }
  },
  output = function(x, options){
    x <- gsub(x, pattern = "<", replacement = "&lt;")
    x <- gsub(x, pattern = ">", replacement = "&gt;")
    paste0(
      "<pre class=\"r-output\"><code>",
      fansi::sgr_to_html(x = x, warn = TRUE, term.cap = "256"),
      # ansistrings::ansi_to_html(text = x, fullpage = FALSE),
      "</code></pre>"
    )
  }
)

# Display settings
options(width = 100)

# Glossary settings
library(glossary)
gloss <- glossary(definitions_path = "_glossary_definitions.Rmd", glossary_path = "appendix--00--glossary.Rmd")

## ---- io_settings ----
input_folder <- "raw_input" # Where all the large input files are. Ignored by git. 
output_folder <- "results" # Where plots will be saved
output_format <- "pdf" # The file format of saved plots
pub_fig_folder <- "publication"
revision_n <- 1
result_path <- function(name) {
  file.path(output_folder, paste0(name, ".", output_format))
}
save_publication_fig <- function(name, figure_number) {
  file.path(result_path(name), paste0("revision_", revision_n), paste0("figure_", figure_number, "--", name, ".", output_format))
}


## ---- database_comparison_settings ----
size_range <- c(0.0004, 0.015) # The size range of nodes
label_size_range <- c(0.002, 0.05) # The size range of labels
all_size_interval <- c(1, 3000000) # The range of read counts to display in the whole database plots
pcr_size_interval <- c(1, 25000) # The range of read counts to display in the PCR plots
label_max <- 50 # The maximum number of labels to show on each graph
max_taxonomy_depth <- 4 # The maximum number of taxonomic ranks to show
min_seq_count <- NULL # The minimum number of sequeces need to show a taxon.
just_bacteria <- TRUE # If TRUE, only show bacterial taxa
max_mismatch <- 10 # Percentage mismatch tolerated in pcr
pcr_success_cutoff <- 0.90 # Any taxon with a greater proportion of PCR sucess will be excluded from the PCR plots
min_seq_length <- 1200 # Use to encourage full length sequences
forward_primer = c("515F" = "GTGYCAGCMGCCGCGGTAA")
reverse_primer = c("806R" = "GGACTACNVGGGTWTCTAAT")
pcr_success_color_scale = c(viridis::plasma(10)[4:9], "lightgrey")


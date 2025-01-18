return_iframe_chunk <- function(data, var) {
  chunk_hdr <- knitr::knit_expand(text = c("### Data from: '{{this_var}}'", "\n"),
                                  this_var = var)
  
  iframe_chunk <- make_iframe_from_url(var)
  
  knitr::knit_child(
    text = c(chunk_hdr, iframe_chunk),
    envir = environment(),
    quiet = TRUE
  )
}

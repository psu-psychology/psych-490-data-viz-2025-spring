make_iframe_from_url <- function(url_text="https://www.psu.edu") {
  assertthat::is.string(url_text)
  assertthat::assert_that(stringr::str_detect(url_text, "^https://"))
  
  component_1 <- paste0("<iframe src='", url_text, "'")
  component_2 <- paste0("width='640px' height='800px'></iframe>")
  paste0(component_1, component_2)
}

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
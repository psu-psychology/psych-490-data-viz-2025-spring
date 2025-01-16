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

make_img_markdown_from_url <- function(img_url = "https://www.psychologicalscience.org/redesign/wp-content/uploads/2015/12/TCD_fig_1.jpg") {
  assertthat::is.string(img_url)
  assertthat::assert_that(stringr::str_detect(img_url, "^https://"))
  
  component_1 <- paste0("![](")
  component_2 <- paste0(img_url, ")")
  paste0(component_1, component_2)
}


return_img_chunk <- function(i, df) {
  df_i <- df[i,]
  chunk_hdr <- knitr::knit_expand(text = c("### Figure from: ",df_i$url_to_src, "\n\n"))
  if (!is.na(df_i$url_to_figure)) {
    img_markdown <- make_img_markdown_from_url(df_i$url_to_figure)
  } else {
    img_markdown = "**No direct link to figure**"
  }
  body_txt <- paste0("**Analyst**: ", df_i$identifier, " | **Type**: ", df_i$source_type, "\n")
  selected_txt <- paste0("**Why selected**: ", df_i$why_selected)
  
  knitr::knit_child(
    text = c(chunk_hdr, img_markdown, body_txt, selected_txt),
    envir = environment(),
    quiet = TRUE
  )  
}

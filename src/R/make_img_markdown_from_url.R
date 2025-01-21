make_img_markdown_from_url <- function(img_url = "https://www.psychologicalscience.org/redesign/wp-content/uploads/2015/12/TCD_fig_1.jpg",
                                       lightbox = "{.lightbox}") {
  assertthat::is.string(img_url)
  assertthat::assert_that(stringr::str_detect(img_url, "^https://"))
  
  component_1 <- paste0("![](")
  component_2 <- paste0(img_url, ")", lightbox)
  paste0(component_1, component_2)
}

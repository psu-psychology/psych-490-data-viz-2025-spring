make_iframe_from_url <- function(url_text="https://www.psu.edu") {
  assertthat::is.string(url_text)
  assertthat::assert_that(stringr::str_detect(url_text, "^https://"))
  
  component_1 <- paste0("<iframe src='", url_text, "'")
  component_2 <- paste0("width='640px' height='800px'></iframe>")
  paste0(component_1, component_2)
}

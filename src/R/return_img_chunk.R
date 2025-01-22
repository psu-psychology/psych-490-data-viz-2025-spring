return_img_chunk <- function(i, df) {
  assertthat::is.number(i)
  assertthat::assert_that(i > 0)
  assertthat::assert_that(is.data.frame(df))
  
  df_i <- df[i,]
  chunk_hdr_txt <- paste0("### Figure ", i, "\n\n")
  chunk_hdr <- knitr::knit_expand(text = chunk_hdr_txt)
  
  if (!is.na(df_i$url_to_figure)) {
    img_markdown <- make_img_markdown_from_url(df_i$url_to_figure)
  } else {
    img_markdown = "**No direct link to figure**"
  }
  
  url_txt <- paste0("**Source**: <", df_i$url_to_src, ">\n")
  body_txt <- paste0("\n\n| Analyst | Source Type | Why Selected |\n|---|---|---|\n", 
  "| ", df_i$identifier, " | ", df_i$source_type, " | ", df_i$why_selected, " | ")
  comment_txt <- paste0("\n\n | Comments |\n|-----------|\n|", df_i$comment, "|\n\n")
  knitr::knit_child(
    text = c(chunk_hdr, url_txt, img_markdown, body_txt, comment_txt),
    envir = environment(),
    quiet = TRUE
  )  
}
make_save_ai_image <- function(prompt = "Nittany Lion",
                               size = "512x512") {
  img_url <- openai::create_image(prompt = prompt,
                       n = 1,
                       size = size, 
                       response_format = "url")
  img_url
}


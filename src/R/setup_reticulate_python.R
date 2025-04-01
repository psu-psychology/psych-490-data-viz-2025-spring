# Configure Python environment
# https://support.posit.co/hc/en-us/articles/1500012574101-Installing-Python-packages-in-Posit-Cloud

library(reticulate)
virtualenv_create("myenv")
use_virtualenv("myenv", required = TRUE)
virtualenv_install("myenv", c("pandas", "matplotlib", "numpy"))
library(quarto)
library(fs)

# Slides ------------------------------------------------------------------

quarto_render(
  input = "slides.qmd",
  output_file = "index.html"
)

quarto_render(
  input = "slides.qmd",
  output_file = "slides.html"
)

# Examples ----------------------------------------------------------------

# No branding -------------------------------------------------------------

# dir_delete("examples/website")
# quarto_create_project("examples/website", type = "website", no_prompt = TRUE)

# file_copy("examples/report.qmd", "examples/slides.qmd", overwrite = TRUE)
# file_copy("examples/report.qmd", "examples/website/index.qmd", overwrite = TRUE)

quarto_render("examples/report.qmd", output_format = "html")
quarto_render("examples/slides.qmd", output_format = "revealjs")
quarto_render("examples/website", output_format = "html")


# brand.yml ---------------------------------------------------------------

# dir_create("examples/brandyml")
# quarto_create_project("examples/brandyml/website/", type = "website", no_prompt = TRUE)

# file_copy("examples/report.qmd", "examples/brandyml/report.qmd", overwrite = TRUE)
# file_copy("examples/report.qmd", "examples/brandyml/slides.qmd", overwrite = TRUE)
# file_copy("examples/report.qmd", "examples/brandyml/website/index.qmd", overwrite = TRUE)
file_copy("examples/brandyml/_brand.yml", "examples/brandyml/website/_brand.yml", overwrite = TRUE)

quarto_render("examples/brandyml/report.qmd", output_format = "html")
quarto_render("examples/brandyml/slides.qmd", output_format = "revealjs")
quarto_render("examples/brandyml/website", output_format = "html")

# Open Slides -------------------------------------------------------------

browseURL("index.html")

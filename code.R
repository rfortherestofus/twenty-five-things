library(tidyverse)
library(rvest)
library(janitor)

read_html("https://en.wikipedia.org/wiki/List_of_FIFA_World_Cup_finals") |>
  html_elements("table") |>
  pluck(4) |>
  html_table() |>
  clean_names()

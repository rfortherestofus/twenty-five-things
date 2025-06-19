library(tidyverse)
library(sf)
library(gander)

portland_boundaries <- read_sf("data/portland_boundaries.geojson")
pps_elementary_schools <- read_sf("data/pps_elementary_schools.geojson")

st_join(pps_elementary_schools, portland_boundaries) %>%
  filter(!is.na(cityname)) %>%
  pull(school)

# Libraries and School Districts -----------------------------------------

library(sf)
library(tidyverse)
library(tidygeocoder)

# https://rlisdiscovery.oregonmetro.gov/datasets/da2229f19d854845ae6e164d4924fe7a_0/explore?location=45.547982,-122.660240,12.42

libraries <- read_sf("data/libraries.geojson")

libraries_one_mile_buffer <-
  libraries |>
  st_buffer(1 * 1609.34)


# https://nces.ed.gov/ccd/address.asp

# pps_elementary_schools <-
#   read_csv("data/sc091aow.csv") |>
#   filter(mstate09 == "OR") |>
#   filter(mcity09 == "PORTLAND") |>
#   filter(str_detect(schnam09, "ELEMENTARY")) |>
#   select(schnam09:mzip09) |>
#   set_names("school", "street_address", "city", "state", "zip_code") |>
#   geocode(
#     street = street_address,
#     city = city,
#     state = state,
#     postalcode = zip_code,
#     method = "iq"
#   )

# pps_elementary_schools |>
#   st_as_sf(coords = c("long", "lat"), crs = 4326) |>
#   write_sf("data/pps_elementary_schools.geojson")

pps_elementary_schools <- read_sf("data/pps_elementary_schools.geojson")

pps_elementary_schools_near_libraries <-
  pps_elementary_schools |>
  st_join(libraries_one_mile_buffer) |>
  mutate(has_nearby_library = if_else(is.na(NAME), FALSE, TRUE)) |>
  select(school, has_nearby_library)

portland_boundaries <- read_sf("data/portland_boundaries.geojson")

pps_elementary_schools_near_libraries |>
  ggplot() +
  geom_sf(data = portland_boundaries) +
  geom_sf(aes(color = has_nearby_library)) +
  theme_void()


ggsave(
  "plots/pps_elementary_schools.png",
  width = 6,
  height = 4,
  bg = "white"
)

# Maps -------------------------------------------------------------------

library(tidyverse)
library(tidycensus)
library(tigris)
library(scales)

median_income_by_county <-
  get_acs(
    geography = "county",
    variables = c(median_income = "B19013_001"),
    geometry = TRUE
  )

median_income_by_county |>
  shift_geometry() |>
  ggplot(aes(fill = estimate)) +
  geom_sf(linewidth = 0) +
  scale_fill_viridis_c(
    option = "B",
    labels = dollar_format(),
    name = NULL
  ) +
  theme_void()

ggsave(
  "plots/median-income-map.png",
  width = 6,
  height = 4,
  bg = "white"
)


# custom theme -----------------------------------------------------------

library(tidyverse)
library(palmerpenguins)
library(scales)

theme_dk <- function(base_family = "Inter Tight", base_size = 14) {
  theme_minimal(
    base_size = base_size,
    base_family = base_family
  ) +
    theme(
      panel.grid.minor = element_blank(),
      panel.grid.major = element_line(
        color = "grey90",
        linewidth = 0.5,
        linetype = "dashed"
      ),
      axis.ticks = element_blank(),
      axis.text = element_text(
        color = "grey50",
        size = rel(0.8)
      ),
      axis.title = element_blank(),
      plot.title.position = "plot",
      plot.title = element_text(
        face = "bold",
        size = rel(1.5)
      ),
      plot.subtitle = element_text(
        color = "grey40",
        size = rel(1.1)
      ),
      plot.caption = element_text(
        color = "grey50",
        margin = margin(t = 20)
      ),
      plot.margin = margin(10, 10, 10, 10),
      strip.text = element_text(
        color = "grey40",
        size = rel(0.9)
      ),
      panel.spacing = unit(2, "lines")
    )
}

penguins_bar_chart <-
  penguins |>
  drop_na(island, bill_length_mm) |>
  group_by(island) |>
  summarize(avg_bill_length = mean(bill_length_mm)) |>
  ungroup() |>
  mutate(avg_bill_length_formatted = number(avg_bill_length, accuracy = 0.1)) |>
  ggplot(aes(
    x = island,
    y = avg_bill_length
  )) +
  geom_col() +
  labs(
    title = "Average bill length of penguins by island",
    subtitle = "Data shown in millimeters",
    caption = "Source: {palmerpenguins} package"
  )

penguins_bar_chart

ggsave(
  "plots/penguins_bar_chart.png",
  width = 6,
  height = 4,
  bg = "white"
)

penguins_bar_chart +
  theme_dk()

ggsave(
  "plots/penguins_bar_chart-with-theme.png",
  width = 6,
  height = 4,
  bg = "white"
)

# update_geom_defaults ---------------------------------------------------

penguins_bar_chart +
  theme_dk(base_family = "IBM Plex Mono", base_size = 10) +
  geom_text(
    aes(label = avg_bill_length_formatted),
    vjust = 1.5,
    color = "white"
  )

ggsave(
  "plots/penguins_bar_chart-mono.png",
  width = 6,
  height = 4,
  bg = "white"
)

penguins_bar_chart +
  theme_dk(base_family = "IBM Plex Mono", base_size = 10) +
  geom_text(
    aes(label = avg_bill_length_formatted),
    vjust = 1.5,
    color = "white",
    family = "IBM Plex Mono"
  )

ggsave(
  "plots/penguins_bar_chart-mono-geom-text.png",
  width = 6,
  height = 4,
  bg = "white"
)

update_geom_defaults(
  geom = "text",
  aes(
    family = "IBM Plex Mono"
  )
)

penguins_bar_chart +
  theme_dk(base_family = "IBM Plex Mono", base_size = 10) +
  geom_text(
    aes(label = avg_bill_length_formatted),
    vjust = 1.5,
    color = "white"
  )

# rvest ------------------------------------------------------------------

library(tidyverse)
library(rvest)
library(janitor)

read_html("https://en.wikipedia.org/wiki/List_of_FIFA_World_Cup_finals") |>
  html_elements("table") |>
  pluck(4) |>
  html_table() |>
  select(-Ref.)

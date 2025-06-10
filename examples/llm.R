# Write code to show how to make a scatterplot with ggplot
library(ggplot2)
library(dplyr)
library(quarto)
# Create a simple scatterplot using ggplot2
data(mtcars)
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  labs(
    title = "Scatterplot of MPG vs Weight",
    x = "Weight (1000 lbs)",
    y = "Miles per Gallon (MPG)"
  ) +
  theme_minimal()

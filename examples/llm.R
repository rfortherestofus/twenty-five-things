# Write code to show how to make a scatterplot with ggplot
library(ggplot2)
library(dplyr)
library(quarto)
# Create a simple scatterplot using ggplot2
data(mtcars)
# Make each point in the scatterplot a different color depending on the mpg
ggplot(mtcars, aes(x = wt, y = mpg, color = cyl)) +
  geom_point()

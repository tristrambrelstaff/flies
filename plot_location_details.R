library(ggplot2)
library(map_data)

uk_map <- map_data(
  map = "world",
  region = "UK"
)

ggplot(
  data = uk_map,
  aes(
    x = long,
    y = lat,
    group = group
  )
) +
geom_polygon(
  colour = "grey",
  fill = "grey"
) +
coord_map(
  xlim = c(-6, 2),
  ylim = c(49.5, 56)
) +
geom_point(
  data = location_details,
  mapping = aes(
    x = Longitude,
    y = Latitude,
    group = NA
  )
)

library(readr)  # read_csv

location_details <-
  read_csv(
    "location-details.csv",
    na = character(),  # Prevent "" from being replaced by NA
    col_names = TRUE,
    col_types = list(
        Location = col_character(),
        Region = col_character(),
        Latitude = col_double(),   # Degrees
        Longitude = col_double(),  # Degrees
        Radius = col_integer()     # Metres
      )
    )
  

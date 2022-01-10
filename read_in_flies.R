library(readr)
library(magrittr)
library(purrr)

flies <-
  list.files(
    pattern = "Box-\\d+\\.csv"  # Need \\ because \ is the escape character in string as well as regex
  ) %>%
  map_df(
    ~read_csv(
      .,
      na = character(),  # Prevent "" from being replaced by NA
      col_names = TRUE,
      col_types = list(
        Box=col_integer(),
        Number = col_integer(),
        Location = col_character(),
        Date = col_date(),
        Order = col_character(),
        Family = col_character(),
        Species = col_character(),
        Sex = col_character(),
        Key = col_character(),
        Notes = col_character()
      )
    )
  )

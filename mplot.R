library(tidy_verse)
library(lubridate)

ggplot(
  ) +
  geom_bar(
    filter(
      flies,
      Species == "Tachina fera"  ### TEMP ###
    ),
    mapping = aes(
      x = month(Date)
    ),
    width = 1,         # Remove gaps between bars
    colour = "black",  # Outline colour of bars
    fill = "white"     # Fill colour of bars
  ) +
  scale_x_discrete(
    limits = month.abb  # Replace 1..12 by "Jan".."Dec"
  ) +
  scale_y_continuous(
    expand = expansion(
      mult = c(0.0, 0.15)  # Largest bar extends from x-axis to 0.15 from top
    ) 
  ) +
  theme(
    panel.background = element_rect(
       colour = "black",
       fill = "white"
    ),
    axis.title = element_blank(),
    axis.ticks = element_blank(),
    axis.text.y = element_blank()
  )
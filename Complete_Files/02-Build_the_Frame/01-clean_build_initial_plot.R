library(tidyverse)
library(ggplot2)

# Steps: 
  # start with data manip then mockup all of the plots

dat <- readRDS(file = "../02-Build_the_Frame//app-data//subregion_agg.rds")


# Recomend to hard code the inpputs first thene exchange later
clean_dat <- dat %>%
  select( !subregion1_name ) %>%
  filter( country_name == "Canada" & date >= "2020-01-01" & date <= "2020-12-31") %>%
  group_by(country_name,date) %>%
  summarise_all(sum) %>%
  select( country_name, date, "new_confirmed") %>%
  arrange(date)


ggplot( data = clean_dat, aes(y = new_confirmed, x = date, color= country_name) ) +
  geom_line(size = 1.5) +
  labs(color="Country Name") 

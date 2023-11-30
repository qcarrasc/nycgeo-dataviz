# originally from - https://github.com/mfherman/nycgeo
# installation for nycgeo - # install.packages("remotes")
                      # remotes::install_github("mfherman/nycgeo")
# libraries to import
library(nycgeo)
library(sf)
library(tidyverse) # accesses the Census Bureau's API
#### 
# this visualization creates the base map for 
nyc_boundaries(geography = 'tract')
nyc_tracts <- nyc_boundaries(
  geography = 'tract',
  filter_by = 'borough',
  region = c("brooklyn", "queens", "manhattan", "bronx", "staten island"),
  add_acs_data = TRUE
)
ggplot(nyc_tracts) +
  geom_sf() +
  theme_minimal() +
  labs(title = 'New York City: Census Tracts') #edit font and add date

# median household income
# alter sizing of the map
ggplot(nyc_tracts) +
  geom_sf(aes(fill = med_hhinc_est)) +
  scale_fill_viridis_c(
    name = "Income Scale (Estimate)",
  ) +
  theme_void() +
  theme(panel.grid = element_line(color = 'transparent')) +
  labs(title = "New York City: Median Annual Household Income Estimates")

# estimated income of NYC residents below the poverty line
  # alter sizing of the map
ggplot(nyc_tracts) +
  geom_sf(aes(fill = pop_inpov_pct_est)) +
  scale_fill_viridis_c(
    name = "Population",
  ) +
  theme_void() +
  theme(panel.grid = element_line(color = 'transparent'))+
  labs(title = "Population With Income Below Poverty Line")

# median age of new yorkers
ggplot(nyc_tracts) +
  geom_sf(aes(fill = med_age_est)) +
  scale_fill_viridis_c(
    name = 'Median Age Scale'
  ) +
  theme_void() +
  theme(panel.grid = element_line(color = 'transparent')) +
  labs(title = 'Median Age of New Yorkers')

# [DEBUG] --------------------------------------------------------
#comparison of the education levels [EDIT THIS SECTION] # change fill - create separate variable levels for education
ggplot(nyc_tracts) + 
  geom_sf(aes(fill = pop_prof_est)) +
  scale_fill_viridis_c(
    name = 'Percentage of Pop. w/ a Doctorate Degree'
  ) + 
  theme_void() +
  theme(panel.grid = element_line(color = 'transparent')) +
  labs(title = "Population With Doctorate Degree")


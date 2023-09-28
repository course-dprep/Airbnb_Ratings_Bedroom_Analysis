library(tinytex)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(readr)
library(stringr)

# dowloading datasets
url_listings <- 'http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2023-09-03/data/listings.csv.gz'
url_calendar <- 'http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2023-09-03/data/calendar.csv.gz'

# Read the CSV file directly from the URL
listings <- read_csv(url_listings)
calendar <- read_csv(url_calendar)

# remove $ sign from price and compute avg price per night for listings
calendar_avg_price_night <- calendar %>%
  mutate(price = as.numeric(str_replace_all(price, "[^0-9.]", ""))) %>%
  group_by(listing_id) %>% summarise(avg_price = mean(price, na.rm = TRUE))

# Merging listings with calendar_avg_price_night to get add a column
listings_merged <- left_join(listings, calendar_avg_price_night, by = c('id' = 'listing_id'))

# removing unnecessary variables (can be edited later, just an example)
listings_selected <- subset(listings_merged, select = c(id, host_id, avg_price, number_of_reviews, review_scores_rating, review_scores_accuracy, review_scores_cleanliness, review_scores_checkin, review_scores_communication, review_scores_location, review_scores_value, host_response_time, host_response_rate, host_acceptance_rate, host_is_superhost, host_total_listings_count, host_identity_verified, room_type, accommodates, bedrooms, host_since))

# Cleaning columns
listings_selected <- listings_selected %>% mutate(id = as.character(id))
listings_selected <- listings_selected %>% mutate(host_id = as.character(host_id))
listings_selected <- listings_selected %>% mutate(review_scores_rating = review_scores_rating * 20)
listings_selected <- listings_selected %>% mutate(review_scores_location = review_scores_location * 20)

# Removing all observations with less than 25 reviews (so individual opinions won't have to much of an impact)
listings_selected <- listings_selected %>%
  filter(number_of_reviews >= 25)
# Checking for duplicate listings
listings_selected %>% group_by(id) %>%
  filter(n()>1)
# Zooming in on variables
listings_selected %>% group_by(host_response_time) %>% summarise(mean(review_scores_communication))

ggplot_price_location <- ggplot(data = listings_selected,
                                aes(x = avg_price, y = review_scores_location)) + geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(x = "Average Price Per Night", y = "Review Score for Location") + 
  ggtitle("Scatter Plot of Average Price vs. Review Score (Location)")

ggplot_price_location

ggplot_location <- ggplot(data = listings_selected,
                          aes(x = review_scores_location)) +
  geom_density(fill = "lightblue") +
  labs(x = "Review Score for Location", y = "Density") +
  ggtitle("Density Plot of Review Scores (Location)")

ggplot_location
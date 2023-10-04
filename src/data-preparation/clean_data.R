# Loading in packages
library(tinytex)
library(tidyverse)

# Load in the variables created in the download_data.R file
listings <- read_csv("../../data/listings.csv")
calendar <- read_csv("../../data/calendar.csv")
reviews <- read_csv("../../data/reviews.csv")

# Removing all observations with less than 25 reviews (so individual opinions won't have to much of an impact)
listings <- listings %>% filter(number_of_reviews >= 25)

# remove $ sign from price and compute avg price per night for listings
calendar_avg_price_night <- calendar %>% mutate(price = as.numeric(str_replace_all(price, "[^0-9.]", ""))) %>%
  group_by(listing_id) %>%
  summarise(avg_price = mean(price, na.rm = TRUE))

# Merging listings with calendar_avg_price_night to get add a column
listings_merged <- left_join(listings, calendar_avg_price_night, by = c('id' = 'listing_id'))

# removing unnecessary variables (can be edited later, just an example)
listings_selected <- subset(listings_merged, select = c(id, host_id, avg_price, neighbourhood_cleansed, number_of_reviews, reviews_per_month, review_scores_rating, review_scores_accuracy, review_scores_cleanliness, review_scores_checkin, review_scores_communication, review_scores_location, review_scores_value, host_response_time, host_response_rate, host_acceptance_rate, host_is_superhost, host_total_listings_count, host_identity_verified, room_type, accommodates, bedrooms, host_since))

#Adding another column experience_of_host_in_years
listings_selected <- listings_selected %>%  mutate(experience_of_hosts_in_years = round(((listings$last_scraped-listings$host_since)/365),1))

# Cleaning columns
listings_selected <- listings_selected %>% mutate(id = as.character(id))
listings_selected <- listings_selected %>% mutate(host_id = as.character(host_id))
listings_selected <- listings_selected %>% mutate(review_scores_rating = review_scores_rating * 20)
listings_selected <- listings_selected %>% mutate(review_scores_accuracy = review_scores_accuracy * 20)
listings_selected <- listings_selected %>% mutate(review_scores_cleanliness = review_scores_cleanliness * 20)
listings_selected <- listings_selected %>% mutate(review_scores_checkin = review_scores_checkin * 20)
listings_selected <- listings_selected %>% mutate(review_scores_communication = review_scores_communication * 20)
listings_selected <- listings_selected %>% mutate(review_scores_location = review_scores_location * 20)
listings_selected <- listings_selected %>% mutate(review_scores_value = review_scores_value * 20)
listings_selected <- listings_selected %>% mutate(host_response_rate = as.numeric(str_replace_all(host_response_rate, "[^0-9.]", "")))
listings_selected <- listings_selected %>% mutate(host_acceptance_rate = as.numeric(str_replace_all(host_acceptance_rate, "[^0-9.]", "")))
listings_selected <- listings_selected %>% mutate(experience_of_hosts_in_years = as.numeric(sub(" days", "", experience_of_hosts_in_years)))

# Create dummy for listing in city center or not
listings_selected <- listings_selected %>% mutate(in_city_center = ifelse(neighbourhood_cleansed %in% c('Centrum-Oost', 'Centrum-West'), 1, 0))

# Adding a average price list by neigbourhood 

avgprice_by_neighbourhood <- listings_selected %>% group_by(neighbourhood_cleansed) %>% summarise(avg_price_neigbourhood = mean(avg_price, na.rm = TRUE))

# Merging listings with avgprice_by_neighbourhood to get add a column

listings_selected<- left_join(listings_selected, avgprice_by_neighbourhood, by = c("neighbourhood_cleansed" = "neighbourhood_cleansed"), suffix= c("neighbourhood","neigbouravgprice"))

# New Order for Seeing Avg_Price and Avg_Price_Neighbourhood Together

listings_selected<- listings_selected[,c(1:3,26,4:25)]

# Checking for duplicate listings
listings_selected %>% group_by(id) %>% filter(n()>1)

# Check uniqueneigbourhoods and check with tripadvisor data for further investigations
unique_neighborhoods <- unique(listings_selected$neighbourhood_cleansed)

# Saving the merged, cleaned and filtered dataset to the /data folder
write_csv(listings_selected, "../../gen/temp/listings_cleaned.csv")
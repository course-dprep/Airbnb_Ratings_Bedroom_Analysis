# Loading in packages
library(tinytex)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(readr)

# downloading and reading dataset
url_listings <- 'http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2023-09-03/data/listings.csv.gz'
listings <- read_csv(url_listings)

# removing unnecessary variables (can be edited later, just an example)
listings <- subset(listings, select = c(id, name, host_since, host_response_rate, host_acceptance_rate, host_is_superhost, price, host_listings_count, host_total_listings_count, host_identity_verified, room_type, accommodates, bedrooms, beds, minimum_nights))

# removing the dollar sign from price and making the value numeric
listings$price <- as.numeric(sub("\\$", "", listings$price))

# extracting the rating from the name variable
listings$extracted_rating <- str_extract(listings$name, "★[0-9]+\\.[0-9]+")
listings$extracted_rating <- as.numeric(sub("\\★", "", listings$extracted_rating))

# creating the bedrooms_per_person value (note: we can also use different variables for the same base idea)
listings$lbedrooms_per_person <- listings$accommodates / listings$bedrooms

# removing missing variables (note: this does not remove "N/A" variables, we can do that later)
listings <- na.omit(listings)
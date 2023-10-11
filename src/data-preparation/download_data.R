# Import packages
library(tidyverse)
library(here)

# downloading datasets
url_listings <- 'http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2023-09-03/data/listings.csv.gz'
url_calendar <- 'http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2023-09-03/data/calendar.csv.gz'
url_reviews <- 'http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2023-09-03/data/reviews.csv.gz'

# Read the CSV file directly from the URL
listings <- read_csv(url_listings)
calendar <- read_csv(url_calendar)
reviews <- read_csv(url_reviews)

# Creating the data folder
script_dir <- here::here()
folder_path <- file.path(script_dir, "data")
dir.create(folder_path)

# Save variables to csv files in raw data folder
write_csv(listings, "../../data/listings.csv")
write_csv(calendar, "../../data/calendar.csv")
write_csv(reviews, "../../data/reviews.csv")
# Loading in packages
library(tinytex)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(readr)

# loading in all datasets

# dowloading datasets
url_listings <- 'http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2023-09-03/data/listings.csv.gz'
url_calander <- 'http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2023-09-03/data/calendar.csv.gz'
url_reviews <-  'http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2023-09-03/data/reviews.csv.gz'

# Read the CSV file directly from the URL
listings <- read_csv(url_listings)
calander <- read_csv(url_calander)
reviews <-  read_csv(url_reviews)

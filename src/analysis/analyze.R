# Loading in packages
library(tinytex)
library(tidyverse)

# loading the dataset
listings <- read_csv('../../data/listings_cleaned.csv')

# ZOOMING IN ON THE VARIABLES #

# See categories for host_response_time
listings %>% group_by(host_response_time) %>% summarise(n())

listings %>% group_by(host_response_time) %>% summarise(mean(review_scores_communication)) # Not really suitable

ggplot(data = listings, aes(x = avg_price, y = review_scores_cleanliness)) +
  geom_point() + # Add points for the scatter plot
  geom_smooth(method = "lm", se = FALSE) + # Add a linear regression line (change method as needed)
  labs(x = "Average Price Per Night", y = "Review Score for Cleanliness") + # Add axis labels
  ggtitle("Scatter Plot of Average Price vs. Review Score (Cleanliness)") # Add a title

ggplot(data = listings, aes(x = avg_price, y = review_scores_location)) +
  geom_point() + # Add points for the scatter plot
  geom_smooth(method = "lm", se = FALSE) + # Add a linear regression line (change method as needed)
  labs(x = "Average Price Per Night", y = "Review Score for Location") + # Add axis labels
  ggtitle("Scatter Plot of Average Price vs. Review Score (Location)") # Add a title

# Difference in price between city center vs not
listings %>% group_by(in_city_center) %>% summarise(avg_price = mean(avg_price))

# Difference in location review score city center vs not
listings %>% group_by(in_city_center) %>% summarise(avg_score_location = mean(review_scores_location))

# Difference in overall review score city center vs not
listings %>% group_by(in_city_center) %>% summarise(avg_score = mean(review_scores_rating))

# Difference in overall review score for host is superhost vs not
listings %>% group_by(host_is_superhost) %>% summarise(avg_score = mean(review_scores_rating))

# Difference in checkin review score for host is superhost vs not
listings %>% group_by(host_is_superhost) %>% summarise(avg_score_checkin = mean(review_scores_checkin))
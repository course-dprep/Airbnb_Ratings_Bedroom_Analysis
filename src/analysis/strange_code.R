# the rest was already in the analyse file, I do not know whose code this is

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

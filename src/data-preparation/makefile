DATA = ../../data
TEMP = ../../gen/temp

all: $(TEMP)/listings_cleaned.csv $(TEMP)/data_exploration.html

$(DATA)/listings.csv $(DATA)/reviews.csv $(DATA)/calendar.csv: download_data.R
	R -e "dir.create('$(DATA)', recursive = TRUE)"
	R --vanilla < download_data.R

$(TEMP)/listings_cleaned.csv: $(DATA)/listings.csv $(DATA)/reviews.csv $(DATA)/calendar.csv clean_data.R
	R -e "dir.create('$(TEMP)', recursive = TRUE)"
	R --vanilla < clean_data.R
	
$(TEMP)/data_exploration.html: data_exploration.rmd $(DATA)/listings.csv
	R -e "dir.create('$(TEMP)', recursive = TRUE)"
	R -e "rmarkdown::render('data_exploration.rmd', output_dir='../../gen/temp')"
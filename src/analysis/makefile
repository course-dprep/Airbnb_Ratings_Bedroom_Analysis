DATA = ../../data
TEMP = ../../gen/temp
OUTPUT = ../../gen/output

all: $(TEMP)/testplot.pdf

$(TEMP)/testplot.pdf: $(TEMP)/listings_cleaned.csv analyze.R
	R --vanilla < analyze.R
OUTPUT = ../../gen/output

all: $(OUTPUT)/analysis.html

$(OUTPUT)/analysis.html: analysis.rmd
	R -e "dir.create('$(OUTPUT)', recursive = TRUE)"
	R -e "rmarkdown::render('analysis.rmd', output_dir='../../gen/output')"
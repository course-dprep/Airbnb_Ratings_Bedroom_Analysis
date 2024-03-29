[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-718a45dd9cf7e7f842a935f5ebbe5719a5e09af4491e668f4dbf3b35d5cca122.svg)](https://classroom.github.com/online_ide?assignment_repo_id=11726016&assignment_repo_type=AssignmentRepo)

# Space Matters: User Ratings and the Size of Airbnb Listings

This assignment will be about Airbnb and the relationship between two variables. More specifically, the variables that will be analyzed are the rating of the accommodation and the amount of bedrooms per person. In this README a reasoning will be given why we chose the two variables, the control variables, how we will go about analysing the data, and future uses for our created dataset.

<br>

# Research Motivation

The purpose of this project is to find out if the amount of bedrooms per person has a significant effect on ratings. We chose this variable as a proxy for size. Larger houses will likely have more bedrooms available for the people it accomodates. The question then becomes if people mind having more space to themselves, and whether this increases ratings. This is important to learn about travellers preferences on AirBnB. By looking into the relationship between bedrooms per person and the rating we will get some indication of where preferences lie.

<br>

# Research Question

- Does the number of bedrooms per person have a significant effect on accommodation ratings?

<br>

# Research Method

For this project, we will grab data from the InsideAirbnb project. More specifically, we will use listing scraping data, which we will prepare for analysis in RStudio. To test if bedrooms per person has a significant effect on accommodation ratings, we will employ a regression analysis based on a linear model. This will allow us to look into the relationship better and lets us include control variables. This linear model will have the following variables.

<br>

**Dependent variable:**

*Review_score_rating*

Found by looking into the name variable, it contains the rating of every accommodation. This is a variable that has values between 20 and 100. 

<br>

**Independent variable:**

*bedrooms_per_person*
    
The amount of bedrooms per person. More bedrooms may indicate that the house is nicer. Calculated by dividing bedrooms by accommodates.

<br>

**Control variables:**

**(We are not choosing number_of_reviews as a variable due to a minimum amount of reviews filter we already applied to our dataset. The minimum amount of reviews is 25.)**

*avg_price*

The price per night, expressed numerically, measured in dollars.

*host_response_rate*

The percentage of how fast the host response to its customers. Higher the response rate may indicate an higher accommodation rating.

*host_identity_verfied*

Measured by a dummy, whether a host has their identity verified. Non-verified hosts might be less trustworthy.

*experience_of_host_in_years*

The number of years the host works as a host. The higher the number of years of expirience, the more satisfied the customers, the higher the rating they will give.

*in_city_center*

Whether the accommodation is placed in the city center. If the accommodation is, the customer will be more satisfied with the location, which will conclude in a higher rating.
    
<br>

# Research Workflow

The structure of this research project consists of three stages. 

The first stage is getting the data. An Rscript gets the data from InsideAirBnB, and saves it to a local data folder it creates. 

The second stage is cleaning and preparing the data for analysis. Another Rscript processes the data, creates the neccesary variables, and makes sure all duplicates and NAs are removed. It then creates a new combined dataset in a new folder.

The third stage is analysing the data and presenting the results. An Rmarkdown file takes care of this process. It first defines the linear models, one for control and one with the variable of interest. Various graphs will be added for extra clarity about the data, along with descriptive statistics and the results of our models. The results will be rendered as an html file to ensure compatibility with kableExtra.

A make file will automate this process for others to run on their own computers.

*After completion, find the results in the output folder. \gen\output\analysis.html*

<br>

## Repository overview

```
- data
- gen
  - output
  - temp
- src
  - analysis
  - data-preparation
- .gitignore
- README.md
- makefile
```
<br>

## Dependencies

You can follow the general installation guides on http://tilburgsciencehub.com/.

- R. [Installation guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/r/).
- Make. [Installation guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/).
- Pandoc. [Latest release](https://pandoc.org/installing.html).
- [TeX distribution](https://tilburgsciencehub.com/get/latex/?utm_campaign=referral-short)

- For R, make sure you have installed the following packages:

```
install.packages("tidyverse")
install.packages("data.table")
install.packages("here")
install.packages("tinytex")
install.packages("svglite")
install.packages("devtools")
install.packages("tidyR")
install.packages("broom")
install.packages("corrr")
install.packages("rmarkdown")
```

- Install the patched version of kableExtra, to make sure the likelihood of errors is lowest. Use the code below, update all by going for option 1 when R studio asks for it:

```
devtools::install_github("kupietz/kableExtra")
```

- NOTE (as of 11/10/2023): svglite may give an error regarding binary and source versions. Install the binary version by clicking no on the prompt. This should be version 2.1.1.

<br>

## Guidline for Running 
### Step-by-step
To run the code, follow these instructions:
1. Fork this repository.
2. Open your command line / terminal and run the following code:
```
git clone https://github.com/course-dprep/Airbnb_Ratings_Bedroom_Analysis
```
3. Run the following command: make
```
make
```
4. When make has succesfully run all the code, it will generate the required html files for reaching the analysis of the project's conclusions.

5. To remove all newly created files and start over, run the following code in the command line / terminal: 
```
make clean
```

<br>

## Notes
- `make clean` removes all unncessary temporary files. 
- Tested under Windows 11, Windows 10, and MacOS
- Our output documents use html for better compatibility with kable
- IMPORTANT: In `makefile`, when using `\` to split code into multiple lines, no space should follow `\`. Otherwise Gnu make aborts with error 193. 
- Many possible improvements remain. Comments and contributions are welcome!

<br>

## Authors
Team 6: 
- [Volkan Selim Cantürk](https://github.com/vscanturk),        e-mail: v.s.canturk@tilburguniversity.edu 
- [Konstantinos Loizidis](https://github.com/Dinos-Ano),           e-mail: k.loizidis@tilburguniversity.edu 
- [Bram Teunissen](https://github.com/bram-teunissen),        e-mail: b.teunissen@tilburguniversity.edu
- [Tijl de Veer](https://github.com/TijldeVeer),     e-mail: t.deveer@tilburguniversity.edu 
- [Rik Verlaan](https://github.com/rikverlaan),         e-mail: r.verlaan@tilburguniversity.edu 


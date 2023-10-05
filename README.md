[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-718a45dd9cf7e7f842a935f5ebbe5719a5e09af4491e668f4dbf3b35d5cca122.svg)](https://classroom.github.com/online_ide?assignment_repo_id=11726016&assignment_repo_type=AssignmentRepo)

# Introduction

This assignment will be about Airbnb and the relationship between two variables. More specifically, the variables that will be analyzed are price and the rating of the accomodation. In this README a reasoning will be given why we chose the two variables, the control variables, which strategy we will follow, in order for this research to be used in the future. 

# 1.Research Motivation

Airbnb is a popular online marketplace and hospitality platform that enables individuals to list, discover, and book accommodations and lodging options in various locations around the world. It allows hosts to rent out their homes or spare rooms to travelers, providing a unique and often more affordable alternative to traditional hotels. The purpose of this project is to find out if the price per night has a significant effect on ratings. High pricing could reduce the perceived value of a property and lead to lower ratings. 

The findings will be relevant for customers of AirBnb that are interested in booking an accommodation. Ratings could be based on value, meaning that the highest ratings might not be found on the high-end of the pricing spectrum at all.

# 2.Research Question

- Does the number of bedrooms per person have a significant effect on accomodation ratings?

# 3.Method

- Still need to extend this part, but it gives a general idea of what I think would be nice to look into. Do not see this as final. For the data prep, we must also look into heteroskedasticity, missing values, etc.

For this project, we will grab data from the InsideAirbnb project. More specifically, we will use listing scraping data, which we will prepare for analysis in RStudio. The project is managed on Github. To test if the price per night has a significant effect on accomodation ratings, we will employ a linear model. This linear model will have the following variables.

Dependent variable:
  Review_score_rating
    Found by looking into the name variable, it contains the rating of every accomodation. This is a variable that has values between 20 and 100. 

Independent variable:
   bedrooms_per_person
    The amount of bedrooms per person. More bedrooms may indicate that the house is nicer. Calculated by dividing bedrooms by accommodates.

To make sure that the found effect is real and not actually a result of a missing factor, we are including control variables. There is no sweet spot for the number of control variables, so we will use that what the dataset provides us and what makes sense to include. 

Control variables:

*We are not choosing number_of_reviews due to that we already filtered that we only want in our dataset listings that have/ or higher than 25 reviews.

 avg_price
    The price per night, expressed numerically, measured in dollars.

  host_response_rate
    The percentage of how fast the host response to its customers. Higher the response rate may indicate an higher accomodation rating.

  host_identity_verfied
    Measured by a dummy, whether a host has their identity verified. Non-verified hosts might be less trustworthy.

  experience_of_host_in_years 
    The number of years the host works as a host. The higher the number of years of expirience, the more satisfied the customers, the higher the rating they will give.

  in_city_center
    Whether the accomodation is placed in the city center. If the accomodation is, the customer will be more satisfied with the location, which will conclude in a higher rating.
    



! We can also include things like the amount of beds, the amount of people a place can accomodate, etc. These three above are examples of what control variables we might want to use, and are not final. It is important we decide on the final model together. 

# Example of reproducible research workflow 

This is a basic example repository using Gnu make for a reproducible research workflow, as described in detail here: [tilburgsciencehub.com](http://tilburgsciencehub.com/). 

The main aim of this to have a basic structure, which can be easily adjusted to use in an actual project.  In this example project, the following is done: 
1. Download and prepare data
2. Run some analysis
3. Present results in a final pdf generated using LaTeX

## Dependencies
- R 
- R packages: `install.packages("stargazer")`
- [Gnu Make](https://tilburgsciencehub.com/get/make) 
- [TeX distribution](https://tilburgsciencehub.com/get/latex/?utm_campaign=referral-short)
- For the `makefile` to work, R, Gnu make and the TeX distribution (specifically `pdflatex`) need to be made available in the system path 
- Detailed installation instructions can be found here: [tilburgsciencehub.com](http://tilburgsciencehub.com/)


## Notes
- `make clean` removes all unncessary temporary files. 
- Tested under Linux Mint (should work in any linux distro, as well as on Windows and Mac) 
- IMPORTANT: In `makefile`, when using `\` to split code into multiple lines, no space should follow `\`. Otherwise Gnu make aborts with error 193. 
- Many possible improvements remain. Comments and contributions are welcome!

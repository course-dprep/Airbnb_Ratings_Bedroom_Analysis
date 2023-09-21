[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-718a45dd9cf7e7f842a935f5ebbe5719a5e09af4491e668f4dbf3b35d5cca122.svg)](https://classroom.github.com/online_ide?assignment_repo_id=11726016&assignment_repo_type=AssignmentRepo)

# Introduction

This assignment will be about Airbnb and the relationship between two variables. More specifically, the variables that will be analyzed are minimum_nights and accommodates. In this README a reasoning will be given why we chose the two variables, which strategy we will follow, in order for this research to be used in the future. 

# 1.Research Motivation

Airbnb is a popular online marketplace and hospitality platform that enables individuals to list, discover, and book accommodations and lodging options in various locations around the world. It allows hosts to rent out their homes or spare rooms to travelers, providing a unique and often more affordable alternative to traditional hotels. The purpose of this project is to find out if large groups are required to stay longer than smaller groups.

The findings will be relevant for customers of AirBnb that are interested in booking an accommodation. Some customers may be interested to book an accomodation for one person, however maybe the minimum number of nights required to stay is affected by this option. The same can be said about the opposite, when someone wants to book an accomodation but with a bigger group.

# 2.Research Question

- Does the number of people that a place can accommodate have a significant effect on the minimum number of nights required to stay?


# 3.Method
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

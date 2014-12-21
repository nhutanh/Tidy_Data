## Introduction

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.
The goal is to prepare tidy data that can be used for later analysis. 

## how to run
Source and run  on Rstudio

source('./run_analysis.R')\\
download.data()\\
run.analysis()\\

Or run on terminal window

run_analysis.R\\


#Result dataset
tidydata.txt\\

This assignment uses data from
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]

Notes Using function and library

library(plyr)

function factor and aggregate

# Steps
1.  Loading the data
2.  Read all the data into R
3.  Merge the data
4.  Extract Mean and SD and rename lable
5.  Tidy dataset
6.  Write into tidydata.txt


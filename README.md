---
title: "Readme"
author: "Song Liu"
date: "Tuesday, June 16, 2015"
output: html_document
---

Getting and Cleaning Data - Course Project
This is the description of run_analysis.R logics:

Download the dataset if it does not already exist in the working directory

Load the activity data, train and test data, and then merg train and test data into one big data set

Convert Activity column to factors with 6 levels and their names
Getting features

Assign column names

Subset dataset only take subject and activity, and columns with mean and std

Rename column names with easy to understand way

Getting the final tidy data with means of all features with each subject and activity

Output the tidy data to a text file
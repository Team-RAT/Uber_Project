# Uber_Project

The aim of this project was to answer the question "Is Uber of benefit to cities and if so, which UK city would most benefit from Uber operating there?".

Included in this project GitHub is the code created, graphs drawn and data sources used to analyse Uber's impact on UK cities.

## The 'data' Folder

Included in this folder are the excel and csv files of all data sources used in this project, and some additional ones intended for further study.

## The 'code' Folder

Included in this folder is all the code written to store and analyse data in this project the inner folders are listed and explained:

#### Tourism Plotting 

This includes a Jupyter Notebook file in which the python code used to create plots of the tourism spending (£million) in regions of the UK are plotted. One graph is plotted to show the tourism spending of towns in which Uber was introduced in 2015 and one for the regions in which Uber was not introduced in 2015 to see the if there is a difference between the two plots, indicating whether or not Uber influences this aspect of a town/city. 

#### Twitter Streamer

A python based twitter streamer to bring in live Uber-related tweets and create 2 word clouds, one based on negative sentiment word count, and one based on positive sentiment word count.

#### Reddit Sentiment

Python code written in Jupyter Notebook. Scrapes the reddit pages of UK cities/towns in which Uber is not yet operating to find comments about Uber. The sentiment of such comments in analysed to see whether it is positive or negative. 

#### Cities Clustering 

A python script written in Jupyter Notebook with the purpose of grouping cities based on economic metrics (taken from data file CityStats.csv). The K-Means method of SciKit Learn is used to group cities into 6 groups. 

#### SQL Queries

Queries were written to clean data of taxi licensing and unemployment rate of UK cities and towns for future use in python files. The files were imported from the data folder of this GitHub. For the Taxi Licensing tables created the following files were imported: 
* taxi2013.csv
* taxi2015-.csv
* taxi2017-.csv

And for the unemployment rate table the follwing file was imported:
* modelbasedunemploymentdata.csv

#### Unemployment Rates Plotly

This folder contains a Jupyter Notebook file. The python code contained imports the table created in the SQL query unemploymentsql.sql. It uses the groupings created in the Cities Clustering. Plots are created of how unemployment rates change over time for the cities in each group with and without Uber operating within them. 

## The 'graphs' Folder

Included in this folder are the following graphs:

* Line graphs displaying the changes in Tourism Spending generated from the Tourism Plotting code
* Word clouds displaying negative and positive tweet sentiment words
* Cluster graph of UK cities
* Line graphs of unemployment rates in different city groups

## Prerequisites

Python libraries required for code in this project:

```
numpy, matplotlib, plotly, pyodbc, os, re, PIL, pickle, WordCloud, pymongo, twython, vaderSentiment, pprint, urllib, json, pprint, pandas, sklearn
```

### Installing

Install Anaconda Distribution for Python.

To install python libraries, go into your command prompt and enter the following:

```
>pip install [library_name]
```

And repeat for all libraries.

To access Jupyter Notebook type:

```
>jupyter notebook
```

## Built With

* [Python](https://www.python.org/) - The language used to create the twitter streamer, reddit scraper and plotly graphs 
* [Microsoft SQL Server](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms) - SQL based database used to clean data for unemployment rate data to by imported into python code
* [MongoDB](https://www.mongodb.com/) - Database used to store results of twitter streamer

## Authors

* **Adi** 
* **Rachel** 
* **Tabi** 

## Acknowledgments

* Lawrence Freeman

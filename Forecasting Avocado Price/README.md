# Forecasting Avocado Price
![Forecasting Avocado Price]https://github.com/bellaforjob/Data-Science-Project/blob/master/pics/GlobalAvo.jpg
## Introduction 
#### Avocado is known as ‘Green Gold’ in world trade.  Avocados are a great source of vitamins C, E, K, and B-6, as well as riboflavin, niacin, folate, pantothenic acid, magnesium, and potassium. They also provide lutein, beta-carotene, and omega-3 fatty acids. Although most of the calories in an avocado come from fat, but that fat is very healthy, especially Hass avocados. 
#### Hass avocados are higher in fat than other varieties, which gives them a richer taste and smoother, creamier texture. The taste, benefit of health and food culture make avocados become an important food/fruit to people around the world. It is the main daily food in South America. In most recent years, the avocado sales market is increasing in Asia as well. 
#### Since the avocados market is important to the world, I’d like to forecast avocado prices in the future. I am going to use the dataset of US sales reports from 2015 to 2018 to implement the research.


## Dataset 
#### I use avocados price dataset including the price from 2015 to 2018,  Time Series will be the basic technique type in the project.
#### Data source: https://www.kaggle.com/neuromusic/avocado-prices
#### Some relevant columns in the dataset:
##### --Date - The date of the observation
##### --AveragePrice - the average price of a single avocado
##### --type - conventional or organic
##### --year - the year
##### --Region - the city or region of the observation
##### --Total Volume - Total number of avocados sold
##### --4046 - Total number of avocados with PLU 4046 sold
##### --4225 - Total number of avocados with PLU 4225 sold
##### --4770 - Total number of avocados with PLU 4770 sold

## Installation
#### Prophet
! pip install fbprophet

#### pmdarima
! pip install pmdarima


## Getting start 

#### .Data analysis 
#### .Data wrangling: Collect data. Clean the dataset and address issues like missing values and outliers. Apply data wrangling techniques:Panda and numpy.
#### .Data storytelling: Ask questions about and explore data, identifying trends, correlations and making hypotheses. Using text and plots to communicate and present insights.
#### .Statistic data analysis : Identify variables in the data to answer to a project question.Identify strong correlations between pairs of independent variables or between an independent and a dependent variable. Identify the most appropriate tests to use to analyze relationships between variables.
#### .In-Depth analysis: Identifying which supervised and unsupervised learning techniques are best suited for your Capstone Project data.  Utilize supervised and unsupervised learning techniques to build  predictive models. 

#### Forecasting:
##### There are two types of avocado: conventional and organic, in this part, I will focus on conventional avocado's price in the total US. Forecast conventional avocado's price from the 3 ways to compare the result:
###### 1. Prophet
###### 2. ARIMA
###### 3. EMA

#### Steps:
##### Collect and organize information on Date and Average Price; 
##### Forecast the avocado price in the future with 3 different models separately.
##### Compare the results.
##### Rank and recommend.
##### Evaluate and test.


## Conclustion

#### Through the above data analysis,  I obtained corresponding analysis results by analyzing prices and sales volume, sales volume of products by category, organic and non-organic sales volume and price, and combining four-year data to sales volume within one year .

### Forecasting Result:
#### hree of the predictions show the similar result. EMA responds quickly to any factor’s change, better than ARIMA in this project, Prophet  shows more details, clearest average price trend. In this project, the Prophet gives the best forecasting.
#### Combining three models above, the average price of conventional avocados will be frequency oscillation go up  in the future. 


## Author 
### Bei Wang

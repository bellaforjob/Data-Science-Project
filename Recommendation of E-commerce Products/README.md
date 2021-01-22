# Recommendation of E-commerce Products

![Recommendation of E-commerce Products](https://github.com/bellaforjob/Data-Science-Project/blob/master/pics/ecommerce.jpg)
## Introduction 
#### E-commerce provides a huge market to the enterprises, compared to traditional trade, E-commerce is easier and lower investment, so it attracted countless people to join the business, but meanwhile, it increases the competition to each other. To customers, e-commerce is the most convenient way to shop. In some areas where the epidemic has occurred, online shopping is also the only way to avoid infection through contact. Although e-commerce is so convenient, after all, it has the limitations of online browsing after all:
#### Miss your favorite product.
#### Miss products which you may be interested in.
#### Missed the upgraded version of the purchased products, or reduced the price.
#### Missing the surrounding goods of the purchased/viewed products.
#### Lack of personal service experience.
#### Lack of loyalty.
#### In summary, the recommendation system came into being. It provides solutions to all the above problems and gives users a better shopping experience. This project is a sample to show how to create a recommentdation system and how does it works.

## Dataset 
#### I used a data set that describes the on-line products been view or sale by E-commerce events in a large multi category store: eCommerce behavior data from a large multi-category store (https://www.kaggle.com/mkechinov/ecommerce-behavior-data-from-multi-category-store)

## Getting start 
#### Data analysis 
#### .Data wrangling: Collect data. Clean the dataset and address issues like missing values and outliers. Apply data wrangling techniques:Panda and numpy.
#### .Data storytelling: Ask questions about and explore data, identifying trends, correlations and making hypotheses. Using text and plots to communicate and present insights.
#### .Statistic data analysis : Identify variables in the data to answer to a project question.Identify strong correlations between pairs of independent variables or between an independent and a dependent variable. Identify the most appropriate tests to use to analyze relationships between variables.
#### .In-Depth analysis: Identifying which supervised and unsupervised learning techniques are best suited for your Capstone Project data.  Utilize supervised and unsupervised learning techniques to build  predictive models. 
#### Recommendation:
#### In this project, recommendation system implemented by collaborative filtering from item based with SVD algorithem and KNN algorithem. In the three customer behaviors, ‘View’ collects most data in 3 events, so I will focus on 'view' to do analysis. The steps to do recommendations as below:

#### Collect and organize information on users and products; focus on products which have been ‘view’.
#### Compare items that have been viewed by user A and other users.
#### Create a function that finds products that user A has not viewed, but which similar users have.
#### Rank and recommend.
#### Evaluate and test.


## Conclustion

#### After run data analysis, we know the most popular category of this large multiple E-commerce is electrical smartphone, brands are Samsung, Apple, Xiaomi and Huawei. Customers like to view multiple times before buying, if they familiarize themselves with the product, they may directly buy it without view. However, people spend a lot of time viewing products, compared to the lower purchase ratio, we need to concerent how to increase purchase numbers and shorter the customer view time on irrelevant products.Recommendation will help customers stop wasting time on irrelevant products viewing, but spend time on system recommended products that he/she may likes.

#### And then run recommendation system, we will get a array of product's index. It means the products of array are the similar. If one product has been viewd, we can recommendate the rest product in array to the customers.

## Author 
#### Bei Wang

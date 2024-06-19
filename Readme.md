# E Commerce Salesdata SQL Analysis
![E-Commerce](https://leverageedu.com/blog/wp-content/uploads/2020/05/e-commerce-.jpg)

## Overview
This project involves the analysis of e-commerce data using SQL. The goal is to derive meaningful insights and trends from the dataset, which includes details about customers, orders, order details, products, and payments. The analysis was conducted using a series of SQL queries to explore various aspects of the sales data.

## Process

### 1. Data Preparation:
- Created and selected the database.
- Checked and described the tables to understand their structure.


### 2. Data Analysis:

- Cross-joined the Customers and Orders tables to print all columns from both tables, filtering rows where CustomerID matches and ordering by CustomerID and OrderID.
- Retrieved all columns from the Orders table except PaymentID and ShipperID for customers whose CustomerID is a multiple of 5, ordered by OrderID.
- Listed the details of customers whose total spending across all orders is greater than 350,000, ordered by total spent and CustomerID.
- Counted orders and total transaction value for each payment method, ordered by PaymentID.
- Analyzed the count of orders and total revenue generated from each city in India, ordered by city names.
- Identified the top 10 customers by total amount spent across all orders.
- Divided cities into revenue buckets based on total revenue generated from customers, considering cities with revenue greater than 15,000,000.
- Identified customers above age 65 who spent the most amongst their countrymen.
- Calculated total revenue made across each month in 2020 and printed the previous month name, previous month revenue, and the revenue difference for each row.
- Summarized total orders placed from selected countries (India, Italy, Australia, United States, Belgium, and Greece) for the years 2020 and 2021, ordered by year.

### 3. Insights:

- Total Orders: Counted the total number of orders placed.
- Revenue Analysis: Calculated total revenue and identified top revenue-generating customers and cities.
- Customer Patterns: Analyzed the distribution of orders and spending by customers.
- Category Insights: Explored category-wise distribution of orders and contribution to revenue.
- Trends Over Time: Analyzed cumulative revenue and monthly revenue trends.
- Top Performers: Identified top-performing customers and their contribution to overall revenue

### 4.Tools Used
- SQL: For database creation, data manipulation, and complex query execution.
- Database Management System: MySQL for executing SQL queries and managing the database


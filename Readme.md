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

### 5. Key Queries:

#### Customers with Total Spending Greater than 350,000
- This query identifies customers who have spent more than 350,000 across all their orders.
- ![Screenshot 2024-06-19 200052](https://github.com/bairagineha/E-Commerce-data-SQL-Analysis/assets/151651884/26216f6a-d3b9-4dbf-a0b5-81dc1903b285)

### Top 10 Customers by Total Spending
- This query identifies the top 10 customers based on their total spending across all orders. It also provides the number of orders placed and the total quantity of products ordered for each customer. The - results are ordered by total spending in descending order
- ![Screenshot 2024-06-19 201054](https://github.com/bairagineha/E-Commerce-data-SQL-Analysis/assets/151651884/8ba5a773-fb37-4465-a5a7-2373ac36b4c4)


### Monthly Revenue and Difference for 2020
- This query calculates the total revenue made across each month in 2020 and shows the revenue difference from the previous month.
- ![Screenshot 2024-06-19 200445](https://github.com/bairagineha/E-Commerce-data-SQL-Analysis/assets/151651884/649e371b-fb10-484e-8b94-08cbdda7a192)





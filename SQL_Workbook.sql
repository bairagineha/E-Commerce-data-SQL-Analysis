create database e_commerce;
use e_commerce;

-- 1. Cross join the Customers and Orders table. Print all columns from both the tables.
-- Filter the rows to get records for which the customerID from customers table is equal to the CustomerID from Orders table.
--  Order your output in ascending order of CustomerID. For rows with same customerID, order them in ascending order of OrderID.
 
select * from 
 customers c
 cross join orders o
 on c.customerid = o.customerid
 WHERE c.CustomerID = O.CustomerID
ORDER BY c.CustomerID, O.OrderID;

 
-- 2.Print the all columns from the Orders table except the PaymentID and ShipperID Columns. 
-- Filter your records to include only those customers whose CustomerID is a multiple of 5. Order your output in ascending order of OrderID.

SELECT 
  OrderID, 
  CustomerID, 
  str_to_date(OrderDate,'%Y-%m-%d') as orderdate,
   str_to_date(shipdate,'%Y-%m-%d') as shipdate,
 str_to_date(deliveryDate,'%Y-%m-%d') as deliverydate,
 total_order_amount
FROM 
  Orders
WHERE 
  CustomerID % 5 = 0
ORDER BY 
  OrderID ASC;

  
 -- 3.Print the details of customers (CustomerID, FirstName, LastName, City) along with the sum of their spending across all the orders
 --  they placed, for those customers whose total spent is greater than 350000. Order your output in descending order of Total Spent,
 --  for records with same Total Spent, sort such records in ascending order of CustomerID.

  SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.City,
    SUM(o.total_Order_Amount) AS TotalSpent
FROM
    Customers c
JOIN
    Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID, c.FirstName, c.LastName, c.City
HAVING
    TotalSpent > 350000
ORDER BY
    TotalSpent DESC, c.CustomerID ASC;

    
-- 4.Print the Count of orders and total transaction value for each Payment method (include those that are not allowed as well).
-- Order your output in ascending order of PaymentID.

select p.PaymentID,p.PaymentType,
count( p.PaymentID ) as Num_of_Purchases,
sum(o.Total_order_amount) as total_Amount
from payments p
left join orders o
on p.PaymentID=o.PaymentID
group by p.PaymentID,p.PaymentType;


-- 5.Get the count of orders placed from each city and also get the total revenue generated from that city.
 -- Print the states along with the city names. Filter only cities from the country India. Order by alphabetical order of City names.

 SELECT
    c.Country,
    c.State,
    c.City,
    COUNT(DISTINCT o.OrderID) AS Order_Count,
    SUM(o.total_Order_Amount) AS Total_Revenue
FROM
    Customers c
JOIN
    Orders o
    ON c.CustomerID = o.CustomerID
WHERE
    c.Country = 'India'
GROUP BY
    c.Country, c.State, c.City
ORDER BY
    c.City ASC;

 
-- 6.Print CustomerID, Customer Full Name (with a single space in between first name and last name),
 -- number of orders ordered, total amount spent across all orders (consider Total Order Amount), 
-- Total product quantity (irrespective of the product ID).
--  Identify top 10 customers according to decreasing order of Total spend.
 
SELECT
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS FullName,
    COUNT(DISTINCT o.OrderID) AS Number_Of_Orders,
    SUM(o.total_order_Amount) AS Total_Amount_Spent,
    SUM(od.Quantity) AS Total_Quantity
FROM
    Customers c
JOIN
    Orders o 
    ON c.CustomerID = o.CustomerID
JOIN
    OrderDetails od
    ON o.OrderID = od.OrderID
GROUP BY
    c.CustomerID, c.FirstName, c.LastName
ORDER BY
    Total_Amount_Spent DESC
LIMIT 10;


-- 7.Divide the different cities the customers belong to according to the total revenue 
-- generated from customers of those cities (consider Total Order Amount to calculate revenue here) into 3 different buckets.
 -- Let the cities with most revenue be allotted bucket number 1 and so on.
--  Only consider those cities who have revenue generated greater than 15000000. 

with bucket as (SELECT
        c.CustomerID,c.City,c.state,c.country,
sum(od.Quantity*p.Sale_Price) as revenue
 from customers c
left join orders o
 on c.CustomerID=o.CustomerID
 left join orderdetails od
 on o.OrderID=od.OrderID
 left join products p
 on od.ProductID=p.ProductID
GROUP BY
    c.CustomerID,c.City,c.state,c.country )
    select city,state,country,revenue,ntile(3) over(order by revenue desc) as ranking
    from bucket
    where revenue>15000 ;


    -- 8.Identify customers from each country who spent the highest amongst their country men and are aged above 65 (not equal to).
  -- Print their CustomerID, Full Name (FirstName and LastName are to be separated by a space),
   -- City, State, Country, Age and Total Spend (Calculate using Total Order Amount).
    -- Order your output in ascending order of CustomerID.
    
    with countrymen as (SELECT
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS FullName,
    c.City,
    c.State,
    c.Country,
     timestampdiff(year,cast(date_of_birth as date),curdate()) as age,
    SUM(o.total_order_Amount) AS TotalSpend
FROM
    Customers c
JOIN
    Orders o 
    ON c.CustomerID = o.CustomerID

GROUP BY
    c.CustomerID, c.FirstName, c.LastName, c.City, c.State, c.Country,
    timestampdiff(year,cast(date_of_birth as date),curdate())
ORDER BY
    c.CustomerID ASC)
    select * from countrymen 
    where age>65;

    
    -- 9.For the year 2020, calculate the total revenue made across each month (Use Total Order Amount),
    -- then print the following table which gets previous month name and previous month revenue for each row.
    -- Also get the difference in the revenue of the current month and the previous months in a new column.
    -- Order your output in calendar order of Month names.
    
SELECT
    MonthName,
    TotalRevenue,
    COALESCE(LAG(TotalRevenue, 1) OVER (ORDER BY MonthNumber), 0) AS PreviousMonthRevenue,
    TotalRevenue - COALESCE(LAG(TotalRevenue, 1) OVER (ORDER BY MonthNumber), 0) AS RevenueDifference
FROM (
    SELECT
        MONTH(STR_TO_DATE(OrderDate, '%Y-%m-%d')) AS MonthNumber,
        MONTHNAME(STR_TO_DATE(OrderDate, '%Y-%m-%d')) AS MonthName,
        SUM(Total_order_amount) AS TotalRevenue
    FROM
        Orders
    WHERE
        YEAR(STR_TO_DATE(OrderDate, '%Y-%m-%d')) = 2020
    GROUP BY
        MONTH(STR_TO_DATE(OrderDate, '%Y-%m-%d')),
        MONTHNAME(STR_TO_DATE(OrderDate, '%Y-%m-%d'))
) AS MonthlyRevenue
ORDER BY
    MonthNumber;    


-- 10.Print a summarized view of total orders placed from India, Italy, Australia, United States, Belgium
 -- and Greece for the Years 2020 and 2021.
 -- Order your output in ascending order of Year.
 
   WITH FilteredOrders AS (
  SELECT 
    o.OrderID,
    o.CustomerID,
    STR_TO_DATE(o.OrderDate, '%Y-%m-%d') AS OrderDate
  FROM 
    Orders o
  WHERE
    YEAR(STR_TO_DATE(o.OrderDate, '%Y-%m-%d')) IN (2020, 2021)
),
OrderSummary AS (
  SELECT 
    fo.OrderID,
    c.Country,
    YEAR(fo.OrderDate) AS OrderYear
  FROM
    FilteredOrders fo
  JOIN
    Customers c ON fo.CustomerID = c.CustomerID
  WHERE
    c.Country IN ('India', 'Italy', 'Australia', 'United States', 'Belgium', 'Greece')
)
select os.country,os.orderYear,
count(distinct os.orderid) as Total_orders
FROM
    OrderSummary os
GROUP BY
    os.Country, os.OrderYear
ORDER BY
    os.OrderYear, os.Country;

    







    
    

-- Basic SQL Code
-- Practice them with Maventoys dataset 

--SELECT 
--Select all columns from table
SELECT * FROM `sql-training-314708.maventoys.sales`;

--Row subsetting: LIMIT to top 1000 results
SELECT * FROM `sql-training-314708.maventoys.sales` LIMIT 1000;

--Select Sale_ID and Date from sales 
SELECT sale_ID, Date FROM `sql-training-314708.maventoys.sales`;

--Aggregation functions
--Count the number of store ID
SELECT COUNT(Store_ID)
FROM `sql-training-314708.maventoys.sales`;

--Count unique number of store ID 
SELECT COUNT(DISTINCT Store_ID)
FROM `sql-training-314708.maventoys.sales`;

--Get unique list of store ID
SELECT DISTINCT Store_ID
FROM `sql-training-314708.maventoys.sales`;

-- Get total of units sold from sales table
SELECT SUM(Units)
FROM `sql-training-314708.maventoys.sales`;

-- Get sum, min, max, average units sold from sales 
SELECT SUM(Units), MAX(Units), MIN(Units), AVG(Units)
FROM `sql-training-314708.maventoys.sales`;

-- Get sum, min, max, average units sold from sales. With proper field names
SELECT SUM(Units) AS Total , MAX(Units) AS Maximum, MIN(Units) AS Minimum, AVG(Units) AS Av
FROM `sql-training-314708.maventoys.sales` ;

-- Filtering data with WHERE clause
-- Get all records from store number 10
SELECT *
FROM `sql-training-314708.maventoys.sales`
WHERE Store_ID = '10';

-- Get total units sold  from store number 15 or 22
SELECT SUM(Units)
FROM `sql-training-314708.maventoys.sales`
WHERE Store_ID = '15' OR Product_ID = '22';

-- Get total units sold on 1st Jan 2017 and from store number 15 or 22
SELECT SUM(Units)
FROM `sql-training-314708.maventoys.sales`
WHERE Date = '2017-01-01' AND (Store_ID = '15' OR Product_ID = '22');

-- Get sale ID and Units sold where transaction quantity > 10
SELECT Sale_ID, Units
FROM `sql-training-314708.maventoys.sales`
WHERE Units > 10;

-- Get sale ID, Units sold from transactions occurred in Jan 2017 
SELECT Sale_ID, Units
FROM `sql-training-314708.maventoys.sales`
WHERE Date BETWEEN '2017-01-01' AND '2017-01-31';

-- Get all records if product category is ‘Toys’ 
SELECT *
FROM `sql-training-314708.maventoys.product`
WHERE Product_Category = 'Toys';

-- Get all records if product name is ‘Dino’
SELECT *
FROM `sql-training-314708.maventoys.product`
WHERE Product_Category LIKE 'Dino';

-- Get all records if product name begins with ‘Dino’
SELECT *
FROM `sql-training-314708.maventoys.product`
WHERE Product_Category LIKE 'Dino%';

-- Get all records if product name contains ‘Dino’
SELECT *
FROM `sql-training-314708.maventoys.product`
WHERE Product_Category LIKE '%Dino%';

-- Get all records if product name does not contain ‘Dino’ 
SELECT *
FROM `sql-training-314708.maventoys.product`
WHERE Product_Name NOT LIKE 'Dino%';

-- Summarize rows with GROUP BY clause 
-- Get total of product sold, grouped by store ID 
SELECT Store_ID, SUM(Units)
FROM `sql-training-314708.maventoys.sales`
GROUP BY Store_ID;

-- Get total of product sold in March 2021 grouped by store ID and product ID 
SELECT Store_ID, Product_ID, SUM(Units)
FROM `sql-training-314708.maventoys.sales`
WHERE Date BETWEEN '2017-03-01' AND '2017-03-31'
GROUP BY Store_ID, Product_ID;

-- Get total of product sold in March 2021 grouped by store ID and product ID, units sold sorted from largest to smallest values 
SELECT Store_ID, Product_ID, SUM(Units)
FROM `sql-training-314708.maventoys.sales`
WHERE Date BETWEEN '2017-03-01' AND '2017-03-31'
GROUP BY Store_ID, Product_ID
ORDER BY SUM(Units) DESC;

-- Get top 5 total of product sold in March 2021 grouped by store ID and product ID, units sold sorted from largest to smallest values 
SELECT Store_ID, Product_ID, SUM(Units)
FROM `sql-training-314708.maventoys.sales`
WHERE Date BETWEEN '2017-03-01' AND '2017-03-31'
GROUP BY Store_ID, Product_ID
ORDER BY SUM(Units) DESC
LIMIT 5;

-- Get top 5 total of product sold in March 2021 grouped by store ID and product ID, sorted by store ID and units sold sorted from largest to smallest values 
SELECT Store_ID, Product_ID, SUM(Units)
FROM `sql-training-314708.maventoys.sales`
WHERE Date BETWEEN '2017-03-01' AND '2017-03-31'
GROUP BY Store_ID, Product_ID
ORDER BY Store_ID, SUM(Units) DESC
LIMIT 5;

-- Summarize rows with GROUP BY clause . Filter data after summarizing with HAVING clause and sort values from ORDER BY clause.  
-- Get top 5 total of product sold in March 2021 grouped by store ID and product ID, total units sold must be more than or equal to 10 units,  sorted by store ID and units sold sorted from largest to smallest values 
SELECT Store_ID, Product_ID, SUM(Units)
FROM `sql-training-314708.maventoys.sales`
WHERE Date BETWEEN '2017-03-01' AND '2017-03-31'
GROUP BY Store_ID, Product_ID
HAVING SUM(Units) >=10
ORDER BY Store_ID DESC, SUM(Units)
LIMIT 5;

CREATE TABLE WalmartData(
	Invoice_ID VARCHAR PRIMARY KEY,
    Branch VARCHAR(50),
    City VARCHAR(50),
    Customer_type VARCHAR(50),
    Gender VARCHAR(10),
    Product_line VARCHAR(100),
    Unit_price NUMERIC,
    Quantity INTEGER,
    Tax_5 NUMERIC,
    Total NUMERIC,
    Date DATE,
    Time TIME,
    Payment VARCHAR(50),
    cogs NUMERIC,
    gross_margin_percentage NUMERIC,
    gross_income NUMERIC,
    Rating NUMERIC
)

SET datestyle = 'DMY';

COPY WalmartData
FROM 'D:\WalmartData.csv'
DELIMITER ','
CSV HEADER;

SELECT *
FROM 
WalmartData
WHERE 
branch = 'A';

SELECT 
	product_line,
	SUM(Total) as Total_sales
from
WalmartData 
Group by
product_line;

SELECT *
FROM 
WalmartData
WHERE 
Payment = 'Cash';

SELECT 
	city,
	SUM(gross_income) as total_gross_income
from
WalmartData
group by 
city;

select
	Branch,
	avg(Rating) as avg_ratings
from WalmartData
group by 
Branch;

SELECT 
	product_line,
	SUM(Quantity) as Total_quantity
from
WalmartData 
Group by
product_line;

SELECT 
	product_line,
	Unit_price
from
WalmartData 
order by
Unit_price DESC
LIMIT 5;

SELECT 
	*
from
WalmartData
where
gross_income >30;

SELECT 
	*
from
WalmartData
where
EXTRACT(DOW FROM Date) IN (0,6);

SELECT 
    EXTRACT(YEAR FROM Date) AS Year,
    EXTRACT(MONTH FROM Date) AS Month,
    SUM(Total) AS Total_Sales,
    SUM(gross_income) AS Total_Gross_Income
FROM 
    WalmartData
GROUP BY 
    Year, Month
ORDER BY 
    Year, Month;

SELECT 
	*
from
WalmartData
where
EXTRACT(HOUR FROM Time) > 18;

SELECT *
FROM WalmartData
WHERE Total>(
	SELECT AVG(Total)
	FROM WalmartData
	);

SELECT 
	Branch,
	Date,
	gross_income,
    SUM(gross_income) OVER (PARTITION BY Branch ORDER BY Date) AS Cumulative_Gross_Income
FROM WalmartData
ORDER BY
Branch, Date;

SELECT
SUM(cogs) as Total_cogs,
City,
Customer_type
FROM
WalmartData
Group by
City, Customer_type;

